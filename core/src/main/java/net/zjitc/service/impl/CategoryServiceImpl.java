package net.zjitc.service.impl;

import net.zjitc.mapper.CategoryMapper;
import net.zjitc.pojo.Category;
import net.zjitc.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author admin
 * @Date 2019/5/13 9:24
 */
@Service
public class CategoryServiceImpl  implements CategoryService {

    @Autowired
    CategoryMapper categoryMapper;
    public List<Category> findCategoryName() {
        return categoryMapper.selectByExample(null);
    }
}
