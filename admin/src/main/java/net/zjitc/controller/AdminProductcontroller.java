package net.zjitc.controller;

import net.zjitc.common.ServiceResponse;
import net.zjitc.pojo.Category;
import net.zjitc.pojo.Condition;
import net.zjitc.pojo.Product;
import net.zjitc.service.CategoryService;
import net.zjitc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URL;
import java.sql.Date;
import java.util.List;

@Controller
@RequestMapping("/product")
public class AdminProductcontroller {
    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @RequestMapping("/listProducts")
    public String findAllProductOrCategory(Model model, HttpSession session){
        List<Product> allProductOrCategory = productService.findAllProductOrCategory();
        model.addAttribute("plist",allProductOrCategory);

        List<Category> categoryName = categoryService.findCategoryName();
        session.setAttribute("clist",categoryName);

        return "/admin/products/list";
}

    @RequestMapping("/searchByCondition")
    @ResponseBody
    public List<Product> searchByCondition(Condition condition){
        List<Product> plist = productService.searchByCondition(condition);
        return plist;
    }

    @RequestMapping("/deleteProduct")
    public String deleteProduct(int id){
        int i = productService.deleteProduct(id);
        return "redirect:/product/listProducts.do";
    }

    @RequestMapping("/findByIdproductorcartory")
    public String selectProductsOrCategory(int id,Model model){
        Product product = productService.selectProductOrCategory(id);
        model.addAttribute("poc",product);
        return "/admin/products/edit";
    }

    @RequestMapping("/editProduct")
    @ResponseBody
    public ServiceResponse editProduct(Product product, @RequestParam(required = false,value = "file")MultipartFile file,
                                       HttpServletRequest request) throws IOException {


        /**文件下载*/
        Product product1 = productService.findByID(product.getId());
        String path = getPath() + "/games/src/main/webapp" +product1.getImgurl() ;
        System.out.println(path);
        if (file != null) {
            //**文件删除*//*
                File file2 = new File(path);
                if (file2.exists()){
                    file2.delete();
        }

        /**文件添加*/
        String newPath=getPath()+ "/games/src/main/webapp";
                File file1 = new File(newPath);
                if (!file1.exists()){
                    file1.mkdir();
                }
                InputStream inputStream = file.getInputStream();
//                System.out.println(path1);
                String fileUrl=path ;
                FileOutputStream outputStream = new FileOutputStream(fileUrl);
                byte[] buffer = file.getBytes();
                int bytesum = 0;
                int byteread = 0;
                while ((byteread=inputStream.read(buffer))!=-1){
                    bytesum += byteread;
                    outputStream.write(buffer, 0, byteread);
                    outputStream.flush();
                }
                outputStream.close();
                inputStream.close();
    }
        return productService.editProduct(product, file,request);
    }



@RequestMapping("/addProduct")
@ResponseBody
    public String addPorduct(Product product, @RequestParam(required = false,value = "file")MultipartFile file,
                             HttpServletRequest request)throws  IOException{


    /**文件下载*/
    String path = getPath() + "/games/src/main/webapp/producuImage/" + file.getOriginalFilename();
    if (file != null) {
        /**文件添加*/
        String newPath=getPath()+ "/games/src/main/webapp/producuImage";
        File file1 = new File(newPath);
        if (!file1.exists()){
            file1.mkdir();
        }
        InputStream inputStream = file.getInputStream();
//                System.out.println(path1);
        String fileUrl=path ;
        FileOutputStream outputStream = new FileOutputStream(fileUrl);
        byte[] buffer = file.getBytes();
        int bytesum = 0;
        int byteread = 0;
        while ((byteread=inputStream.read(buffer))!=-1){
            bytesum += byteread;
            outputStream.write(buffer, 0, byteread);
            outputStream.flush();
        }
        outputStream.close();
        inputStream.close();
        product.setImgurl("/producuImage/"+file.getOriginalFilename());
        product.setProductTime(new Date(System.currentTimeMillis()));
    }
        int i = productService.addProduct(product);
    return "/product/listProducts.do";
    }



    private String getPath() {
        URL resource = this.getClass().getResource("/");
        String str = resource.toString();
        String[] temp;
        String delimeter="/target";
        String delimeter2="file:/";
        String delimeter3="/admin";
        temp=str.split(delimeter);
        str=temp[0];
        temp=str.split(delimeter2);
        str=temp[1];
        temp=str.split(delimeter3);
        return temp[0];
    }

}
