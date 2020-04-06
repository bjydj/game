package net.zjitc.controller;

import net.zjitc.pojo.Product;
import net.zjitc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/product")
public class Productcontroller {
    @Autowired
    ProductService productService;

    /*查询商品详细信息*/
    @RequestMapping("/selectProductOrCategory")
    public String selectProductOrCategory(Model model, int id, HttpSession session){
        Product product = productService.selectProductOrCategory(id);
        session.setAttribute("poc",product);
        return "redirect:/mood/findMoodByid.do?pid="+product.getId();
    }

    @RequestMapping("/selectfindByCid")
    public String findByCid(Model model ,int cid){
        List<Product> byCid = productService.findByCid(cid);
        model.addAttribute("pListc",byCid);
        return"/client/categoriesList";
    }

    @RequestMapping("/findAllProduct")
    public String findAllProduct(Model model){
        List<Product> allProduct = productService.findAllProduct();
        model.addAttribute("pListc",allProduct);

        return"/client/categoriesList";
    }

}
