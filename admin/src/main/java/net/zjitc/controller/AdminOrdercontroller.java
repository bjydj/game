package net.zjitc.controller;

import net.zjitc.pojo.Orders;
import net.zjitc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Author admin
 * @Date 2019/6/12 10:34
 */
@Controller
@RequestMapping("/order")
public class AdminOrdercontroller {
    @Autowired
    OrderService orderService;

    @RequestMapping("/findAllOrder")
    public String findAllOrder(Model model){
        List<Orders> allOrder = orderService.findAllOrder();
        model.addAttribute("orders",allOrder);
        return "/admin/orders/list";
    }
}
