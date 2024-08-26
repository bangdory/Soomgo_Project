package org.soomgo.soomgo_project.service.category;

import lombok.RequiredArgsConstructor;
import org.soomgo.soomgo_project.dao.category.CategoryDAO;
import org.soomgo.soomgo_project.domain.category.CategoryDTO;
import org.springframework.beans.factory.annotation.Autowired;
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
}
