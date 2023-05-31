package com.example.ungdung_quan_li_khach_hang.service;

import com.example.ungdung_quan_li_khach_hang.model.Customer;
import com.example.ungdung_quan_li_khach_hang.repository.CustomerRepository;
import com.example.ungdung_quan_li_khach_hang.repository.ICustomerRepository;

import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();
    Map<Integer, Customer> customerMap = customerRepository.returnCustomer();

    @Override
    public List<Customer> getCustomer() {
        return customerRepository.getCustomer();
    }

    @Override
    public void save(Customer customer) {

        customerMap.put(customer.getId(), customer);
    }

    @Override
    public void edit(int id, Customer customer) {
        customerMap.put(id, customer);
    }

    @Override
    public void delete(int id) {
        customerMap.remove(id);
    }

    @Override
    public Customer findById(int id) {
        return customerMap.get(id);
    }
}
