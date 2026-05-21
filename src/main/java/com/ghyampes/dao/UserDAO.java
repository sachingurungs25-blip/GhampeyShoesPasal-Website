package com.ghyampes.dao;
import com.ghyampes.dao.interfaces.UserDAOInterface;
import com.ghyampes.model.User;
import com.ghyampes.utilities.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class UserDAO implements UserDAOInterface {
    public boolean isUsernameExists(String username) {
        String sql = "SELECT Username FROM Member WHERE Username = ? UNION SELECT Username FROM Admin WHERE Username = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username); stmt.setString(2, username);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
    public boolean isPhoneExists(String phone) {
        String sql = "SELECT Phone FROM Member WHERE Phone = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, phone);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
    public boolean registerMember(User user) {
        if(isUsernameExists(user.getUsername())) return false;
        if(isPhoneExists(user.getPhone())) return false;
        String sql = "INSERT INTO Member (Full_Name, Username, Password, Phone, Is_Approved) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getFullName()); stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPassword()); stmt.setString(4, user.getPhone()); stmt.setBoolean(5, true);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
    public User loginUser(String username, String password) {
        String adminSql = "SELECT * FROM Admin WHERE Username = ? AND Password = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(adminSql)) {
            stmt.setString(1, username); stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User admin = new User(); admin.setId(rs.getInt("Admin_ID")); admin.setFullName(rs.getString("Name"));
                admin.setUsername(rs.getString("Username")); admin.setRole("admin"); admin.setApproved(true);
                return admin;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        String memberSql = "SELECT * FROM Member WHERE Username = ? AND Password = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(memberSql)) {
            stmt.setString(1, username); stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                User member = new User(); member.setId(rs.getInt("Member_ID")); member.setFullName(rs.getString("Full_Name"));
                member.setUsername(rs.getString("Username")); member.setRole("member"); member.setApproved(rs.getBoolean("Is_Approved")); member.setPhone(rs.getString("Phone"));
                return member;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }
    public List<User> getPendingMembers() {
        List<User> members = new ArrayList<>();
        String sql = "SELECT * FROM Member WHERE Is_Approved = FALSE";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                User member = new User(); member.setId(rs.getInt("Member_ID"));
                member.setFullName(rs.getString("Full_Name")); member.setUsername(rs.getString("Username"));
                members.add(member);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return members;
    }
    public boolean approveMember(int id) {
        String sql = "UPDATE Member SET Is_Approved = TRUE WHERE Member_ID = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id); return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
    public boolean updateProfile(User user) {
        String sql = "UPDATE Member SET Full_Name = ? WHERE Member_ID = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getFullName()); stmt.setInt(2, user.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
    public boolean updatePassword(int id, String newPassword) {
        String sql = "UPDATE Member SET Password = ? WHERE Member_ID = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, newPassword); stmt.setInt(2, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}