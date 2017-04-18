package com.wschool.Dao;

import java.util.List;

import com.wschool.entity.OProduct;

public interface OProductDao {
    public int add(OProduct op);
    public List<OProduct> findbyorderid(int id);
}
