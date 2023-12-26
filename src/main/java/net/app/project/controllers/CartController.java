package net.app.project.controllers;

import net.app.project.models.*;
import net.app.project.repository.OrderItemRepository;
import net.app.project.repository.OrderRepository;
import net.app.project.service.CartItemService;
import net.app.project.service.CartService;
import net.app.project.service.ProductService;
import net.app.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final CartService cartService;

    private final CartItemService cartItemService;

    private final UserService userService;

    private final ProductService productService;

    private final OrderRepository orderService;

    private final OrderItemRepository orderItemRepository;
    public CartController(CartService cartService, CartItemService cartItemService, UserService userService, ProductService productService, OrderRepository orderService, OrderItemRepository orderItemRepository) {
        this.cartService = cartService;
        this.cartItemService = cartItemService;
        this.userService = userService;
        this.productService = productService;
        this.orderService = orderService;
        this.orderItemRepository = orderItemRepository;
    }

    @GetMapping
    public String cart() {
        return "redirect:/cart/my-cart";
    }


    @GetMapping("/my-cart")
    public String cart(ModelMap modelMap) {
       var u = getCurrentUser();
        if (u != null) {
            modelMap.addAttribute("user", u);
            Cart cart = cartService.findByUser(u);
            if (cart != null) {
                modelMap.addAttribute("cart", cartItemService.findAllByCart(cart));
                modelMap.addAttribute("total", cart.getTotalPrice());
            }
            return "client/cart";
        }
        return "redirect:/login";
    }
    public User getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(authentication == null || authentication.getName() == null) {
            return null;
        }
        return userService.findByUsername(authentication.getName());
    }


    @GetMapping("/add")
    public String add(@RequestParam("pId") int id, ModelMap modelMap) {
        User u = getCurrentUser();
        if (u != null) {
            modelMap.addAttribute("user", u);
            Cart cart = cartService.findByUser(u);
            if (cart == null) {
                cart = new Cart();
                cart.setUser(u);

                CartItem cartItem = new CartItem();
                cartItem.setCart(cart);
                cartItem.setProduct(productService.findById(id));
                cartItem.setQuantity(1);
                cartItem.setTotalPrice(cartItem.getProduct().getPrice());
                cart.setTotalPrice(cartItem.getTotalPrice());
                cartService.save(cart);
                cartItemService.save(cartItem);
            } else {
                CartItem cartItem = cartItemService.findByCartAndProduct(cart, id);
                if (cartItem != null) {
                    cartItem.setQuantity(cartItem.getQuantity() + 1);
                    cartItem.setTotalPrice(cartItem.getTotalPrice() + cartItem.getProduct().getPrice());
                    cartItemService.save(cartItem);
                } else {
                    cartItem = new CartItem();
                    cartItem.setCart(cart);
                    cartItem.setProduct(productService.findById(id));
                    cartItem.setQuantity(1);
                    cartItem.setTotalPrice(cartItem.getProduct().getPrice());
                    cartItemService.save(cartItem);
                }
                cart.setTotalPrice(cart.getTotalPrice() + cartItem.getProduct().getPrice());
                cartService.save(cart);
            }
            return "redirect:/cart";
        }
        return "redirect:/login";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String remove(@RequestParam("id") int id) {
        User u = getCurrentUser();
        if (u != null) {
            Cart cart = cartService.findByUser(u);
            cart.setTotalPrice(cart.getTotalPrice() - cartItemService.findById(id).getTotalPrice());
            cartService.save(cart);
            cartItemService.deleteById(id);
        }
        return "redirect:/cart";
    }


    @RequestMapping(value = "/checkout", method = RequestMethod.GET)
    public String checkout(ModelMap modelMap) {
        User u = getCurrentUser();
        if (u != null) {
            modelMap.addAttribute("user", u);
            Cart cart = cartService.findByUser(u);
            if (cart != null) {
                modelMap.addAttribute("cart", cartItemService.findAllByCart(cart));
                modelMap.addAttribute("total", cart.getTotalPrice());
            }
            return "client/checkout";
        } else {
            return "redirect:/login";
        }
    }


    @Transactional
    @RequestMapping(value = "/payment", method = RequestMethod.POST)
    public String payment(ModelMap modelMap,
                          @RequestParam("fullName") String fullName,
                          @RequestParam("phone") String phone,
                          @RequestParam("address") String address,
                          @RequestParam("total_price") Double totalPrice) {
        User u = getCurrentUser();
        if (u != null) {
            Cart cart = cartService.findByUser(u);
            if (cart != null) {
                var cartItems = cartItemService.findAllByCart(cart);
                Order order = new Order();
                order.setName(fullName);
                order.setPhone(phone);
                order.setAddress(address);
                order.setStatus("Đang xử lý");
                order.setTotalPrice(totalPrice);
                order.setUser(u);
                orderService.save(order);

                for (CartItem cartItem : cartItems) {
                    OrderItem orderItem = new OrderItem();
                    orderItem.setOrder(order);
                    orderItem.setProduct(cartItem.getProduct());
                    orderItem.setQuantity(cartItem.getQuantity());
                    orderItem.setPrice(cartItem.getTotalPrice());
                    orderItemRepository.save(orderItem);
                }
                cartItemService.deleteByCart(cart);
                cartService.deleteByUser(u);
            }
            return "redirect:/cart";
        }
        return "redirect:/login";
    }
}
