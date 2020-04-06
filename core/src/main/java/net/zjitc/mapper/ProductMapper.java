package net.zjitc.mapper;

import java.util.List;


import net.zjitc.pojo.Condition;
import net.zjitc.pojo.Product;
import net.zjitc.pojo.ProductExample;
import org.apache.ibatis.annotations.Param;

public interface ProductMapper {
    int countByExample(ProductExample example);

    int deleteByExample(ProductExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Product record);

    int insertSelective(Product record);

    List<Product> selectByExample(ProductExample example);

    Product selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByExample(@Param("record") Product record, @Param("example") ProductExample example);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);

    Product selectProductOrCategory(int id);

    List<Product>findAllProductOrCategory();

    List<Product> searchByCondition(Condition condition);

    int editProduct(Product product);
}