package net.zjitc.controller;

import net.zjitc.pojo.Orders;
import net.zjitc.pojo.User;
import net.zjitc.service.CartService;
import net.zjitc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class Ordercontroller {
    @Autowired
    OrderService orderService;
    @Autowired
    CartService cartService;


    @RequestMapping("/createOrder")
    public String createOrder(HttpSession session, Model model, Orders orders) {
        User user = (User) session.getAttribute("user");
        int sum = (int) session.getAttribute("sum");
        orderService.createOrder(orders,user,sum);
        model.addAttribute("order",orders);
        return "/WEB-INF/alipay/alipay.trade.page.pay";
    }

    @RequestMapping("/payReturn")
    public String payReturn(Model model,String out_trade_no) {
        int resultCount =  orderService.updatePayState(out_trade_no,1);
        model.addAttribute("msg","付款成功、、、");
        return "redirect:/cart/findByCart.do";
    }
}
