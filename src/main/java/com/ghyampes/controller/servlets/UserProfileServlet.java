package com.ghyampes.controller.servlets;
import com.ghyampes.dao.UserDAO;
import com.ghyampes.model.User;
import com.ghyampes.utilities.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
@WebServlet("/UserProfileServlet")
public class UserProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(); User user = (User) session.getAttribute("user");
        if (user == null || !"member".equals(user.getRole())) { response.sendRedirect(request.getContextPath() + "/LoginServlet"); return; }
        request.getRequestDispatcher("/pages/profile.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(); User user = (User) session.getAttribute("user");
        if (user == null || !"member".equals(user.getRole())) { response.sendRedirect(request.getContextPath() + "/LoginServlet"); return; }
        String action = request.getParameter("action"); UserDAO userDAO = new UserDAO();
        if ("updateInfo".equals(action)) {
            String fullName = request.getParameter("fullName");
            if (fullName.matches(".*\\d.*")) {
                request.setAttribute("error", "Full name cannot contain numbers.");
                request.getRequestDispatcher("/pages/profile.jsp").forward(request, response); return;
            }
            user.setFullName(fullName);
            if (userDAO.updateProfile(user)) { session.setAttribute("user", user); request.setAttribute("msg", "Profile updated successfully."); } 
            else { request.setAttribute("error", "Failed to update profile."); }
        } else if ("updatePassword".equals(action)) {
            String newPassword = PasswordUtil.encrypt(request.getParameter("newPassword"));
            if (userDAO.updatePassword(user.getId(), newPassword)) { request.setAttribute("msg", "Password updated successfully."); } 
            else { request.setAttribute("error", "Failed to update password."); }
        }
        request.getRequestDispatcher("/pages/profile.jsp").forward(request, response);
    }
}