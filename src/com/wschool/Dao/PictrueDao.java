package com.wschool.Dao;

import java.util.List;

import com.wschool.entity.Pictrue;

public interface PictrueDao {
       public List<Pictrue> findall();
       public int add(Pictrue p);
       public Pictrue findbyid(int id);
       public int delete(int id);
}
