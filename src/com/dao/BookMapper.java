package com.dao;

import com.entity.Book;

import java.util.List;
import java.util.Map;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book book);

    int insertSelective(Book book);

    Book selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Book book);

    int updateByPrimaryKeyWithBLOBs(Book book);

    int updateByPrimaryKey(Book book);

    public Book checkName(Map<String, Object> uname);
  
    //  查询所有信息
    public List<Book> getAll(Map<String, Object> map);
    //  获取条数
    public int getCount(Map<String, Object> po);
    //  分页
    public List<Book> getByPage(Map<String, Object> map);
}