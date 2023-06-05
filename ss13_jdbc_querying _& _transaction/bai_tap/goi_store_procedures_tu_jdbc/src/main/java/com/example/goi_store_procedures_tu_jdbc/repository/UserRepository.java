package com.example.goi_store_procedures_tu_jdbc.repository;

import com.example.goi_store_procedures_tu_jdbc.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String FIND_ALL_USER = "CALL find_all();";
    private static final String UPDATE_USER = "call update_user(?,?,?,?);";
    private static final String DELETE_USER = "call remove_user(?);";
    private static final String CREATE_USER = "call add_user(?,?);";
    Connection connection = null;

    @Override
    public List<User> findAllUser() {
        List<User> list = new ArrayList<>();
        connection = BaseConnection.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_ALL_USER);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new User(name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void update(int id, User user) {
        connection = BaseConnection.getConnection();
        try (
                CallableStatement callableStatement = connection.prepareCall(UPDATE_USER)) {
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.setInt(4, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        connection = BaseConnection.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_USER);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void create(User user) {
        connection = BaseConnection.getConnection();
        Savepoint savepoint = null;
        try {
            connection.setAutoCommit(false);
            CallableStatement callableStatement = connection.prepareCall(CREATE_USER);
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.executeUpdate();
            savepoint = connection.setSavepoint("save_point_1");
            connection.commit();
            connection.rollback(savepoint);
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
