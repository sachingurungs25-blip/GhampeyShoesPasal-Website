package com.ghyampes.controller.filters;

import com.ghyampes.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/AdminDashboardServlet", "/AdminUserServlet", "/ShoeServlet"})
public class AdminFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        boolean loggedIn = (session != null && session.getAttribute("user") != null);
        if (loggedIn) {
            User user = (User) session.getAttribute("user");
            if ("admin".equals(user.getRole())) {
                chain.doFilter(request, response);
                return;
            }
        }
        res.sendRedirect(req.getContextPath() + "/LoginServlet");
    }
}
