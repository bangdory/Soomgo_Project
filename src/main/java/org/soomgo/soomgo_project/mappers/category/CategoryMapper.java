package org.soomgo.soomgo_project.mappers.category;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;

import java.util.List;

@Mapper
public interface CategoryMapper {


    List<CategoryDTO> getCategoryId(int id);


    List<CategoryDTO> getCategoryZero();

    List<CategoryDTO> getCategoryNotZero();

    public CategoryDTO getCategoryByName(String categoryName);
//    public int getCategoryByName(String categoryName);

}
