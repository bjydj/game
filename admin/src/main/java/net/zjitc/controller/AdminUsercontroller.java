package net.zjitc.controller;

import net.zjitc.mapper.UserMapper;
import net.zjitc.pojo.User;
import net.zjitc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminUsercontroller {
    @Autowired
    UserService userService;

    @RequestMapping("/adminlogin")
    public String adminlogin(User user, Model model, HttpSession session){
        List<User> adminlogin = userService.adminlogin(user);
        if (adminlogin.size()>0){
            model.addAttribute("suss","登录成功");
            session.setAttribute("login",user.getUsername());
            return "/admin/login/home";
        }else {
            model.addAttribute("msg","账号或密码错误");
            return "/admin/login/login";
        }
    }
}
