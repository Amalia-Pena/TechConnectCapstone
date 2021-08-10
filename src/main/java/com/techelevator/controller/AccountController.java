package com.techelevator.controller;

import com.techelevator.authentication.AuthProvider;

import com.techelevator.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;


/**
 * AccountController
 */
@Controller
public class AccountController {
    @Autowired
    private AuthProvider auth;

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
            return "redirect:/";
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

    @RequestMapping(path = "/register", method = RequestMethod.POST)
    public String register(@Valid @ModelAttribute("user") User user, BindingResult result, RedirectAttributes flash) {
        if (result.hasErrors()) {
            flash.addFlashAttribute("user", user);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
            flash.addFlashAttribute("message", "Please fix the following errors:");
            return "redirect:/register";
        }
        auth.register(user.getUsername(), user.getPassword(), user.getRole(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhotoPath());
        return "redirect:/";
    }

    //adding employee

    @RequestMapping(path = "/createEmployee", method = RequestMethod.GET)
    public String showAddEmployeePage(ModelMap modelHolder) {
        if(!modelHolder.containsAttribute("user")) {
            modelHolder.put("user", new User());
        }
        return "createEmployee";
    }

    @RequestMapping(path = "/createEmployee", method = RequestMethod.POST)
    public String addEmployee(@Valid @ModelAttribute("newEmployee") User user, BindingResult result, RedirectAttributes flash) {
        if (result.hasErrors()) {
            flash.addFlashAttribute("user", user);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "user", result);
            flash.addFlashAttribute("message", "Please fix the following errors:");
            return "redirect:/createEmployee";
        }
        auth.register(user.getUsername(), user.getPassword(), user.getRole(), user.getFirstName(), user.getLastName(), user.getEmail(), user.getPhotoPath());
        return "redirect:/";
    }
}
