package com.example.goi_store_procedures_tu_jdbc.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseConnection {
        private static String jdbcURL = "jdbc:mysql://localhost:3306/quan_ly_user";
        private static String jdbcUsername = "root";
        private static String jdbcPassword = "codegym";

        protected static Connection getConnection() {
            Connection connection = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            return connection;
        }
    }

