package com.example.ungdung_quan_li_khach_hang.service;

import com.example.ungdung_quan_li_khach_hang.model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> getCustomer();

    void save(Customer customer);

    void edit(int id, Customer customer);

    void delete(int id);

    Customer findById(int id);
}
