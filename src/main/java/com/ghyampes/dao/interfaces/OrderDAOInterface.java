package com.ghyampes.dao.interfaces;

import com.ghyampes.model.Order;
import java.util.List;
import java.util.Map;

public interface OrderDAOInterface {
    boolean placeOrder(Order order);
    List<Order> getAllOrders();
    double getTotalRevenue();
    int getTotalOrders();
    List<Map<String, Object>> getSalesByDay(int days);
}
