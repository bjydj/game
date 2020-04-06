package net.zjitc.service.impl;

import net.zjitc.common.ServiceResponse;
import net.zjitc.mapper.ProductMapper;
import net.zjitc.pojo.Condition;
import net.zjitc.pojo.Product;
import net.zjitc.pojo.ProductExample;
import net.zjitc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author admin
 * @Date 2019/5/13 9:04
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ProductMapper productMapper;


    public List<Product> findProductxp() {
        ProductExample productExample = new ProductExample();
        productExample.setOrderByClause("product_time ASC");
        return productMapper.selectByExample(productExample);

    }

    public List<Product> findProducthot() {
        ProductExample productExample = new ProductExample();
        productExample.setOrderByClause("sales_volume DESC");
        return productMapper.selectByExample(productExample);
    }

    public Product selectProductOrCategory(int id) {
        return productMapper.selectProductOrCategory(id);
    }

    public List<Product> findByCid(int cid) {
        ProductExample productExample = new ProductExample();
        ProductExample.Criteria criteria = productExample.createCriteria();
        criteria.andCidEqualTo(cid);
        List<Product> list = productMapper.selectByExample(productExample);
        return list;
    }

    public List<Product> findAllProduct() {
        ProductExample productExample = new ProductExample();
        return productMapper.selectByExample(productExample);
    }

    /*管理员查询全部商品*/
    public List<Product> findAllProductOrCategory() {
        return productMapper.findAllProductOrCategory();
    }


    /*搜索*/
    public List<Product> searchByCondition(Condition condition) {
        return productMapper.searchByCondition(condition);
    }

    /*删除产品*/
    public int deleteProduct(int id) {
        return productMapper.deleteByPrimaryKey(id);
    }

    public ServiceResponse editProduct(Product product, MultipartFile file, HttpServletRequest request) {
        int i = productMapper.editProduct(product);
        if (i > 0){
            return ServiceResponse.createBySuccessAndMessage("修改成功");
        }
        return ServiceResponse.createByErrorMessage("修改失败");
    }

    public Product findByID(Integer id) {
        return productMapper.selectByPrimaryKey(id);
    }

    public int addProduct(Product product) {
        int insert = productMapper.insert(product);
        return insert;
    }


}
