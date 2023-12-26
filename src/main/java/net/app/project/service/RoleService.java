package net.app.project.service;


import net.app.project.models.Role;
import net.app.project.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {

    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }


    public Role getUserRole(){
        return roleRepository.findByRoleName("ROLE_USER");
    }
}
