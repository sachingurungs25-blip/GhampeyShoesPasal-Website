package com.ghyampes.controller.servlets;
import com.ghyampes.dao.ShoeDAO;
import com.ghyampes.model.CartItem;
import com.ghyampes.model.Shoe;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("checkout".equals(action)) {
            request.getSession().removeAttribute("cart");
            response.sendRedirect(request.getContextPath() + "/CheckoutSuccessServlet");
        } else {
            request.getRequestDispatcher("/pages/cart.jsp").forward(request, response);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        
        // Get or create cart
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) { cart = new ArrayList<>(); }
        
        if ("add".equals(action) || "buy_now".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String size = request.getParameter("size");
            if(size == null) size = "EU: 39"; // Default size
            
            Shoe shoe = new ShoeDAO().getShoeById(productId);
            if (shoe != null) {
                cart.add(new CartItem(shoe.getId(), shoe.getItemName(), shoe.getPrice(), quantity, size, shoe.getImageUrl()));
            }
            session.setAttribute("cart", cart);
            
            if ("buy_now".equals(action)) {
                response.sendRedirect(request.getContextPath() + "/CheckoutServlet");
            } else {
                response.sendRedirect(request.getContextPath() + "/CartServlet");
            }
        }
        else if ("remove".equals(action)) {
            int index = Integer.parseInt(request.getParameter("index"));
            if (index >= 0 && index < cart.size()) {
                cart.remove(index);
            }
            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath() + "/CartServlet");
        }
    }
}