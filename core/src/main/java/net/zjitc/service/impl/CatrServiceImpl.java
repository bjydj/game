package net.zjitc.service.impl;

import net.zjitc.mapper.CartMapper;
import net.zjitc.pojo.Cart;
import net.zjitc.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;
import java.util.UUID;

/**
 * @Author admin
 * @Date 2019/5/29 10:30
 */
@Service
public class CatrServiceImpl implements CartService {

    @Autowired
    CartMapper cartMapper;
    public List<Cart> findByCart(int id) {
        return cartMapper.findByCart(id);
    }

    public int insertCart(Cart cart) {
        cart.setCreateTime(new Date(System.currentTimeMillis()));
        cart.setChecked(0);
        return cartMapper.insert(cart);
    }

    public int deleteCart(int id) {
        return cartMapper.deleteByPrimaryKey(id);
    }

    /*删除购物车商品*/

    public int deleteCartByUid(int id) {
        return cartMapper.deleteCartByUid(id);
    }
}
