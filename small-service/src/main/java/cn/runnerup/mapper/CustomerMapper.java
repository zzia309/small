package cn.runnerup.mapper;

import java.util.List;
import java.util.Map;

import cn.runnerup.model.Customer;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

    List<Customer> getAllCustomersByCreatedby(Integer id);

    List<Customer> selectAllCustomer();

    int getCustomersCount(Map<String, Object> map);

    List<Customer> getCustomers(Map<String, Object> map);
}