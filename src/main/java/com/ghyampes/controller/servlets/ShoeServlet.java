package com.ghyampes.controller.servlets;
import com.ghyampes.dao.ShoeDAO;
import com.ghyampes.model.Shoe;
import com.ghyampes.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
@WebServlet("/ShoeServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class ShoeServlet extends HttpServlet {
    private ShoeDAO shoeDAO = new ShoeDAO();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); User user = (session != null) ? (User) session.getAttribute("user") : null;
        if (user == null || !"admin".equals(user.getRole())) { response.sendRedirect(request.getContextPath() + "/LoginServlet"); return; }
        
        String action = request.getParameter("action");
        if ("delete".equals(action)) { 
            shoeDAO.deleteShoe(Integer.parseInt(request.getParameter("id"))); 
            response.sendRedirect("AdminDashboardServlet");
        } else if ("showEdit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Shoe shoe = shoeDAO.getShoeById(id);
            request.setAttribute("shoe", shoe);
            request.getRequestDispatcher("/pages/edit_product.jsp").forward(request, response);
        } else {
            response.sendRedirect("AdminDashboardServlet");
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); User user = (session != null) ? (User) session.getAttribute("user") : null;
        if (user == null || !"admin".equals(user.getRole())) { response.sendRedirect(request.getContextPath() + "/LoginServlet"); return; }
        if ("add".equals(request.getParameter("action"))) {
            Shoe shoe = new Shoe(); 
            shoe.setItemName(request.getParameter("itemName")); 
            shoe.setCategory(request.getParameter("category")); 
            shoe.setPrice(Double.parseDouble(request.getParameter("price")));
            String beforePriceStr = request.getParameter("beforePrice");
            if(beforePriceStr != null && !beforePriceStr.trim().isEmpty()) {
                shoe.setBeforePrice(Double.parseDouble(beforePriceStr));
            } else {
                shoe.setBeforePrice(0.0);
            }
            shoe.setDescription(request.getParameter("description"));
            String stockStr = request.getParameter("stock");
            if(stockStr != null && !stockStr.trim().isEmpty()) { shoe.setStock(Integer.parseInt(stockStr)); } else { shoe.setStock(10); } 
            
            Part filePart = request.getPart("image");
            String fileName = getFileName(filePart);
            if(fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                String filePath = uploadPath + File.separator + fileName;
                filePart.write(filePath);
                shoe.setImageUrl("images/" + fileName);
            } else {
                shoe.setImageUrl("images/running_shoe_1777806317504.png"); // Default
            }

            shoe.setAdminId(user.getId()); shoeDAO.addShoe(shoe); 
        }
        
        if ("edit".equals(request.getParameter("action"))) {
            int id = Integer.parseInt(request.getParameter("id"));
            Shoe shoe = shoeDAO.getShoeById(id);
            if (shoe != null) {
                shoe.setItemName(request.getParameter("itemName")); 
                shoe.setCategory(request.getParameter("category")); 
                shoe.setPrice(Double.parseDouble(request.getParameter("price")));
                String beforePriceStr = request.getParameter("beforePrice");
                if(beforePriceStr != null && !beforePriceStr.trim().isEmpty()) { shoe.setBeforePrice(Double.parseDouble(beforePriceStr)); } else { shoe.setBeforePrice(0.0); }
                shoe.setDescription(request.getParameter("description"));
            String stockStr = request.getParameter("stock");
            if(stockStr != null && !stockStr.trim().isEmpty()) { shoe.setStock(Integer.parseInt(stockStr)); } else { shoe.setStock(10); } 
                
                Part filePart = request.getPart("image");
                String fileName = getFileName(filePart);
                if(fileName != null && !fileName.isEmpty()) {
                    String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdir();
                    String filePath = uploadPath + File.separator + fileName;
                    filePart.write(filePath);
                    shoe.setImageUrl("images/" + fileName);
                }
                shoeDAO.updateShoe(shoe); 
            }
        }
    
        response.sendRedirect("AdminDashboardServlet");
    }
    private String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}