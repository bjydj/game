package net.zjitc.controller;

import net.zjitc.common.ResultMessage;
import net.zjitc.pojo.Cart;
import net.zjitc.pojo.User;
import net.zjitc.service.CartService;
import net.zjitc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static sun.java2d.cmm.ColorTransform.Out;

@Controller
    @RequestMapping("/cart")
public class Cartcontroller {
@Autowired
CartService cartService;
@Autowired
UserService userService;
@RequestMapping("/findByCart")
    public String findByCart(Model model, HttpServletRequest request,HttpSession session){
    //将用户购物车内容显示到页面上
    String login = (String) request.getSession().getAttribute("login");
    User user = new User();
    user.setUsername(login);
    User byname = userService.findByname(login);
    List<Cart> byCart = cartService.findByCart(byname.getId());
    session.setAttribute("cart",byCart);

    int sum=0;
    for (int i=0;i<byCart.size();i++){
        sum=sum+byCart.get(i).getProduct().getSpecialOffer();
    }
    session.setAttribute("sum",sum);
    if (byCart.size()!=0){
        session.setAttribute("suss1","有购买记录");
    }

    //因为不太会用ajax所以先加载这个页面在跳转方法
    return "/client/index";
    }


    @RequestMapping("/insertCart")
    /*添加到购物车*/
    public ResultMessage insertCart(Cart cart, HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        cart.setUid(user.getId());
        int insertCart = cartService.insertCart(cart);
        if (insertCart>0){
            return ResultMessage.createErrorMessage("添加到购物车成功");
/*            return "redirect:/cart/findByCart.do";*/

        }
            return ResultMessage.createErrorMessage("添加购物车失败");
    }

    @RequestMapping("/deleteCart")
    public String deleteCart(int id,Model model){
        int i = cartService.deleteCart(id);
        return "redirect:/cart/findByCart.do";
    }
}
