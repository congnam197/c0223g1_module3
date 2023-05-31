package com.example.tao_ung_dung_quan_ly_san_pham.repository;

import com.example.tao_ung_dung_quan_ly_san_pham.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getProduct();

    void create(Product product);

    void remove(int id);

    void edit(int id, Product product);

    int findById(int id);
}
