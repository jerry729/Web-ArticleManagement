package com.service.impl;

import com.dao.BookMapper;
import com.entity.Book;
import com.service.BookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class BookServiceImpl implements BookService {
	@Resource
    private BookMapper bookdao;

	@Override
	public int add(Book po) {
		return bookdao.insertSelective(po);
	}
	@Override
	public int update(Book po) {
		return bookdao.updateByPrimaryKeySelective(po);
	}
	@Override
	public int delete(int id) {
		return bookdao.deleteByPrimaryKey(id);
	}
	@Override
	public List<Book> getAll(Map<String, Object> map) {
		return bookdao.getAll(map);
	}
	@Override
	public Book checkName(Map<String, Object> account) {
		return bookdao.checkName(account);
	}
	@Override
	public List<Book> getByPage(Map<String, Object> map) {
		return bookdao.getByPage(map);
	}
	@Override
	public int getCount(Map<String, Object> po) {
		return bookdao.getCount(po);
	}
	@Override
	public Book getById(int id) {
		return bookdao.selectByPrimaryKey(id);
	}

}
