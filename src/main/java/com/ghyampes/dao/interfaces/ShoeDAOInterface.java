package com.ghyampes.dao.interfaces;

import com.ghyampes.model.Shoe;
import java.util.List;

public interface ShoeDAOInterface {
    boolean addShoe(Shoe shoe);
    List<Shoe> getAllShoes();
    Shoe getShoeById(int id);
    boolean updateShoe(Shoe shoe);
    boolean reduceStock(int productId, int quantity);
    boolean deleteShoe(int id);
}
