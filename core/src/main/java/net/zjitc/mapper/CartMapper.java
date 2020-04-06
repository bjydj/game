package net.zjitc.mapper;

import net.zjitc.pojo.Cart;
import net.zjitc.pojo.CartExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CartMapper {
    int countByExample(CartExample example);

    int deleteByExample(CartExample example);

    int deleteByPrimaryKey(Integer id);


    int insert(Cart record);

    int insertSelective(Cart record);

    List<Cart> selectByExample(CartExample example);

    Cart selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByExample(@Param("record") Cart record, @Param("example") CartExample example);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    List<Cart> findByCart(int id);

    int deleteCartByUid(int id);
}