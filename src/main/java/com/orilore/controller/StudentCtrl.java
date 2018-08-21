package com.orilore.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.orilore.biz.IStudentsBiz;
import com.orilore.model.Students;

@RestController
public class StudentCtrl {
	@Resource
	private IStudentsBiz biz;
	
	@RequestMapping("/student/query")
	public Map<String,Object> query(int page){
		PageHelper.startPage(page,100);
		List<Students> list = biz.query();
		Page<Students> pg = (Page<Students>)list;
		int pages = pg.getPages();//获取总页数
		Map<String,Object> result = new HashMap<>();
		result.put("list", list);
		result.put("pages", pages);
		return result;
	}
}
