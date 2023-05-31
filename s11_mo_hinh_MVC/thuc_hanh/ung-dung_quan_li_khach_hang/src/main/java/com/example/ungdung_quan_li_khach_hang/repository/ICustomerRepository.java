package com.example.ungdung_quan_li_khach_hang.repository;

import com.example.ungdung_quan_li_khach_hang.model.Customer;

import java.util.List;
import java.util.Map;


public interface ICustomerRepository {
    List<Customer> getCustomer();

    Map<Integer, Customer> returnCustomer();

    Customer findById(int id);
}
