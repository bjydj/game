package net.zjitc.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import net.zjitc.pojo.Category;
import net.zjitc.pojo.Notice;
import net.zjitc.pojo.Product;
import net.zjitc.service.CategoryService;
import net.zjitc.service.NoticeService;
import net.zjitc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/category")
public class Categorycontroller {
    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductService productService;

    @Autowired
    NoticeService noticeService;
    @RequestMapping("/findCategoryName")
    public String findganeindex(Model model, Product product , HttpSession session){

        /*类别*/
        List<Category> categoryName = categoryService.findCategoryName();
        session.setAttribute("category",categoryName);

        /*公告*/
        List<Notice> notice = noticeService.findNotice();
        session.setAttribute("notice",notice);

        /*热销产品*/
        List<Product> producthot = productService.findProducthot();
        session.setAttribute("pListh",producthot);


        /*新品上市*/
        PageHelper.startPage(1,5);
        List<Product> productxp = productService.findProductxp();
        PageInfo<Product> info = new PageInfo<>(productxp);
        session.setAttribute("pList",info.getList());



        return "/client/index";
    }
}
