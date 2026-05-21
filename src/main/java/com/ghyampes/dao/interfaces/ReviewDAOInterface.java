package com.ghyampes.dao.interfaces;

import com.ghyampes.model.Review;
import java.util.List;

public interface ReviewDAOInterface {
    boolean addReview(Review review);
    List<Review> getReviewsByProduct(int productId);
}
