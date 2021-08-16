package com.techelevator.controller;

import com.techelevator.authentication.AuthProvider;

import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.dao.*;
import com.techelevator.dao.ExerciseClassDao;
import com.techelevator.model.*;
import org.apache.commons.io.FileUtils;
import org.bouncycastle.math.raw.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ResourceUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.Time;
import java.sql.Timestamp;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.springframework.util.MimeTypeUtils.MULTIPART_FORM_DATA_VALUE;


/**
 * AccountController
 */
@Controller
public class AccountController {
    @Autowired
    private AuthProvider auth;
    @Autowired
    private UserDao userDao;
    @Autowired
    private SessionDao sessionDao;
    @Autowired
    private ExerciseClassDao exerciseClassDao;
    @Autowired
    private EquipmentDao equipmentDao;
    @Autowired
    private AssistanceMediaDao assistanceMediaDao;
    @Autowired
    private EquipmentUsageDao equipmentUsageDao;
    @Autowired
    private EquipmentMetricDao equipmentMetricDao;
    @Autowired
    private WorkoutMetricDao workoutMetricDao;


    @RequestMapping(method = RequestMethod.GET, path = {"/", "/index"})
    public String index(ModelMap modelHolder) {
        modelHolder.put("user", auth.getCurrentUser());

        return "index";
    }

    @RequestMapping(path = "/login", method = RequestMethod.GET)
    public String login(ModelMap modelHolder) {
        return "login";
    }

    @RequestMapping(path = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String username, @RequestParam String password, RedirectAttributes flash) {
        if (auth.signIn(username, password)) {
            auth.getSession().setAttribute("gymSession", sessionDao.getGymSession().getCheck_in());
            auth.getSession().setAttribute("strengthEquipmentList", equipmentDao.getAllCategoryEquipment("strength"));
            auth.getSession().setAttribute("cardioEquipmentList", equipmentDao.getAllCategoryEquipment("cardio"));
            auth.getSession().setAttribute("userEquipmentUsageList", new ArrayList<>());
            return "redirect:home";

        } else {
            flash.addFlashAttribute("message", "Login Invalid");
            return "redirect:/login";
        }
    }

    @RequestMapping(path = "/logoff", method = RequestMethod.POST)
    public String logOff() {
        auth.logOff();
        return "redirect:/";
    }

    @RequestMapping(path = "/register", method = RequestMethod.GET)
    public String register(ModelMap modelHolder) {
        if (!modelHolder.containsAttribute("user")) {
            modelHolder.put("user", new User());
        }
        return "register";
    }

