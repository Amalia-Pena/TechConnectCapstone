package com.techelevator.controller;

import com.techelevator.authentication.AuthProvider;

import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.dao.ExerciseClassDao;
import com.techelevator.dao.SessionDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.User;
import org.apache.commons.io.FileUtils;
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
import javax.validation.Valid;

import java.awt.image.BufferedImage;
import java.io.IOException;

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
            return "redirect:profile";
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
            modelHolder.put("user", auth.getCurrentUser());
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
        byte[] media = auth.getCurrentUser().getPhotoPath();
        if (media == null) {
            media = FileUtils.readFileToByteArray(ResourceUtils.getFile("classpath:../../img/150.png"));
        }
        return new ResponseEntity<>(media, headers, HttpStatus.OK);
    }

    @RequestMapping(path = "/gymSession", method = RequestMethod.GET)
    public String showGymSession(ModelMap map) {
        if (!map.containsAttribute("user")) {
            map.put("user", new User());
        }
        map.put("user", auth.getCurrentUser());
        sessionDao.checkIn(auth.getCurrentUser().getId());
        return "index";
    }
    @RequestMapping(path = "/gymSession", method = RequestMethod.POST)
    public String showGymSessionCheckOut(ModelMap map) {
        sessionDao.checkOut(auth.getCurrentUser().getId());
        return "redirect:/";
    }





    //View for Exercise Classes:
    @RequestMapping(path ="/exerciseClasses", method = RequestMethod.GET)
    public String viewExerciseClasses(HttpServletRequest request) {
        request.setAttribute("exerciseClass", exerciseClassDao.getAllClasses());
        request.setAttribute("sourceUrl", "exerciseClass");
        return "exerciseClass";
    }


    //View for Gym Equipment Help Home Page:
    @RequestMapping(path ="/GymEquipmentHelp", method = RequestMethod.GET)
    public String viewGymEquipmentHelpHomePage(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "user", "employee"})) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelp";
        } else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpBenchPress", method = RequestMethod.GET)
    public String viewGymEquipmentHelpBenchPress(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpBenchPress";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpBicepCurlMachine", method = RequestMethod.GET)
    public String viewGymEquipmentHelpBicepCurlMachine(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpBicepCurlMachine";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpCalfMachine", method = RequestMethod.GET)
    public String viewGymEquipmentHelpCalfMachine(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpCalfMachine";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpHammerStrengthMachine", method = RequestMethod.GET)
    public String viewGymEquipmentHelpHammerStrengthMachine(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpHammerStrengthMachine";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpInclineBenchPress", method = RequestMethod.GET)
    public String viewGymEquipmentHelpInclineBenchPress(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpInclineBenchPress";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpLatPulldown", method = RequestMethod.GET)
    public String viewGymEquipmentHelpLatPulldown(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpLatPulldown";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpLegCurlMachine", method = RequestMethod.GET)
    public String viewGymEquipmentHelpLegCurlMachine(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpLegCurlMachine";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpLegExtensionMachine", method = RequestMethod.GET)
    public String viewGymEquipmentHelpLegExtensionMachine(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpLegExtensionMachine";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpLegPressMachine", method = RequestMethod.GET)
    public String viewGymEquipmentHelpLegPressMachine(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpLegPressMachine";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpPeckDeckMachine", method = RequestMethod.GET)
    public String viewGymEquipmentHelpPeckDeckMachine(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpPeckDeckMachine";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpPreacherBench", method = RequestMethod.GET)
    public String viewGymEquipmentHelpPreacherBench(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpPreacherBench";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpPullupBar", method = RequestMethod.GET)
    public String viewGymEquipmentHelpPullupBar(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpPullupBar";
        }
        else {
            throw new UnauthorizedException();
        }
    }


    @RequestMapping(path ="/GymEquipmentHelpStationaryBike", method = RequestMethod.GET)
    public String viewGymEquipmentHelpStationaryBike(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpStationaryBike";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path ="/GymEquipmentHelpTreadmill", method = RequestMethod.GET)
    public String viewGymEquipmentHelpTreadmill(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[] { "admin", "user", "employee" })) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            return "gymEquipmentHelpTreadmill";
        }
        else {
            throw new UnauthorizedException();
        }
    }




}
