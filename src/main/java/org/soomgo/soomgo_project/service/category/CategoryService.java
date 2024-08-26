package org.soomgo.soomgo_project.service.category;

import org.soomgo.soomgo_project.domain.category.CategoryDTO;

import java.util.List;

public interface CategoryService {


    List<CategoryDTO> getCategoryId(int id);


    List<CategoryDTO> getCategoryZero();

    List<CategoryDTO> getCategoryNotZero();

    int getCategoryByName(String categoryname);

}
