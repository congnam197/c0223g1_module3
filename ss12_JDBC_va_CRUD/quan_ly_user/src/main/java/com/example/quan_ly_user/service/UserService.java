package com.example.quan_ly_user.service;

import com.example.quan_ly_user.model.User;
import com.example.quan_ly_user.repository.UserRepository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    UserRepository userRepository = new UserRepository();

    @Override
    public void create(User user) {
        userRepository.create(user);
    }

    @Override
    public User find(String country) {
        User user = userRepository.find(country);
        return user;
    }

    @Override
    public List<User> selectAllUser() {
        List<User> userList = userRepository.selectAllUser();
        return userList;
    }

    @Override
    public void update(int id, User user) throws SQLException {
        userRepository.updateUser(id, user);
    }

    @Override
    public void delete(int id) {
        userRepository.delete(id);
    }

    @Override
    public List<User> sortByName() {
        return userRepository.oderBy();
    }
}
