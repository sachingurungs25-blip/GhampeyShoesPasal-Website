package com.ghyampes.controller.servlets;
import com.ghyampes.dao.UserDAO;
import com.ghyampes.model.User;
import com.ghyampes.utilities.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet({"/RegisterServlet", "/register"})
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        UserDAO userDAO = new UserDAO();
        if(userDAO.isUsernameExists(username)) {
            request.setAttribute("error", "Username already exists. Please choose a different one.");
            request.getRequestDispatcher("/register.jsp").forward(request, response); return;
        }
        if(userDAO.isPhoneExists(phone)) {
            request.setAttribute("error", "Phone number already exists. Please use a different one.");
            request.getRequestDispatcher("/register.jsp").forward(request, response); return;
        }
        User user = new User(); user.setFullName(fullName); user.setUsername(username); user.setPhone(phone);
        user.setPassword(PasswordUtil.encrypt(request.getParameter("password")));
        if (userDAO.registerMember(user)) {
            request.getSession().setAttribute("msg", "Registration successful. You can now log in.");
            response.sendRedirect(request.getContextPath() + "/LoginServlet");
        } else {
            request.setAttribute("error", "Registration failed. Try again.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}