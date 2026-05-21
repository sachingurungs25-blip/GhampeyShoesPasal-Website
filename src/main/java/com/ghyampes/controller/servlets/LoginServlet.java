package com.ghyampes.controller.servlets;
import com.ghyampes.dao.UserDAO;
import com.ghyampes.model.User;
import com.ghyampes.utilities.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/LoginServlet", "/login"})
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = PasswordUtil.encrypt(request.getParameter("password"));
        User user = new UserDAO().loginUser(username, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            if ("admin".equals(user.getRole())) { 
                response.sendRedirect("AdminDashboardServlet"); 
            } else { 
                response.sendRedirect(request.getContextPath() + "/HomeServlet"); 
            }
        } else {
            request.setAttribute("error", "Invalid username or password.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}