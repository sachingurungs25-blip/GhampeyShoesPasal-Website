package com.ghyampes.dao;

import com.ghyampes.dao.interfaces.OrderDAOInterface;
import com.ghyampes.model.Order;
import com.ghyampes.utilities.DBConnection;
import java.sql.*;
import java.util.*;

public class OrderDAO implements OrderDAOInterface {

    @Override
    public boolean placeOrder(Order order) {
        String query = "INSERT INTO `Order` (Member_ID, Product_ID, Total_Price, Phone, Order_Note, City, Address, Landmark) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, order.getMemberId());
            ps.setInt(2, order.getProductId());
            ps.setDouble(3, order.getTotalPrice());
            ps.setString(4, order.getPhone());
            ps.setString(5, order.getOrderNote());
            ps.setString(6, order.getCity());
            ps.setString(7, order.getAddress());
            ps.setString(8, order.getLandmark());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM `Order` ORDER BY Order_Time DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("Order_ID"));
                o.setMemberId(rs.getInt("Member_ID"));
                o.setProductId(rs.getInt("Product_ID"));
                o.setTotalPrice(rs.getDouble("Total_Price"));
                o.setPhone(rs.getString("Phone"));
                o.setOrderNote(rs.getString("Order_Note"));
                o.setCity(rs.getString("City"));
                o.setAddress(rs.getString("Address"));
                o.setLandmark(rs.getString("Landmark"));
                orders.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public double getTotalRevenue() {
        String query = "SELECT COALESCE(SUM(Total_Price), 0) FROM `Order`";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getDouble(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0.0;
    }

    @Override
    public int getTotalOrders() {
        String query = "SELECT COUNT(*) FROM `Order`";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Map<String, Object>> getSalesByDay(int days) {
        List<Map<String, Object>> result = new ArrayList<>();
        String query = "SELECT DATE(Order_Time) as day, SUM(Total_Price) as revenue, COUNT(*) as order_count " +
                       "FROM `Order` " +
                       "WHERE Order_Time >= DATE_SUB(CURDATE(), INTERVAL ? DAY) " +
                       "GROUP BY DATE(Order_Time) " +
                       "ORDER BY day ASC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, days);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> row = new LinkedHashMap<>();
                    row.put("day", rs.getString("day"));
                    row.put("revenue", rs.getDouble("revenue"));
                    row.put("orderCount", rs.getInt("order_count"));
                    result.add(row);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}