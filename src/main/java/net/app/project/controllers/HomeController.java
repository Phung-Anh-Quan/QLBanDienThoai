package net.app.project.controllers;


import net.app.project.models.User;
import net.app.project.service.CategoryService;
import net.app.project.service.ProductService;
import net.app.project.service.UserService;
import net.app.project.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private CategoryService categoryService;


    @Autowired
    private ProductService productService;

//    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
@GetMapping(  "/home" )
    public String home(ModelMap model) {
        User u = getCurrentUser();
        if (u != null) {
            model.addAttribute("user", u);
        }
        model.addAttribute("categories", categoryService.findTop7ByOrderByCategoryIdDesc());
        model.addAttribute("trendingItem", productService.findTop8ByOrderByProductIdDesc());
        return "client/index";
    }

    public User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return userService.findByUsername(authentication.getName());
    }

    @GetMapping("/signup")
    public String signup(Model model) {
        model.addAttribute("userForm", new User());
        return "client/signup";
    }

    @PostMapping("/signup")
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "client/signup";
        }
        userService.add(userForm);
        return "redirect:/home";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng.");
        }
        if (logout != null) {
            model.addAttribute("logout", "Bạn đăng xuất thành công");
        }
        return "client/login";
    }

    @GetMapping("/blog")
    public String blog(ModelMap model) {
        User u = getCurrentUser();
        if (u != null) {
            model.addAttribute("user", u);
        }
        return "client/blog";
    }
}
