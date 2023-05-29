package com.example.bai_tap;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Display-Discount", value = "/display-discount")
public class DisplayDiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double discount_amount = price * discount * 0.01;
        request.setAttribute("Description", description);
        request.setAttribute("Price", price);
        request.setAttribute("Discount", discount);
        request.setAttribute("DiscountAmount", discount_amount);
        RequestDispatcher dispatcher = request.getRequestDispatcher("display-discount.jsp");
        dispatcher.forward(request, response);
    }
}
