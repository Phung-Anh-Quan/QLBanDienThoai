package net.app.project.controllers;

import net.app.project.models.Product;
import net.app.project.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/products")
public class ShopGridController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String product(ModelMap model) {
        model.addAttribute("listProduct", productService.findAll());
        return "client/list-product";
    }

    @RequestMapping(value = "/item", method = RequestMethod.GET)
    public String productDetail(@RequestParam("id") int id, ModelMap model) {
        Product product = productService.findById(id);
        model.addAttribute("pTrend", product);
        return "client/pDetail";
    }
}
