package com.example.goi_store_procedures_tu_jdbc.controller;

import com.example.goi_store_procedures_tu_jdbc.model.User;
import com.example.goi_store_procedures_tu_jdbc.service.IUserService;
import com.example.goi_store_procedures_tu_jdbc.service.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    IUserService iUserService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                showEditForm(request, response);
                break;
            case "create":
                showCreateForm(request, response);
                break;
            default:
                list(request, response);
                break;
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void list(HttpServletRequest request, HttpServletResponse response) {
        List<User> list = iUserService.findAllUser();
        request.setAttribute("list", list);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/edit.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                update(request, response);
            case "delete":
                delete(request, response);
            case "create":
                save(request, response);
                break;
            default:
                list(request, response);
                break;
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        iUserService.create(user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/create.jsp");
        try {
            dispatcher.forward(request, response);
            response.sendRedirect("/user");
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        request.setAttribute("id", id);
        iUserService.delete(id);
        try {
            response.sendRedirect("/user");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        try {
            iUserService.update(id, user);
            response.sendRedirect("/user");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
