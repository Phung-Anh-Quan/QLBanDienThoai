package net.app.project.repository;

import net.app.project.models.Cart;
import net.app.project.models.CartItem;
import net.app.project.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
    CartItem findByProduct(Product product);
    List<CartItem> findAllByCart(Cart cart);
    CartItem findByCartAndProduct(Cart cart, Product product);

    void deleteByCart(Cart cart);
}
