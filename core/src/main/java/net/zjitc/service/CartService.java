package net.zjitc.service;

import net.zjitc.pojo.Cart;

import java.util.List;

/**
 * @Author admin
 * @Date 2019/5/29 10:30
 */
public interface CartService {
    List<Cart> findByCart(int id);

    int insertCart(Cart cart);

    int deleteCart(int id);

    int deleteCartByUid(int id);
}
