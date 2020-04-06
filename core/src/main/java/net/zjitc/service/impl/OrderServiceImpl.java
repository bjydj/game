package net.zjitc.service.impl;

import net.zjitc.mapper.OrdersMapper;
import net.zjitc.mapper.ProductMapper;
import net.zjitc.mapper.UserMapper;
import net.zjitc.pojo.Orders;
import net.zjitc.pojo.OrdersExample;
import net.zjitc.pojo.User;
import net.zjitc.service.CartService;
import net.zjitc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrdersMapper ordersMapper;
    @Autowired
    UserMapper userMapper;

    @Autowired
    ProductMapper productMapper;

    @Autowired
    CartService cartService;

    public int createOrder(Orders orders, User user, int sum) {
        orders.setUserId(user.getId());
        orders.setPaystate(0);
        orders.setMoney((double) sum);
        orders.setId(UUID.randomUUID().toString());
        orders.setReceivername(user.getUsername());
        orders.setReceiverphone(user.getTelephone());
        int resultCount = ordersMapper.insert(orders);
        if (resultCount == 0){
            return 0;
        }
        resultCount = cartService.deleteCartByUid(user.getId());
        return resultCount;
    }

    /*付款成功将支付状态改为1(已支付)*/
    public int updatePayState(String out_trade_no, Integer state) {

        return ordersMapper.updatePayState(out_trade_no,state);
    }

    public List<Orders> findAllOrder() {
        OrdersExample ordersExample = new OrdersExample();
        return ordersMapper.selectByExample(ordersExample);
    }

}
