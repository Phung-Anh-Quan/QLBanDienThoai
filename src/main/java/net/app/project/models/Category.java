package net.app.project.models;

import lombok.*;

import javax.persistence.*;


@Entity
@Table(name = "categories")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    private String categoryName;
    public Category(String categoryName) {
        this.categoryName = categoryName.trim();
    }
}
