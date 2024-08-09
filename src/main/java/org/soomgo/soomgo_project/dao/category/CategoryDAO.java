package org.soomgo.soomgo_project.dao.category;

import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.soomgo.soomgo_project.mappers.category.CategoryMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryDAO {

    private final  CategoryMapper categoryMapper;

    public CategoryDAO(CategoryMapper categoryMapper) {
        this.categoryMapper = categoryMapper;
    }


    public List<CategoryDTO> getCategoryId(int id) {
        return categoryMapper.getCategoryId(id);
    }


    public List<CategoryDTO> getCategoryZero() {
        return categoryMapper.getCategoryZero();
    }

    public List<CategoryDTO> getCategoryNotZero() {
        return categoryMapper.getCategoryNotZero();
    }

}
