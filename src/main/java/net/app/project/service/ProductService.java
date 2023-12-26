package net.app.project.service;


import net.app.project.dto.ProductDTO;
import net.app.project.models.Category;
import net.app.project.models.Product;
import net.app.project.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final Path root = Paths.get("src/main/resources/static/web/images");
    private final CategoryService categoryService;

    public ProductService(ProductRepository productRepository, CategoryService categoryService) {
        this.productRepository = productRepository;
        this.categoryService = categoryService;
    }

    public void save(MultipartFile file) {
        try {
            Files.copy(file.getInputStream(), root.resolve(Objects.requireNonNull(file.getOriginalFilename())), StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void add(ProductDTO productDto) {
        Product product = new Product();
        product.setName(productDto.getName());
        product.setDescription(productDto.getDescription());
        product.setPrice(productDto.getPrice());
        Optional<Category> cate = categoryService.findById(productDto.getCategoryId());
        if (cate.isPresent()) {
            product.setCategory(cate.get());
        }
        product.setImageUrl(productDto.getImageUrl());
        productRepository.save(product);
    }

    public void save(Product product) {
        productRepository.save(product);
    }

    public List<Product> findAll() {
        return productRepository.findAll();
    }

    public Product findById(int id) {
        return productRepository.findById(id).get();
    }

    public void deleteById(int id) {
        productRepository.deleteById(id);
    }

    public void update(Product product) {
        productRepository.save(product);
    }

    public List<Product> findByCategory(int category) {
        return productRepository.findByCategory(categoryService.findById(category).get());
    }

    public List<Product> findByCategoryAndPrice(String category, double price) {
        return productRepository.findByCategoryAndPrice(category, price);
    }

    public List<Product> findByPrice(double price) {
        return productRepository.findByPrice(price);
    }

    public void edit(ProductDTO productDto) {
        Product product = new Product();
        product.setProductId(productDto.getProductId());
        product.setName(productDto.getName());
        product.setDescription(productDto.getDescription());
        product.setPrice(productDto.getPrice());
        Optional<Category> cate = categoryService.findById(productDto.getCategoryId());
        if (cate.isPresent()) {
            product.setCategory(cate.get());
        }
        product.setImageUrl(productDto.getImageUrl());
        productRepository.save(product);
    }


    // get top 8 latest products
    public List<Product> findTop8ByOrderByProductIdDesc() {
        return productRepository
                .findTop8ByOrderByProductIdDesc()
                .stream()
                .limit(12)
                .collect(Collectors.toList());
    }

    public List<Product> findByName(String name) {
        try {
            return productRepository.findByNameContaining(name);
        } catch (Exception e) {
            return null;
        }
    }
}
