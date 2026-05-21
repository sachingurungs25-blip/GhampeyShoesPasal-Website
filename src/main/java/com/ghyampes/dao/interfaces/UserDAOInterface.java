package com.ghyampes.dao.interfaces;

import com.ghyampes.model.User;
import java.util.List;

public interface UserDAOInterface {
    boolean isUsernameExists(String username);
    boolean isPhoneExists(String phone);
    boolean registerMember(User user);
    User loginUser(String username, String password);
    List<User> getPendingMembers();
    boolean approveMember(int id);
    boolean updateProfile(User user);
    boolean updatePassword(int id, String newPassword);
}
