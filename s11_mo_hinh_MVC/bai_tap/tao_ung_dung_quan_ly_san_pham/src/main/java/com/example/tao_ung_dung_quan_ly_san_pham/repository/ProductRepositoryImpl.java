package com.example.tao_ung_dung_quan_ly_san_pham.repository;

import com.example.tao_ung_dung_quan_ly_san_pham.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {
    static List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product(1, "Galaxy S23 Ultra", 1100, "Samsung Ultra |256Gb| 8G| Black PhanTom"));
        productList.add(new Product(2, "Galaxy Tab S8", 910, "Samsung Galaxy Tab S8| 128GB| 5G|Xám Bóng Đêm"));
        productList.add(new Product(3, "Galaxy Z Flip4", 850, "Samsung Galaxy Z Flip4| 128GB ｜8GB|Tím Bora"));
        productList.add(new Product(4, "Galaxy M14 5G", 468, "Samsung Galaxy M14 5G|128GB | 6GB|Xanh tinh tế"));
        productList.add(new Product(5, "Galaxy S22 Ultra", 1050, "Samsung Galaxy S22 Ultra| 128GB | 8GB|Đỏ Burgundy"));
        productList.add(new Product(6, "Galaxy S22 Ultra", 1050, "Samsung Galaxy S22 Ultra| 128GB | 8GB|Đỏ Burgundy"));
        productList.add(new Product(7, "Galaxy S22 Ultra", 1050, "Samsung Galaxy S22 Ultra| 128GB | 8GB|Đỏ Burgundy"));
        productList.add(new Product(8, "Galaxy S22 Ultra", 1050, "Samsung Galaxy S22 Ultra| 128GB | 8GB|Đỏ Burgundy"));
        productList.add(new Product(9, "Galaxy S22 Ultra", 1050, "Samsung Galaxy S22 Ultra| 128GB | 8GB|Đỏ Burgundy"));
        productList.add(new Product(10, "Galaxy S22 Ultra", 1050, "Samsung Galaxy S22 Ultra| 128GB | 8GB|Đỏ Burgundy"));
        productList.add(new Product(11, "Galaxy S22 Ultra", 1050, "Samsung Galaxy S22 Ultra| 128GB | 8GB|Đỏ Burgundy"));
        productList.add(new Product(12, "Galaxy S22 Ultra", 1050, "Samsung Galaxy S22 Ultra| 128GB | 8GB|Đỏ Burgundy"));
        productList.add(new Product(13, "Galaxy S22 Ultra", 1050, "Samsung Galaxy S22 Ultra| 128GB | 8GB|Đỏ Burgundy"));
    }

    @Override
    public List<Product> getProduct() {
        return productList;
    }

    @Override
    public void create(Product product) {
        productList.add(product);
    }

    @Override
    public void remove(int id) {
        productList.remove(findById(id));
    }


    @Override
    public void edit(int id, Product product) {

        productList.set(findById(id),product);
    }

    @Override
    public int findById(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (id == productList.get(i).getId()) {
                return i;
            }
        }
        return -1;
    }
}


