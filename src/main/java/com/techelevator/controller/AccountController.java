package com.techelevator.controller;

import com.techelevator.authentication.AuthProvider;

import com.techelevator.authentication.UnauthorizedException;
import com.techelevator.dao.*;
import com.techelevator.dao.ExerciseClassDao;
import com.techelevator.model.*;
import org.apache.commons.io.FileUtils;
import org.bouncycastle.math.raw.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
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
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
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
    @Autowired
    private CategoryDao categoryDao;


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
            return "redirect:gymSession";

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
        auth.register(user.getUsername(), user.getPassword(), user.getRole(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhotoPath(), user.getHeight(), user.getWeight(), user.getDescription());
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
        auth.register(user.getUsername(), user.getPassword(), user.getRole(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhotoPath(), user.getHeight(), user.getWeight(), user.getDescription());
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
            return "loggedInHome";
        } else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path = "/startGymSession", method = RequestMethod.GET)
    public String startGymSession(ModelMap map) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"user", "admin", "employee"})) {
            if (!map.containsAttribute("user")) {
                map.put("user", new User());
            }
            map.put("user", auth.getCurrentUser());
            sessionDao.checkIn(auth.getCurrentUser().getId());
            auth.getSession().setAttribute("gymSession", sessionDao.getGymSession().getCheck_in());
            return "equipmentSelection";
        } else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path = "/endGymSession", method = RequestMethod.POST)
    public String endGymSessionCheckOut(ModelMap map) {

        sessionDao.checkOut(auth.getCurrentUser().getId());
        List<EquipmentUsage> equipmentUsageList = (List<EquipmentUsage>) auth.getSession().getAttribute("userEquipmentUsageList");
        for (int i = 0; i < equipmentUsageList.size(); i++) {
            equipmentUsageList.get(i).setSession_id(sessionDao.getGymSession().getSession_id());
            equipmentUsageDao.logEquipmentUsage(equipmentUsageList.get(i));
        }
        sessionDao.resetGymSession();
        auth.getSession().setAttribute("gymSession", null);
        auth.getSession().setAttribute("userEquipmentUsageList", new ArrayList<>());
        return "redirect:gymSession";
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
    public String register(@RequestParam String firstName, @RequestParam String lastName, @RequestParam String email, @RequestParam double height, @RequestParam double weight, @RequestParam (required = false) String description, @ModelAttribute("newEmployee") User user, BindingResult result, @RequestParam("photoPathContainer") MultipartFile photoPathContainer, @RequestParam(required = false) String radioButton, RedirectAttributes flash) throws IOException {

        if (result.hasErrors()) {
            flash.addFlashAttribute("user", userDao.getUser(auth.getCurrentUser().getId()));
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
            flash.addFlashAttribute("message", "Please fix the following errors:");
            return "redirect:profile";
        }

        if (photoPathContainer.isEmpty() && radioButton != null) {
            userDao.getUser(auth.getCurrentUser().getId()).setPhotoPath(null);
            userDao.updateUser(firstName, lastName, email, height, weight, null, auth.getCurrentUser().getId(), description);
            return "redirect:profile";
        } else if (photoPathContainer.isEmpty()) {
            userDao.updateUser(firstName, lastName, email, height, weight, userDao.getUser(auth.getCurrentUser().getId()).getPhotoPath(), auth.getCurrentUser().getId(), description);
            return "redirect:profile";
        } else {
            userDao.getUser(auth.getCurrentUser().getId()).setPhotoPath(photoPathContainer.getBytes());
            userDao.updateUser(firstName, lastName, email, height, weight, photoPathContainer.getBytes(), auth.getCurrentUser().getId(), description);
            return "redirect:profile";
        }
    }


    //View for Exercise Classes:


    //View for Exercise Classes:
    @RequestMapping(path = "/exerciseClasses", method = RequestMethod.GET)
    public String viewExerciseClasses(HttpServletRequest request) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "user", "employee"})) {
            auth.getSession().setAttribute("exerciseClassList", exerciseClassDao.getAllClasses());
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
        if (auth.userHasRole(new String[]{"admin", "employee"})) {
            return "EmployeeEquipmentMetric";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping("employeeEquipmentMetricList")
    public String searchEmployeeEquipmentList(@RequestParam double check_in, @RequestParam double check_out, ModelMap modelHolder) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "employee"})) {
            List<Equipment_Metric> employeeEquipmentMetric = equipmentMetricDao.getAllEquipmentMetricForEmployee(check_in, check_out);
            modelHolder.put("getAllEquipmentMetricForEmployee", employeeEquipmentMetric);
            auth.getSession().setAttribute("employeeEquipmentMetricStartMonth", getMonthName(check_in));
            auth.getSession().setAttribute("employeeEquipmentMetricEndMonth", getMonthName(check_out));
            return "EmployeeEquipmentMetric";
        } else {
            throw new UnauthorizedException();
        }
    }

    public String getMonthName(double monthValue) {
        if (monthValue == 1) {
            return "January";
        } else if (monthValue == 2) {
            return "February";
        } else if (monthValue == 3) {
            return "March";
        } else if (monthValue == 4) {
            return "April";
        } else if (monthValue == 5) {
            return "May";
        } else if (monthValue == 6) {
            return "June";
        } else if (monthValue == 7) {
            return "July";
        } else if (monthValue == 8) {
            return "August";
        } else if (monthValue == 9) {
            return "September";
        } else if (monthValue == 10) {
            return "October";
        } else if (monthValue == 11) {
            return "November";
        } else if (monthValue == 12) {
            return "December";
        }
        return null;
    }

    @RequestMapping("/gymMemberVisitMetrics")
    public String getVisitMetricSelectionPage(@RequestParam(required = false) String user_id, @RequestParam(required = false) String start_date, @RequestParam(required = false) String end_date, ModelMap map) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        map.put("allTimeMetric", workoutMetricDao.getMemberTotalGymTime(auth.getCurrentUser().getId()).getTotalGymTime());
        if (start_date != null && end_date != null) {
            map.put("averageTimeMetric", workoutMetricDao.getMemberAverageGymTime(auth.getCurrentUser().getId(), LocalDate.parse(start_date, formatter), LocalDate.parse(end_date, formatter)));
            map.put("start_date", start_date);
            map.put("end_date", end_date);
        } else if (start_date != null) {
            map.put("averageTimeMetric", workoutMetricDao.getMemberAverageGymTime(auth.getCurrentUser().getId(), LocalDate.parse(start_date, formatter), null));
            map.put("start_date", start_date);
            map.put("end", "");
        } else if (end_date != null) {
            map.put("averageTimeMetric", workoutMetricDao.getMemberAverageGymTime(auth.getCurrentUser().getId(), null, LocalDate.parse(end_date, formatter)));
            map.put("start_date", "");
            map.put("end", end_date);
        } else {
            map.put("averageTimeMetric", workoutMetricDao.getMemberAverageGymTime(auth.getCurrentUser().getId(), null, null));
            map.put("start_date", "");
            map.put("end", "");
        }
        map.put("defaultWeekMetric", workoutMetricDao.getVisitMetricsDefaultWeek(auth.getCurrentUser().getId()));
        getDefaultDayMetric();
        getDefaultWeekDates();
        getDefaultMonthView();
        getDefaultYearView();
        auth.getSession().setAttribute("defaultMonthMetric", workoutMetricDao.getVisitMetricsDefaultMonth(auth.getCurrentUser().getId(), (LocalDate) auth.getSession().getAttribute("defaultMonthStart"), (LocalDate) auth.getSession().getAttribute("defaultMonthEnd")));
        auth.getSession().setAttribute("defaultYearMetric", workoutMetricDao.getVisitMetricsDefaultYear(auth.getCurrentUser().getId(), (LocalDate) auth.getSession().getAttribute("defaultYearStart"), (LocalDate) auth.getSession().getAttribute("defaultYearEnd")));
        auth.getSession().setAttribute("defaultDayMetric", workoutMetricDao.getVisitMetricDefaultDay(auth.getCurrentUser().getId(), (LocalDate) auth.getSession().getAttribute("defaultDayStart")));
        return "GymMemberViewVisitMetrics";
    }

    public void getDefaultDayMetric() {
        LocalDate startDate = LocalDate.now();
        LocalDate endDate = startDate;
        auth.getSession().setAttribute("defaultDayStart", startDate);
        auth.getSession().setAttribute("defaultDayStart", endDate);
    }

    public void getDefaultWeekDates() {
        LocalDate startDate = LocalDate.now();
        LocalDate end_Date = null;
        int[] daysOfWeek = {1, 2, 3, 4, 5, 6, 7};
        for (int i = 0; i < daysOfWeek.length; i++) {
            if (daysOfWeek[i] == startDate.getDayOfWeek().getValue()) {
                startDate = startDate.minusDays(i);
                end_Date = startDate.plusDays(6 - i);
                break;
            }
        }
        auth.getSession().setAttribute("defaultWeekStart", startDate);
        auth.getSession().setAttribute("defaultWeekEnd", end_Date);
    }

    public void getDefaultMonthView() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-dd");
        LocalDate today = LocalDate.now();
        String thisMonth = String.valueOf(today.getMonthValue());
        String thisYear = String.valueOf(today.getYear());
        LocalDate startDate = LocalDate.parse(thisYear + "-" + thisMonth + "-01", formatter);
        LocalDate temp = today.plusMonths(1);
        LocalDate endDate = LocalDate.parse(thisYear + "-" + temp.getMonthValue() + "-01", formatter);
        endDate = endDate.minusDays(1);
        auth.getSession().setAttribute("defaultMonthStart", startDate);
        auth.getSession().setAttribute("defaultMonthEnd", endDate);
        auth.getSession().setAttribute("defaultMonthTotalDays", endDate.getDayOfMonth());
    }

    public void getDefaultYearView() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-dd");
        LocalDate today = LocalDate.now();
        String year = String.valueOf(today.minusMonths(11).getYear());
        String month = String.valueOf(today.minusMonths(11).getMonthValue());
        LocalDate startDate = LocalDate.parse(year + "-" + month + "-01", formatter);
        LocalDate temp = LocalDate.parse(today.getYear() + "-" + today.plusMonths(1).getMonthValue() + "-01", formatter);
        LocalDate endDate = LocalDate.parse(today.getYear() + "-" + today.getMonthValue() + "-" + temp.minusDays(1).getDayOfMonth(), formatter);
        auth.getSession().setAttribute("defaultYearStart", startDate);
        auth.getSession().setAttribute("defaultYearEnd", endDate);
    }

    @RequestMapping(value = "/gymMemberWorkoutMetrics", method = RequestMethod.GET)
    public String getWorkoutMetricView(@RequestParam(required = false) String user_id, @RequestParam(required = false) String yearValue, @RequestParam(required = false) String monthValue, @RequestParam(required = false) String dayValue) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"user", "admin", "employee"})) {
            if (user_id != null && monthValue == null) {
                auth.getSession().setAttribute("allGymSessions", sessionDao.getAllGymSessions(Long.valueOf(user_id)));
            } else if (user_id == null && monthValue == null) {
                auth.getSession().setAttribute("allGymSessions", sessionDao.getAllGymSessions(auth.getCurrentUser().getId()));
            } else {
                if (dayValue != null) {
                    auth.getSession().setAttribute("allGymSessions", sessionDao.getGymSessionsByMonthDay(auth.getCurrentUser().getId(), yearValue, monthValue, dayValue));
                } else {
                    auth.getSession().setAttribute("allGymSessions", sessionDao.getGymSessionsByMonth(auth.getCurrentUser().getId(), yearValue, monthValue));
                }
            }
            auth.getSession().setAttribute("allUsersList", userDao.getAllUsers());
            return "memberWorkoutMetric";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(value = "/gymSessionEquipmentMetrics", method = RequestMethod.GET)
    public String showEquipmentMetricsView(@RequestParam(required = false) Long session_id, @RequestParam(required = false) String yearValue, @RequestParam(required = false) String monthValue, @RequestParam(required = false) String dayValue) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"user", "admin", "employee"})) {
            if (yearValue == null) {
                auth.getSession().setAttribute("gymSessionEquipmentUsageMapStrength", equipmentDao.getEquipmentUsageList(equipmentUsageDao.getGymSessionEquipmentUsage(session_id), "strength"));
                auth.getSession().setAttribute("gymSessionEquipmentUsageMapCardio", equipmentDao.getEquipmentUsageList(equipmentUsageDao.getGymSessionEquipmentUsage(session_id), "cardio"));

            } else {
                auth.getSession().setAttribute("gymSessionEquipmentUsageMapStrength", equipmentDao.getEquipmentUsageList(equipmentUsageDao.getGymSessionEquipmentUsage(sessionDao.getSessionByDay(auth.getCurrentUser().getId(), yearValue, monthValue, dayValue)), "strength"));
                auth.getSession().setAttribute("gymSessionEquipmentUsageMapCardio", equipmentDao.getEquipmentUsageList(equipmentUsageDao.getGymSessionEquipmentUsage(sessionDao.getSessionByDay(auth.getCurrentUser().getId(), yearValue, monthValue, dayValue)), "cardio"));

            }

            return "memberWorkoutEquipmentMetric";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(value = "/showTest", method = RequestMethod.GET)
    public String showTest() throws UnauthorizedException {
        return "test";
    }



    @RequestMapping("adminMetrics")
    public String showAdminMetrics() throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "employee"})) {
            return "adminMetrics";
        }
        else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping("yourMetrics")
    public String showYourMetrics() throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "employee", "user"})) {
            return "yourMetrics";
        } else {
            throw new UnauthorizedException();
        }
    }

    @RequestMapping(path = "/rainbowKittenSurprise", method = RequestMethod.GET)
    public String showSecretPage() throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "employee", "user"})) {
        } else {
            throw new UnauthorizedException();
        }
        return "makeAdmin";
    }

    @RequestMapping(path = "/rainbowKittenSurprise", method = RequestMethod.POST)
    public String doSecretStuff(@RequestParam(required = false) String role, @RequestParam(required = false) String data) throws UnauthorizedException {
        if (auth.userHasRole(new String[]{"admin", "employee", "user"})) {
            if (role != null) {
                userDao.changeUserRole(auth.getCurrentUser().getId(), role);
            }
            if (data != null) {
                generateGymSessionData();
                generateEquipmentUsageData();
            }
        } else {
            throw new UnauthorizedException();
        }
        return "redirect:gymSession";
    }

    public void generateGymSessionData() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-M-dd");
        LocalDate today = LocalDate.now();
        String year = String.valueOf(today.minusMonths(11).getYear());
        String month = String.valueOf(today.minusMonths(11).getMonthValue());
        LocalDate startDate = LocalDate.parse(year + "-" + month + "-01", formatter);
        LocalDate temp = LocalDate.parse(today.getYear() + "-" + today.plusMonths(1).getMonthValue() + "-01", formatter);
        LocalDate endDate = LocalDate.parse(today.getYear() + "-" + today.getMonthValue() + "-" + temp.minusDays(1).getDayOfMonth(), formatter);
        String check_in = "";
        String check_out = "";

        for (int i = 0; i < 12; i++) {
            for (int j = 0; j < 13; j++) {
                check_in = startDate + " 12:" + getRandomNumber(20, 45) + ":36.772000";
                check_out = startDate + " 13:23:36.772000";
                sessionDao.createGymSession(auth.getCurrentUser().getId(), Timestamp.valueOf(check_in), Timestamp.valueOf(check_out));
                startDate = startDate.plusDays(2);
            }
            startDate = startDate.plusMonths(1);
        }
    }

    public void generateEquipmentUsageData() {
        List<Equipment> equipmentList = equipmentDao.getAllEquipment();
        List<Gym_Session> gymSessionList = sessionDao.getAllGymSessions(auth.getCurrentUser().getId());
        List<Equipment> cardioEquipmentList = equipmentDao.getAllCategoryEquipment("cardio");
        List<Long> cardioEquipmentIds = new ArrayList<>();

        for (int k = 0; k < cardioEquipmentList.size(); k++) {
            cardioEquipmentIds.add(cardioEquipmentList.get(k).getEquipment_id());
        }
        for (int i = 0; i < gymSessionList.size(); i++) {
            Timestamp equipmentUsageCheckIn = gymSessionList.get(i).getCheck_in();
            Timestamp equipmentUsageCheckOut = equipmentUsageCheckIn;
            Calendar cal = Calendar.getInstance();

            for (int j = 0; j < 4; j++) {
                int timeInterval = getRandomNumber(3, 9);
                EquipmentUsage newEquipmentUsage = new EquipmentUsage();
                newEquipmentUsage.setEquipment_id(equipmentList.get(getRandomNumber(0, equipmentList.size() - 1)).getEquipment_id());
                newEquipmentUsage.setSession_id(gymSessionList.get(i).getSession_id());

                if (cardioEquipmentIds.contains(newEquipmentUsage.getEquipment_id())) {
                    newEquipmentUsage.setDistance(getRandomNumber(1, 5));
                } else {
                    newEquipmentUsage.setReps(getRandomNumber(3, 10));
                    newEquipmentUsage.setWeight_per_rep(getRandomNumber(5, 200));
                }
                cal.setTimeInMillis(equipmentUsageCheckIn.getTime());
                newEquipmentUsage.setCheck_in(equipmentUsageCheckIn);
                cal.add(Calendar.MINUTE, timeInterval);
                equipmentUsageCheckOut = new Timestamp(cal.getTime().getTime());
                newEquipmentUsage.setCheck_out(equipmentUsageCheckOut);
                equipmentUsageCheckIn = equipmentUsageCheckOut;

                equipmentUsageDao.logEquipmentUsage(newEquipmentUsage);
            }
        }
    }

    public int getRandomNumber(int min, int max) {
        return (int) ((Math.random() * (max - min)) + min);
    }
}





