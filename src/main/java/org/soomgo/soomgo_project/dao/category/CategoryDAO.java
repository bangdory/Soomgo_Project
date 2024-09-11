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

    public List<CategoryDTO> getCategoryAll(){return categoryMapper.getCategoryAll();}

    public List<CategoryDTO> getCategoryZero() {
        return categoryMapper.getCategoryZero();
    }

    public List<CategoryDTO> getCategoryNotZero() {
        return categoryMapper.getCategoryNotZero();
    }

    public CategoryDTO getCategoryByName(String categoryName) {
//    public int getCategoryByName(String categoryName) {
        return categoryMapper.getCategoryByName(categoryName);
    }

//    public List<CategoryDTO> getCategoryId1() {return categoryMapper.getCategoryId1();};
//    public List<CategoryDTO> getCategoryId2() {return categoryMapper.getCategoryId2();};
//    public List<CategoryDTO> getCategoryId3() {return categoryMapper.getCategoryId3();};
//    public List<CategoryDTO> getCategoryId4() {return categoryMapper.getCategoryId4();};
//    public List<CategoryDTO> getCategoryId5() {return categoryMapper.getCategoryId5();};
    public List<CategoryDTO> getCategoryIdOther() {return categoryMapper.getCategoryIdOther();};

}
