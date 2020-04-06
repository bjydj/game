package net.zjitc.service;

import net.zjitc.pojo.Orders;
import net.zjitc.pojo.User;

import java.util.List;

/*
        User:叶诚浩
        Date:2019/6/9
 */
public interface OrderService {

/*
    int createOrder(Orders orders, User user);
*/


    int createOrder(Orders orders, User user, int sum);


    int updatePayState(String out_trade_no,Integer state);

    List<Orders>findAllOrder();

}
