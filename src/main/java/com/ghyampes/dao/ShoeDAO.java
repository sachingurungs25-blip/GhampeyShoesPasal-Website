package com.ghyampes.dao;
import com.ghyampes.dao.interfaces.ShoeDAOInterface;
import com.ghyampes.model.Shoe;
import com.ghyampes.utilities.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class ShoeDAO implements ShoeDAOInterface {
    public boolean addShoe(Shoe shoe) {
        String query = "INSERT INTO Product (Item_name, Price, Before_Price, Category, Description, Image_URL, Admin_ID, Stock) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, shoe.getItemName()); ps.setDouble(2, shoe.getPrice()); ps.setDouble(3, shoe.getBeforePrice());
            ps.setString(4, shoe.getCategory()); ps.setString(5, shoe.getDescription()); ps.setString(6, shoe.getImageUrl()); 
            ps.setInt(7, shoe.getAdminId());
            ps.setInt(8, shoe.getStock());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }
    public List<Shoe> getAllShoes() {
        List<Shoe> shoes = new ArrayList<>();
        String query = "SELECT * FROM Product";
        try (Connection con = DBConnection.getConnection(); Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Shoe shoe = new Shoe(); shoe.setId(rs.getInt("Product_ID")); shoe.setItemName(rs.getString("Item_name"));
                shoe.setPrice(rs.getDouble("Price")); shoe.setBeforePrice(rs.getDouble("Before_Price")); 
                shoe.setCategory(rs.getString("Category")); shoe.setDescription(rs.getString("Description")); 
                shoe.setImageUrl(rs.getString("Image_URL")); shoe.setAdminId(rs.getInt("Admin_ID"));
                shoe.setStock(rs.getInt("Stock")); shoes.add(shoe);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return shoes;
    }
    public Shoe getShoeById(int id) {
        String query = "SELECT * FROM Product WHERE Product_ID = ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id); ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Shoe shoe = new Shoe(); shoe.setId(rs.getInt("Product_ID")); shoe.setItemName(rs.getString("Item_name"));
                shoe.setPrice(rs.getDouble("Price")); shoe.setBeforePrice(rs.getDouble("Before_Price"));
                shoe.setCategory(rs.getString("Category")); shoe.setDescription(rs.getString("Description")); 
                shoe.setImageUrl(rs.getString("Image_URL")); shoe.setStock(rs.getInt("Stock"));
                return shoe;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
    
    public boolean updateShoe(Shoe shoe) {
        String query = "UPDATE Product SET Item_name=?, Price=?, Before_Price=?, Category=?, Description=?, Image_URL=?, Stock=? WHERE Product_ID=?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, shoe.getItemName()); ps.setDouble(2, shoe.getPrice()); ps.setDouble(3, shoe.getBeforePrice());
            ps.setString(4, shoe.getCategory()); ps.setString(5, shoe.getDescription()); ps.setString(6, shoe.getImageUrl()); 
            ps.setInt(7, shoe.getStock());
            ps.setInt(8, shoe.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }
    
    
    public boolean reduceStock(int productId, int quantity) {
        String query = "UPDATE Product SET Stock = Stock - ? WHERE Product_ID = ? AND Stock >= ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, quantity); ps.setInt(2, productId); ps.setInt(3, quantity);
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }

    public boolean deleteShoe(int id) {
        String query = "DELETE FROM Product WHERE Product_ID = ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id); return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); return false; }
    }
}