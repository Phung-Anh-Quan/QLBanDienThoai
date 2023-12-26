package net.app.project.service;


import net.app.project.models.Cart;
import net.app.project.models.User;
import net.app.project.repository.CartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CartService {

    private final CartRepository cartRepository;

    public CartService(CartRepository cartRepository) {
        this.cartRepository = cartRepository;
    }

    public void save(Cart cart) {
        cartRepository.save(cart);
    }

    public Cart findByUser(User user) {
        return cartRepository.findByUser(user);
    }


    @Transactional
    public void deleteByUser(User user) {
        cartRepository.deleteByUser(user);
    }

}
