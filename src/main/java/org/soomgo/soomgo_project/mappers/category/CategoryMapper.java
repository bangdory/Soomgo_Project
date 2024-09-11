package org.soomgo.soomgo_project.mappers.category;

import org.apache.ibatis.annotations.Mapper;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;

import java.util.List;

@Mapper
public interface CategoryMapper {


    List<CategoryDTO> getCategoryId(int id);

    List<CategoryDTO> getCategoryAll();


    List<CategoryDTO> getCategoryZero();

    List<CategoryDTO> getCategoryNotZero();

    public CategoryDTO getCategoryByName(String categoryName);
//    public int getCategoryByName(String categoryName);

    List<CategoryDTO> getCategoryId1();
    List<CategoryDTO> getCategoryId2();
    List<CategoryDTO> getCategoryId3();
    List<CategoryDTO> getCategoryId4();
    List<CategoryDTO> getCategoryId5();
    List<CategoryDTO> getCategoryIdOther();

}
