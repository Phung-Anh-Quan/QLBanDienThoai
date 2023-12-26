package net.app.project.config;


import net.app.project.models.Role;
import net.app.project.models.User;
import net.app.project.repository.RoleRepository;
import net.app.project.repository.UserRepository;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class DataSeeder implements ApplicationListener<ContextRefreshedEvent> {

    private final UserRepository userRepository;

    private final RoleRepository roleRepository;

    public DataSeeder(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        // add role
        if (roleRepository.findByRoleName("ROLE_ADMIN") == null) {
            Role role = new Role();
            role.setRoleName("ROLE_ADMIN");
            roleRepository.save(role);
        }
        if (roleRepository.findByRoleName("ROLE_USER") == null) {
            Role role = new Role();
            role.setRoleName("ROLE_USER");
            roleRepository.save(role);
        }

        // add user
        if (userRepository.findByUsername("admin") == null) {
            User user = new User();
            user.setUsername("admin");
            user.setName("Quản trị viên");
            user.setPassword(new BCryptPasswordEncoder().encode("123456Ab"));
            user.setRole(roleRepository.findByRoleName("ROLE_ADMIN"));
            userRepository.save(user);
        }
    }
}
