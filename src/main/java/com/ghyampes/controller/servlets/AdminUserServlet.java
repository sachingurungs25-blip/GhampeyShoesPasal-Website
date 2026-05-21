package com.ghyampes.controller.servlets;

import com.ghyampes.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/AdminUserServlet")
public class AdminUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("approve".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            new UserDAO().approveMember(id);
        }
        response.sendRedirect("AdminDashboardServlet");
    }
}
