package org.soomgo.soomgo_project.service.category;

import org.soomgo.soomgo_project.domain.category.CategoryDTO;

import java.util.List;

public interface CategoryService {


    List<CategoryDTO> getCategoryId(int id);

    List<CategoryDTO> getCategoryAll();

    List<CategoryDTO> getCategoryZero();

    List<CategoryDTO> getCategoryNotZero();

//    List<CategoryDTO> getCategoryId1();
//    List<CategoryDTO> getCategoryId2();
//    List<CategoryDTO> getCategoryId3();
//    List<CategoryDTO> getCategoryId4();
    List<CategoryDTO> getCategoryIdOther();
}
