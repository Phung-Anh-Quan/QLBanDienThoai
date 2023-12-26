package net.app.project.service;


import net.app.project.models.Role;
import net.app.project.models.User;
import net.app.project.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private final UserRepository userRepository;

    private final RoleService roleService;

    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public UserService(UserRepository userRepository, RoleService roleService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.roleService = roleService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }


    public void add(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRole(roleService.getUserRole());
        userRepository.save(user);
    }

    public void deleteUser(int id){
        User user = userRepository.findById(id);
        if(user != null){
            userRepository.delete(user);
        }

    }
    public List<User> findAllUsers(){
        Role role = roleService.getUserRole();
        return userRepository.findAllByRole(role);
    }
    public List<User> findAll() {
        return userRepository.findAll();
    }

    public User findById(int id) {
        return userRepository.findById(id);
    }

    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }


    public void delete(Integer id) {
        userRepository.deleteById(id);
    }

    public Page<User> getUserByPaginate(int currentPage, int pageSize) {
        Pageable p = PageRequest.of(currentPage, pageSize);
        return userRepository.findAll(p);
    }

    public void update(User userForm) {
        User user = userRepository.findById(userForm.getUserId());
        user.setUsername(userForm.getUsername());
        user.setPassword(bCryptPasswordEncoder.encode(userForm.getPassword()));
        user.setConfirmPassword(userForm.getConfirmPassword());
        user.setName(userForm.getName());
        user.setPhone(userForm.getPhone());
        user.setEmail(userForm.getEmail());
        user.setAddress(userForm.getAddress());
        userRepository.save(user);
    }
}
