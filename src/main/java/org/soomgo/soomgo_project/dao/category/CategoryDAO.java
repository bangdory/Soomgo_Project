package org.soomgo.soomgo_project.dao.category;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.soomgo.soomgo_project.mappers.category.CategoryMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class CategoryDAO {

    private final  CategoryMapper categoryMapper;

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
