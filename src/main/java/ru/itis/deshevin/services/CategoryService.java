package ru.itis.deshevin.services;

import ru.itis.deshevin.dto.CategoryDto;
import ru.itis.deshevin.models.CategoryEntity;

import java.util.List;
import java.util.Set;
import java.util.UUID;

public interface CategoryService {

    List<CategoryDto> getAllCategory();

    void saveCategory(CategoryDto categoryDto);

    void deleteCategory(String id);

    Set<CategoryEntity> getCategoriesById(List<String> categoriesId);
}
