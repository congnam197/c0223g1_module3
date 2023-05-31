package com.example.tao_ung_dung_quan_ly_san_pham.service;

import com.example.tao_ung_dung_quan_ly_san_pham.model.Product;
import com.example.tao_ung_dung_quan_ly_san_pham.repository.IProductRepository;
import com.example.tao_ung_dung_quan_ly_san_pham.repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    private IProductRepository productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> getProduct() {
        return productRepository.getProduct();
    }

    @Override
    public void create(Product product) {
        productRepository.create(product);
    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }

    @Override
    public void edit(int id, Product product) {
        productRepository.edit(id, product);
    }
}
