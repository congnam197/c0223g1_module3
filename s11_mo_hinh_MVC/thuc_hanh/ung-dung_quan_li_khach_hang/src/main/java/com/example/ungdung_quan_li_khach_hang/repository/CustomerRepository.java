package com.example.ungdung_quan_li_khach_hang.repository;

import com.example.ungdung_quan_li_khach_hang.model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerRepository implements ICustomerRepository {
    private static Map<Integer, Customer> customer;

    static {
        customer = new HashMap<>();
        customer.put(1, new Customer(1, "Pham Cong Nam", "nam@gmail.com", "Da Nang"));
        customer.put(2, new Customer(2, "Nguyen Van A", "nva@gmail.com", "Ha Noi"));
        customer.put(3, new Customer(3, "Ho Van Dinh", "dinhhv@gmail.com", "Da Nang"));
        customer.put(4, new Customer(4, "Truong Van Chung", "chunght@gmail.com", "Ha Tinh"));
        customer.put(5, new Customer(5, "Nguyen Hoang Duc", "ducnguyen@gmail.com", "Quang Binh"));
        customer.put(6, new Customer(6, "Ho Dinh Hieu", "hieu98@gmail.com", "Quang Nam"));
    }


    @Override
    public List<Customer> getCustomer() {
        return new ArrayList<>(customer.values());
    }

    @Override
    public Map<Integer, Customer> returnCustomer() {
        return customer;
    }

    @Override
    public Customer findById(int id) {
        return customer.get(id);

    }
}
