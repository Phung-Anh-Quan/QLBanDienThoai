package net.app.project.controllers;

import net.app.project.models.Category;
import net.app.project.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/category")
public class AdminCategoryController {

    private final CategoryService categoryService;

    public AdminCategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping
    public String category(ModelMap model) {
        List<Category> categories = categoryService.findAll();
        model.addAttribute("listCategory", categories);
        return "admin/category";
    }


    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String addCategory(ModelMap model){
        model.addAttribute("cate",new Category());
        return "admin/add-category";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addCategory(Category category){
        categoryService.save(category);
        return "redirect:/admin/category";
    }

    @RequestMapping(value = "edit", method = RequestMethod.GET)
    public String editCategory(@RequestParam int id, ModelMap model){
        Optional<Category> category = categoryService.findById(id);
        if(category.isPresent()){
            model.put("cate",category.get());
        } else {
            return "redirect:/admin/category";
        }
        return "admin/edit-category";
    }
    @RequestMapping(value = "edit", method = RequestMethod.POST)
    public String editCategory(@RequestParam Category category){
        categoryService.save(category);
        return "redirect:/admin/category";
    }
    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String deleteCategory(@RequestParam int id){
        categoryService.delete(id);
        return "redirect:/admin/category";
    }
}
