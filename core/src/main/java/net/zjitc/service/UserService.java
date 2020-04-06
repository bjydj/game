package net.zjitc.service;

import net.zjitc.common.Msg;
import net.zjitc.pojo.User;

import java.util.List;

/*
        User:叶诚浩
        Date:2019/5/6
 */
public interface UserService {

    User login(User user);

    int register(User user);

    Msg checkUsername(User user);

    User findByname(String name);


    /*管理员登录*/
    List<User>adminlogin(User user);
}
