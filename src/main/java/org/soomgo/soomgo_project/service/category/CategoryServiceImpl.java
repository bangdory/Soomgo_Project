package org.soomgo.soomgo_project.service.category;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.dao.category.CategoryDAO;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService{

    private final CategoryDAO categoryDAO;

    @Override
    public List<CategoryDTO> getCategoryId (int id) {
        return categoryDAO.getCategoryId(id);
    }

    @Override
    public List<CategoryDTO> getCategoryAll () {return categoryDAO.getCategoryAll();}

    @Override
    public List<CategoryDTO> getCategoryZero() { return categoryDAO.getCategoryZero(); }

    @Override
    public List<CategoryDTO> getCategoryNotZero() {
        return categoryDAO.getCategoryNotZero();
    }

    @Override
    public int getCategoryByName(String categoryName) {
        CategoryDTO categoryDTO = categoryDAO.getCategoryByName(categoryName);
        if (categoryDTO != null) {
            return categoryDTO.getCategoryNum();
        }
        throw new RuntimeException("Category not found for name: " + categoryName);

    }

//    @Override
//    public List<CategoryDTO> getCategoryId1(){return categoryDAO.getCategoryId1();}
//
//    @Override
//    public List<CategoryDTO> getCategoryId2(){return categoryDAO.getCategoryId2();}
//
//    @Override
//    public List<CategoryDTO> getCategoryId3(){return categoryDAO.getCategoryId3();}
//
//    @Override
//    public List<CategoryDTO> getCategoryId4(){return categoryDAO.getCategoryId4();}
//
//    @Override
//    public List<CategoryDTO> getCategoryId5(){return categoryDAO.getCategoryId5();}

    @Override
    public List<CategoryDTO> getCategoryIdOther() {return categoryDAO.getCategoryIdOther();}
}
