package com.foths.application.security.services;

import com.foths.application.models.AppRoles;
import com.foths.application.models.Roles;
import com.foths.application.models.User;
import com.foths.application.models.dto.UserProfileDTO;
import com.foths.application.repositories.RolesRepository;
import com.foths.application.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImplementation implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RolesRepository rolesRepository;

    @Override
    public User createUser(User user) {
//        User user = new User();
        user.setFirstName(user.getFirstName());
        user.setLastName(user.getLastName());
        user.setEmail(user.getEmail());
        user.setUsername(user.getUsername());
        user.setPassword(user.getPassword());

        return userRepository.save(user);
    }

    @Override
    public User updateUser(Integer id, User user) {
        User existingUser = userRepository.findById(id).orElseThrow(() ->
                new RuntimeException(STR."User not found with id: \{id}"));
        User updatedUser = userRepository.save(user);

        return user;
    }

    @Override
    public void updateUserRole(Long userId, String roleName) {
        User user = userRepository.findById(Math.toIntExact(userId)).orElseThrow(() ->
                new RuntimeException(STR."User not found with id: \{userId}"));
        AppRoles appRoles = AppRoles.valueOf(roleName);
        Roles roles = rolesRepository.findByRoleName(appRoles).orElseThrow(() ->
                new RuntimeException(STR."Role not found with name: \{roleName}"));

        user.setRoles(roles);
        userRepository.save(user);
    }

    @Override
    public void deleteUser(Integer id) {
        userRepository.deleteById(id);
    }

    @Override
    public List<User> getAllUsers() {
        return List.of();
    }

    @Override
    public UserProfileDTO getUserById(Long userId) {return null;}

    @Override
    public User getUserById(Integer id) {
        return (User) userRepository.findById(id).stream().toList();
    }
}
