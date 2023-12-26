package net.app.project.repository;


import net.app.project.models.Cart;
import net.app.project.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<Cart, Integer> {
    Cart findByUser(User user);

    void deleteByUser(User user);
}
