package com.wschool.Dao;

import java.util.List;

import com.wschool.entity.Address;

public interface AddressDao {
    public int add(Address address);
    public Address findbyid(int id);
    public void delete(int id);
    public List<Address> findbyuid(int uid);
}
