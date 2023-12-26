package net.app.project.repository;

import net.app.project.models.Role;
import net.app.project.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsername(String username);

    User findById(int id);
    List<User> findAllByRole(Role role);
}
