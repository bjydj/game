package net.zjitc.common;
import net.zjitc.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminInterceptor implements HandlerInterceptor {
    /**
     *1.preHandle是在执行请求前进行的预处理，此处将请求拦截到
     *2.在springmvcc-config.xml文件中配置你要拦截的是谁
     *
     */
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        //注意管理员登录的时候放在session的key的值
        User user = (User) session.getAttribute("us");
        //user != null说明已经登录，返回true则可以执行后续的动作
        if (user != null){
            //true表示放行，不拦截
            return true;
        }
        //false表示已经拦截，不会继续执行后面的动作，应该跳到登录页面让用户登录
        //重定向到登录页面
        httpServletResponse.sendRedirect("/client/login.jsp");
        return false;

    }
/*
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }*/
}
