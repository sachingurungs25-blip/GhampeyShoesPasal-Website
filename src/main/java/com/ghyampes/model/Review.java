package com.ghyampes.model;
public class Review {
    private int id, memberId, productId;
    private String comments, ratingType, memberName;
    public int getId() { return id; } public void setId(int id) { this.id = id; }
    public int getMemberId() { return memberId; } public void setMemberId(int memberId) { this.memberId = memberId; }
    public int getProductId() { return productId; } public void setProductId(int productId) { this.productId = productId; }
    public String getComments() { return comments; } public void setComments(String comments) { this.comments = comments; }
    public String getRatingType() { return ratingType; } public void setRatingType(String ratingType) { this.ratingType = ratingType; }
    public String getMemberName() { return memberName; } public void setMemberName(String memberName) { this.memberName = memberName; }
}