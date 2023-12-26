package net.app.project.repository;

import net.app.project.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    List<Category> findTop7ByOrderByCategoryIdDesc();
}
