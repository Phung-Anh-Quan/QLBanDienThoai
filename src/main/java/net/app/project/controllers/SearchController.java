package net.app.project.controllers;

import net.app.project.helper.HanleString;
import net.app.project.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/search")
public class SearchController {


    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/cate", method = RequestMethod.GET)
    public String searchByCategory(@RequestParam("category") int categoryId, ModelMap modelMap) {
        modelMap.addAttribute("listProduct", productService.findByCategory(categoryId));
        return "client/list-product";
    }


    @RequestMapping(value = "/name", method = RequestMethod.GET)
    public String searchByName(@RequestParam("name") String name, ModelMap modelMap) {
        if(name != null || !name.isEmpty()){
            name = HanleString.getInstance().removeDiacriticalMarks(name);
        }
        modelMap.addAttribute("listProduct", productService.findByName(name));
        return "client/list-product";
    }

}
