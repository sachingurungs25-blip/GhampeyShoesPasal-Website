package com.ghyampes.controller.servlets;
import com.ghyampes.dao.OrderDAO; import com.ghyampes.dao.ShoeDAO; import com.ghyampes.model.CartItem; import com.ghyampes.model.Order; import com.ghyampes.model.User;
import jakarta.servlet.ServletException; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*;
import java.io.IOException; import java.util.List;
@WebServlet("/ProcessOrderServlet")
public class ProcessOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        List<CartItem> cart = (List<CartItem>) request.getSession().getAttribute("cart");
        if(user == null || cart == null || cart.isEmpty()) { response.sendRedirect(request.getContextPath() + "/HomeServlet"); return; }
        OrderDAO orderDAO = new OrderDAO(); ShoeDAO shoeDAO = new ShoeDAO();
        for(CartItem item : cart) {
            Order o = new Order(); o.setMemberId(user.getId()); o.setProductId(item.getProductId()); o.setTotalPrice(item.getPrice() * item.getQuantity());
            o.setPhone(request.getParameter("phone")); o.setOrderNote(request.getParameter("orderNote"));
            o.setCity(request.getParameter("city")); o.setAddress(request.getParameter("address")); o.setLandmark(request.getParameter("landmark"));
            if(orderDAO.placeOrder(o)) { shoeDAO.reduceStock(item.getProductId(), item.getQuantity()); }
        }
        request.getSession().removeAttribute("cart");
        response.sendRedirect(request.getContextPath() + "/CheckoutSuccessServlet");
    }
}