    @RequestMapping(path = "/register", method = RequestMethod.POST, consumes = {MULTIPART_FORM_DATA_VALUE})
    public String register(@Valid @ModelAttribute("user") User user, BindingResult result, @RequestParam("photoPathContainer") MultipartFile photoPathContainer, RedirectAttributes flash) throws IOException {
        if (result.hasErrors()) {
            flash.addFlashAttribute("user", user);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
            flash.addFlashAttribute("message", "Please fix the following errors:");
            return "redirect:/register";
        }

        if (photoPathContainer.isEmpty()) {
            user.setPhotoPath(null);
        } else {
            user.setPhotoPath(photoPathContainer.getBytes());
        }
        auth.register(user.getUsername(), user.getPassword(), user.getRole(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhotoPath(), user.getHeight(), user.getWeight());
        return "redirect:/";
    }

    //adding employee


    @RequestMapping(path = "/createEmployee", method = RequestMethod.GET)
    public String showAddEmployeePage(ModelMap modelHolder) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin"})) {
            if (!modelHolder.containsAttribute("user")) {
                modelHolder.put("user", new User());
            }
            return "createEmployee";


        } else {
            throw new UnauthorizedException();
        }

    }

    @RequestMapping(path = "/createEmployee", method = RequestMethod.POST)
    public String addEmployee(@Valid @ModelAttribute("newEmployee") User user, BindingResult result, RedirectAttributes flash) {
        if (result.hasErrors()) {
            flash.addFlashAttribute("user", user);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
            flash.addFlashAttribute("message", "Please fix the following errors:");
            return "redirect:/createEmployee";
        }
        auth.register(user.getUsername(), user.getPassword(), user.getRole(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhotoPath(), user.getHeight(), user.getWeight());
        return "redirect:/";
    }

    @RequestMapping(path = "/profile", method = RequestMethod.GET)
    public String showProfilePage(ModelMap modelHolder) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"user", "admin", "employee"})) {
            if (!modelHolder.containsAttribute("user")) {
                modelHolder.put("user", new User());
            }
            modelHolder.put("user", userDao.getUser(auth.getCurrentUser().getId()));
            return "profile";
        } else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path = "/profile/image", method = RequestMethod.GET)
    public ResponseEntity<byte[]> getDepartmentImage(@RequestParam("userName") String userName) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        BufferedImage img;
        headers.setContentType(MediaType.IMAGE_PNG);
        headers.setCacheControl(CacheControl.noCache().getHeaderValue());
        byte[] media = userDao.getUser(auth.getCurrentUser().getId()).getPhotoPath();
        if (media == null) {
            media = FileUtils.readFileToByteArray(ResourceUtils.getFile("classpath:../../img/150.png"));
        }
        return new ResponseEntity<>(media, headers, HttpStatus.OK);
    }

    @RequestMapping(path = "/gymSession", method = RequestMethod.GET)
    public String showGymSession(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"user", "admin", "employee"})) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            sessionDao.checkIn(auth.getCurrentUser().getId());
            auth.getSession().setAttribute("gymSession", sessionDao.getGymSession().getCheck_in());
            return "loggedInHome";
        } else {
            throw new UnauthorizedException();
        }
    }


    @RequestMapping(path = "/editProfile", method = RequestMethod.GET)
    public String showEditProfilePage(ModelMap modelHolder) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"user", "admin", "employee"})) {
            if (!modelHolder.containsAttribute("user")) {
                modelHolder.put("user", new User());
            }
            modelHolder.put("user", userDao.getUser(auth.getCurrentUser().getId()));
            return "editProfile";
        } else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path = "/editProfile", method = RequestMethod.POST, consumes = {MULTIPART_FORM_DATA_VALUE})
    public String register(@RequestParam String firstName, @RequestParam String lastName, @RequestParam String email, @RequestParam double height, @RequestParam double weight, @ModelAttribute("newEmployee") User user, BindingResult result, @RequestParam("photoPathContainer") MultipartFile photoPathContainer, @RequestParam(required = false) String radioButton, RedirectAttributes flash) throws IOException {

        if (result.hasErrors()) {
            flash.addFlashAttribute("user", userDao.getUser(auth.getCurrentUser().getId()));
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
            flash.addFlashAttribute("message", "Please fix the following errors:");
            return "redirect:profile";
        }

        if (photoPathContainer.isEmpty() && radioButton != null) {
            userDao.getUser(auth.getCurrentUser().getId()).setPhotoPath(null);
            userDao.updateUser(firstName, lastName, email, height, weight, null, auth.getCurrentUser().getId());
            return "redirect:profile";
        } else if (photoPathContainer.isEmpty()) {
            userDao.updateUser(firstName, lastName, email, height, weight, userDao.getUser(auth.getCurrentUser().getId()).getPhotoPath(), auth.getCurrentUser().getId());
            return "redirect:profile";
        } else {
            userDao.getUser(auth.getCurrentUser().getId()).setPhotoPath(photoPathContainer.getBytes());
            userDao.updateUser(firstName, lastName, email, height, weight, photoPathContainer.getBytes(), auth.getCurrentUser().getId());
            return "redirect:profile";
        }
    }


    //View for Exercise Classes:


    //View for Exercise Classes:
    @RequestMapping(path = "/exerciseClasses", method = RequestMethod.GET)
    public String viewExerciseClasses(HttpServletRequest request) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "user", "employee"})) {
            request.setAttribute("exerciseClass", exerciseClassDao.getAllClasses());
            request.setAttribute("sourceUrl", "exerciseClass");
            return "exerciseClass";
        }
        else {
            throw new UnauthorizedException();
        }
    }


    //View for Gym Equipment Help Home Page:

    @RequestMapping(path = "/GymEquipmentHelp", method = RequestMethod.GET)
    public String viewGymEquipmentHelpBenchPress(ModelMap map, @RequestParam Long equipment_id) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "user", "employee"})) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            map.put("equipment_photoPath", assistanceMediaDao.getAssistanceMedia(equipment_id).getPhoto_link());
            map.put("equipment_photoName", assistanceMediaDao.getAssistanceMedia(equipment_id).getPhoto_name());
            map.put("equipment_name", equipmentDao.getEquipment(equipment_id).getName());
            return "gymEquipmentHelp";
        } else {
            throw new UnauthorizedException();
        }
    }


    @RequestMapping(path = "/gymSession", method = RequestMethod.POST)
    public String showGymSessionCheckOut(ModelMap map) {

        sessionDao.checkOut(auth.getCurrentUser().getId());
        List<EquipmentUsage> equipmentUsageList = (List<EquipmentUsage>) auth.getSession().getAttribute("userEquipmentUsageList");
        for (int i = 0; i < equipmentUsageList.size(); i++) {
            equipmentUsageList.get(i).setSession_id(sessionDao.getGymSession().getSession_id());
            equipmentUsageDao.logEquipmentUsage(equipmentUsageList.get(i));
        }
        sessionDao.resetGymSession();
        auth.getSession().setAttribute("gymSession", sessionDao.getGymSession().getCheck_in());
        List<EquipmentUsage> list = new ArrayList<>();
        auth.getSession().setAttribute("userEquipmentUsageList", list);
        return "redirect:home";
    }

    @RequestMapping(path = "/home", method = RequestMethod.GET)
    public String showLogInHomePage(ModelMap modelHolder, HttpSession session) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "user", "employee"})) {
            if (!modelHolder.containsAttribute("user")) {
                modelHolder.put("user", new User());
            }
            return "loggedInHome";
        } else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path = "/equipmentSelection", method = RequestMethod.GET)
    public String showEquipmentSelectionPage(ModelMap modelHolder, HttpSession session) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "user", "employee"})) {
            if (!modelHolder.containsAttribute("user")) {
                modelHolder.put("user", new User());
            }
            return "equipmentSelection";
        } else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path = "/logEquipmentUse", method = RequestMethod.GET)
    public String showLogEquipmentUse(ModelMap modelHolder, @RequestParam Long equipmentSelect) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "user", "employee"})) {
            if (!modelHolder.containsAttribute("user")) {
                modelHolder.put("user", new User());
                modelHolder.put("equipmentUsage", new EquipmentUsage());
            }
            modelHolder.put("equipment_id", equipmentSelect);
            Timestamp ts = new Timestamp(System.currentTimeMillis());
            auth.getSession().setAttribute("equipment_check_in", ts);
            auth.getSession().setAttribute("equipmentSelection", equipmentSelect);
            auth.getSession().setAttribute("equipment", equipmentDao.getEquipment(equipmentSelect));
            return "logEquipmentUse";
        } else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path = "/logEquipmentUse", method = RequestMethod.POST)
    public String saveLogSEquipmentUse(@Valid @ModelAttribute("equipmentUsage") EquipmentUsage equipmentUsage, BindingResult result, RedirectAttributes flash, ModelMap modelHolder) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "user", "employee"})) {
            if (result.hasErrors()) {
                flash.addFlashAttribute("equipmentUsage", equipmentUsage);
                flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "equipmentUsage", result);
                flash.addFlashAttribute("message", "Please fix the following errors:");

                return "redirect:logEquipmentUse?equipmentSelect=" + auth.getSession().getAttribute("equipmentSelection");
            }
            List<EquipmentUsage> list = (List<EquipmentUsage>) auth.getSession().getAttribute("userEquipmentUsageList");
            equipmentUsage.setEquipment_id((Long) auth.getSession().getAttribute("equipmentSelection"));
            equipmentUsage.setCheck_in((Timestamp) auth.getSession().getAttribute("equipment_check_in"));
            Timestamp ts = new Timestamp(System.currentTimeMillis());
            equipmentUsage.setCheck_out(ts);
            list.add(equipmentUsage);
            auth.getSession().setAttribute("userEquipmentUsageList", list);
        } else {
            throw new UnauthorizedException();
        }
        return "redirect:equipmentSelection";
    }

    @RequestMapping("employeeEquipmentMetric")
    public String showEmployeeEquipmentMetric() throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "user", "employee"})) {
            return "EmployeeEquipmentMetric";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping("employeeEquipmentMetricList")
    public String searchEmployeeEquipmentList(@RequestParam double check_in, @RequestParam double check_out, ModelMap modelHolder) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "user", "employee"})) {
            List<Equipment_Metric> employeeEquipmentMetric = equipmentMetricDao.getAllEquipmentMetricForEmployee(check_in, check_out);
            modelHolder.put("getAllEquipmentMetricForEmployee", employeeEquipmentMetric);
            return "EmployeeEquipmentMetric";
        }
        else {
            throw new UnauthorizedException();
        }
    }
}





