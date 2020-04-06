package net.zjitc.service;

import net.zjitc.common.ServiceResponse;
import net.zjitc.pojo.Condition;
import net.zjitc.pojo.Product;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author admin
 * @Date 2019/5/13 9:05
 */
public interface ProductService {
    List<Product>findProductxp();

    List<Product>findProducthot();

    Product selectProductOrCategory(int id);

    List<Product>findByCid(int cid);

    List<Product>findAllProduct();

    List<Product>findAllProductOrCategory();

    List<Product> searchByCondition(Condition condition);

    int deleteProduct(int id);

    ServiceResponse editProduct(Product product, MultipartFile file, HttpServletRequest request);

    Product findByID(Integer id);

    int addProduct(Product product);


}
