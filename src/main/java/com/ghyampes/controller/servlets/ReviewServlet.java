package com.ghyampes.controller.servlets;
import com.ghyampes.dao.ReviewDAO; import com.ghyampes.model.Review; import com.ghyampes.model.User;
import jakarta.servlet.ServletException; import jakarta.servlet.annotation.WebServlet; import jakarta.servlet.http.*;
import java.io.IOException;
@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int productId = Integer.parseInt(request.getParameter("productId"));
        if(user != null && "member".equals(user.getRole())) {
            Review r = new Review(); r.setMemberId(user.getId()); r.setProductId(productId);
            r.setComments(request.getParameter("comments")); r.setRatingType(request.getParameter("rating"));
            new ReviewDAO().addReview(r);
        }
        response.sendRedirect(request.getContextPath() + "/ProductServlet?id=" + productId);
    }
}