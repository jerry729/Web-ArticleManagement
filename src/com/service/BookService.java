package com.service;

import com.entity.Book;

import java.util.List;
import java.util.Map;


public interface BookService {

//  添加
  public int add(Book po);
//  获取单个信息
  public Book getById(int id);
//  修改
  public int update(Book po);
//  删除
  public int delete(int id);
//  查询
  public List<Book> getAll(Map<String, Object> map);
//  验证名称
  public Book checkName(Map<String, Object> account);
//  分页显示
  public List<Book> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> po);

}