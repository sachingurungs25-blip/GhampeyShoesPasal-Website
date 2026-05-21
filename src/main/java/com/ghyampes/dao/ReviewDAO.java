package com.ghyampes.dao;
import com.ghyampes.dao.interfaces.ReviewDAOInterface;
import com.ghyampes.model.Review;
import com.ghyampes.utilities.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class ReviewDAO implements ReviewDAOInterface {
    public boolean addReview(Review review) {
        String query = "INSERT INTO Review (Member_ID, Product_ID, Comments, Rating_Type) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, review.getMemberId()); ps.setInt(2, review.getProductId());
            ps.setString(3, review.getComments()); ps.setString(4, review.getRatingType());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }
    public List<Review> getReviewsByProduct(int productId) {
        List<Review> list = new ArrayList<>();
        String query = "SELECT r.*, m.Full_Name FROM Review r JOIN Member m ON r.Member_ID = m.Member_ID WHERE r.Product_ID = ? ORDER BY r.Review_ID DESC";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Review r = new Review(); r.setId(rs.getInt("Review_ID")); r.setMemberId(rs.getInt("Member_ID"));
                r.setProductId(rs.getInt("Product_ID")); r.setComments(rs.getString("Comments"));
                r.setRatingType(rs.getString("Rating_Type")); r.setMemberName(rs.getString("Full_Name"));
                list.add(r);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}