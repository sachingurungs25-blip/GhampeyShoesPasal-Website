package com.ghyampes.model;
public class Order {
    private int id, memberId, productId;
    private double totalPrice;
    private String phone, orderNote, city, address, landmark;
    public int getId() { return id; } public void setId(int id) { this.id = id; }
    public int getMemberId() { return memberId; } public void setMemberId(int memberId) { this.memberId = memberId; }
    public int getProductId() { return productId; } public void setProductId(int productId) { this.productId = productId; }
    public double getTotalPrice() { return totalPrice; } public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
    public String getPhone() { return phone; } public void setPhone(String phone) { this.phone = phone; }
    public String getOrderNote() { return orderNote; } public void setOrderNote(String orderNote) { this.orderNote = orderNote; }
    public String getCity() { return city; } public void setCity(String city) { this.city = city; }
    public String getAddress() { return address; } public void setAddress(String address) { this.address = address; }
    public String getLandmark() { return landmark; } public void setLandmark(String landmark) { this.landmark = landmark; }
}