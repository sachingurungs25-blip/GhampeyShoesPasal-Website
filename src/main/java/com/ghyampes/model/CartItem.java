package com.ghyampes.model;
public class CartItem {
    private int productId;
    private String itemName;
    private double price;
    private int quantity;
    private String size;
    private String imageUrl;
    
    public CartItem() {}
    public CartItem(int productId, String itemName, double price, int quantity, String size, String imageUrl) {
        this.productId = productId; this.itemName = itemName; this.price = price; 
        this.quantity = quantity; this.size = size; this.imageUrl = imageUrl;
    }
    
    public int getProductId() { return productId; }
    public String getItemName() { return itemName; }
    public double getPrice() { return price; }
    public int getQuantity() { return quantity; }
    public String getSize() { return size; }
    public String getImageUrl() { return imageUrl; }
}