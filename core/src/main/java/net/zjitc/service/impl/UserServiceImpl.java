package net.zjitc.service.impl;

import net.zjitc.common.Msg;
import net.zjitc.mapper.UserMapper;
import net.zjitc.pojo.User;
import net.zjitc.pojo.UserExample;
import net.zjitc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

/*
        User:叶诚浩
        Date:2019/5/6
 */
@Service
public class UserServiceImpl  implements UserService {
    @Autowired
    UserMapper userMapper;

    public User login(User user) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(user.getUsername());
        criteria.andPasswordEqualTo(user.getPassword());
        User list= (User) userMapper.selectByExamples(userExample);
        return list;
    }

    public int register(User user) {
        user.setRegisttime(new Date(System.currentTimeMillis()));
        user.setRole("普通用户");
        int insert = userMapper.insert(user);
        return insert;
    }



    public Msg checkUsername(User user) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(user.getUsername());
        List<User> users = userMapper.selectByExample(userExample);
        Msg msg = new Msg();
        if (users.size()==0){
            msg.setFlag(true);
        }else {
            msg.setFlag(false);
        }
        return msg;
    }


    public User findByname(String name) {
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(name);
        return  userMapper.selectByExamples(example);
    }



    /*管理员登录*/
    public List<User> adminlogin(User user) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andRoleLike("超级用户");
        criteria.andUsernameEqualTo(user.getUsername());
        criteria.andPasswordEqualTo(user.getPassword());
        List<User> adminlist = userMapper.selectByExample(userExample);
        return adminlist;
    }
}
