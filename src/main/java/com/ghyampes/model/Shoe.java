package com.ghyampes.model;
public class Shoe {
    private int id; private String itemName; private double price; private double beforePrice;
    private String category; private String description; private String imageUrl; private int adminId;
    private int stock;
    public Shoe() {}
    public int getId() { return id; } public void setId(int id) { this.id = id; }
    public String getItemName() { return itemName; } public void setItemName(String itemName) { this.itemName = itemName; }
    public double getPrice() { return price; } public void setPrice(double price) { this.price = price; }
    public double getBeforePrice() { return beforePrice; } public void setBeforePrice(double beforePrice) { this.beforePrice = beforePrice; }
    public String getCategory() { return category; } public void setCategory(String category) { this.category = category; }
    public String getDescription() { return description; } public void setDescription(String description) { this.description = description; }
    public String getImageUrl() { return imageUrl; } public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public int getAdminId() { return adminId; }
    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; } public void setAdminId(int adminId) { this.adminId = adminId; }
}