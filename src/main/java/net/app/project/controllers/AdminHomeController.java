package net.app.project.controllers;


import net.app.project.models.User;
import net.app.project.service.UserService;
import net.app.project.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
@Controller
@RequestMapping("/admin")
public class AdminHomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @GetMapping
    public String index() {
        return "admin/index";
    }

    // Request

    // /admin/account
    @GetMapping("/account")
    public String account(Model model) {
        model.addAttribute("listUser", userService.findAllUsers());
        return "admin/account";
    }

    @GetMapping("/account/add")
    public String accountAdd(Model model) {
        model.addAttribute("user", new User());
        return "admin/add-account";
    }

    @PostMapping("/account/add")
    public String addAccount(@ModelAttribute("user") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "admin/add-account";
        }
        userService.add(userForm);
        return "redirect:/admin/account";
    }


    // put or patch
    @RequestMapping(value = "/account/edit", method = RequestMethod.GET)
    public String accountEdit(@RequestParam int id, ModelMap model) {
        User user = userService.findById(id);
        model.put("user", user);
        return "admin/edit-account";
    }

    @RequestMapping(value = "account/edit", method = RequestMethod.POST)
    public String editAccount(@ModelAttribute("user") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "admin/edit-account";
        }
        userService.update(userForm);
        return "redirect:/admin/account";
    }

    @RequestMapping(value = "/account/delete", method = RequestMethod.GET)
    public String accountDelete(@RequestParam int id, ModelMap model) {
        userService.delete(id);
        return "redirect:/admin/account";
    }
}
