package net.app.project.models;


import lombok.*;

import javax.persistence.*;

@Entity
@Table(name = "products")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int productId;
    private String name;

    @Column(columnDefinition = "varchar(2000)") // Set maximum length to 2000
    private String description;
    private double price;

    private String imageUrl;
    @ManyToOne
    @JoinColumn(name = "categoryId")
    private Category category;
}
