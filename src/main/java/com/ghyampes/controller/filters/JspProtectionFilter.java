package com.ghyampes.controller.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"*.jsp"})
public class JspProtectionFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Since the filter is mapped to *.jsp, it intercepts all direct requests to JSP files.
        // Server-side forwards to JSP files (like request.getRequestDispatcher(...).forward(...))
        // do NOT trigger the filter by default (unless DispatcherType.FORWARD is configured).
        // So we can safely redirect the client to the appropriate servlet instead!
        
        String path = req.getServletPath();
        if (path.endsWith("login.jsp")) {
            res.sendRedirect(req.getContextPath() + "/LoginServlet");
        } else if (path.endsWith("register.jsp")) {
            res.sendRedirect(req.getContextPath() + "/RegisterServlet");
        } else if (path.endsWith("index.jsp")) {
            res.sendRedirect(req.getContextPath() + "/HomeServlet");
        } else if (path.endsWith("products.jsp")) {
            String cat = req.getParameter("category");
            res.sendRedirect(req.getContextPath() + "/ProductServlet" + (cat != null ? "?category=" + cat : ""));
        } else if (path.endsWith("product_details.jsp")) {
            String id = req.getParameter("id");
            res.sendRedirect(req.getContextPath() + "/ProductServlet" + (id != null ? "?id=" + id : ""));
        } else if (path.endsWith("cart.jsp")) {
            res.sendRedirect(req.getContextPath() + "/CartServlet");
        } else if (path.endsWith("checkout.jsp")) {
            res.sendRedirect(req.getContextPath() + "/CheckoutServlet");
        } else if (path.endsWith("checkout_success.jsp")) {
            res.sendRedirect(req.getContextPath() + "/CheckoutSuccessServlet");
        } else if (path.endsWith("profile.jsp")) {
            res.sendRedirect(req.getContextPath() + "/UserProfileServlet");
        } else if (path.endsWith("admin_dashboard.jsp")) {
            res.sendRedirect(req.getContextPath() + "/AdminDashboardServlet");
        } else if (path.endsWith("edit_product.jsp")) {
            String id = req.getParameter("id");
            res.sendRedirect(req.getContextPath() + "/ShoeServlet?action=showEdit" + (id != null ? "&id=" + id : ""));
        } else if (path.endsWith("about.jsp")) {
            res.sendRedirect(req.getContextPath() + "/AboutServlet");
        } else if (path.endsWith("careers.jsp")) {
            res.sendRedirect(req.getContextPath() + "/CareersServlet");
        } else if (path.endsWith("privacy.jsp")) {
            res.sendRedirect(req.getContextPath() + "/PrivacyServlet");
        } else if (path.endsWith("terms.jsp")) {
            res.sendRedirect(req.getContextPath() + "/TermsServlet");
        } else if (path.endsWith("contact.jsp")) {
            res.sendRedirect(req.getContextPath() + "/ContactServlet");
        } else if (path.endsWith("order_status.jsp")) {
            res.sendRedirect(req.getContextPath() + "/OrderStatusServlet");
        } else if (path.endsWith("returns.jsp")) {
            res.sendRedirect(req.getContextPath() + "/ReturnsServlet");
        } else if (path.endsWith("size_guide.jsp")) {
            res.sendRedirect(req.getContextPath() + "/SizeGuideServlet");
        } else {
            res.sendError(HttpServletResponse.SC_FORBIDDEN, "Direct access to JSP pages is forbidden.");
        }
    }

    @Override
    public void destroy() {}
}
