package net.app.project.repository;

import net.app.project.models.Category;
import net.app.project.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    List<Product> findByCategory(Category category);

    List<Product> findByCategoryAndPrice(String category, double price);

    List<Product> findByPrice(double price);

    List<Product> findTop8ByOrderByProductIdDesc();

    @Query("SELECT p FROM Product p WHERE LOWER(p.name) LIKE LOWER(CONCAT('%', :name, '%'))")
    List<Product> findByNameContaining(String name);
}
