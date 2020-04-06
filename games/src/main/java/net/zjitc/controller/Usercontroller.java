package net.zjitc.controller;

import net.zjitc.common.Msg;
import net.zjitc.pojo.User;
import net.zjitc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/client")
public class Usercontroller {
    @Autowired
    UserService userService;
    /*登录*/
    @RequestMapping("/login")
    public String login(Model model, User user,HttpSession session){
       User login = userService.login(user);
        if (login !=null){
            model.addAttribute("suss","登录成功");
            session.setAttribute("login",user.getUsername());
            session.setAttribute("user",login);
            return "redirect:/category/findCategoryName.do";
        }else {
        model.addAttribute("msg","账号或密码错误");
            return "/client/login";
        }
    }

    @RequestMapping("/register")
    public String register(User user,HttpServletRequest request){
        Msg msg = userService.checkUsername(user);
        if (msg.getFlag()==true){
            int register = userService.register(user);
            return "/client/index";
        }else {
            return "/client/register";
        }
    }
    /*退出*/
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("login");
        return "redirect:/category/findCategoryName.do";
    }


    @RequestMapping(value = "/checkUsername")
    @ResponseBody
    public Msg checkUsername(@RequestBody User user){
        return userService.checkUsername(user);
    }
}
