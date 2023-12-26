package net.app.project.service;

import net.app.project.models.Category;
import net.app.project.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public void add(String categoryName){
        Category category = new Category(categoryName);
        categoryRepository.save(category);
    }
    public List<Category> findAll(){
        return categoryRepository.findAll();
    }
    public Optional<Category> findById(int id){
        return categoryRepository.findById(id);
    }
    public Category save(Category category){
        return categoryRepository.save(category);
    }

    public List<Category> findTop7ByOrderByCategoryIdDesc(){
        return categoryRepository
                .findTop7ByOrderByCategoryIdDesc()
                .stream()
                .limit(7)
                .collect(Collectors.toList());
    }
    public void delete(int id){
        Optional<Category> category = categoryRepository.findById(id);
        if(category.isPresent()){
            categoryRepository.deleteById(id);
        }
    }
}
