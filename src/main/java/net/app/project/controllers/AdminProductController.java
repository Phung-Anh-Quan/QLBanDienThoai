package net.app.project.controllers;


import net.app.project.dto.ProductDTO;
import net.app.project.service.CategoryService;
import net.app.project.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.logging.Logger;

@Controller
@RequestMapping("/admin/product")
public class AdminProductController {
    private final String path = "/web/images/";
    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(ModelMap model) {
        model.addAttribute("categories", categoryService.findAll());
        return "admin/add-product";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@RequestParam("name") String name,
                      @RequestParam("price") Double price,
                      @RequestParam("description") String description,
                      @RequestParam("imageUrl") MultipartFile file,
                      @RequestParam("categoryId") int categoryId) {

        ProductDTO productDTO = new ProductDTO();
        productDTO.setName(name);
        productDTO.setPrice(price);
        productDTO.setDescription(description);

        if (!file.isEmpty()) {
            productService.save(file);
            productDTO.setImageUrl(path + file.getOriginalFilename());
        }

        productDTO.setCategoryId(categoryId);
        productService.add(productDTO);
        return "redirect:/admin/product";
    }


    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(ModelMap model, @RequestParam("id") int id) {
        model.addAttribute("product", productService.findById(id));
        model.addAttribute("categories", categoryService.findAll());
        return "admin/edit-product";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@RequestParam("productId") int productId,
                       @RequestParam("name") String name,
                       @RequestParam("price") Double price,
                       @RequestParam("description") String description,
                       @RequestParam("imageUrl") MultipartFile file,
                       @RequestParam("categoryId") int categoryId) {

        ProductDTO productDTO = new ProductDTO();
        productDTO.setProductId(productId);
        productDTO.setName(name);
        productDTO.setPrice(price);
        productDTO.setDescription(description);
        if (!file.isEmpty()) {
            productService.save(file);
            productDTO.setImageUrl(path + file.getOriginalFilename());
        }
        productDTO.setCategoryId(categoryId);
        productService.edit(productDTO);
        return "redirect:/admin/product";
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam("id") int id) {
        productService.deleteById(id);
        return "redirect:/admin/product";
    }
    @GetMapping
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("listProduct", productService.findAll());
        return "admin/product";
    }

}
