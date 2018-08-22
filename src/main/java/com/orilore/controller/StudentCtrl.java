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
	/**
	 * 添加或更新学生信息的方法
	 * @param bean
	 * @return
	 */
	@RequestMapping("/student/save")
	public boolean save(Students bean){
		return biz.save(bean);
	}
	
	/**
	 * 根据ID删除学生信息的方法
	 * @param id
	 * @return
	 */
	@RequestMapping("/student/remove")
	public boolean remove(int id){
		return biz.remove(id);
	}
	/**
	 * 根据条件查询学生信息的方法
	 * @param page
	 * @param xm
	 * @param sf
	 * @param mz
	 * @param xbbm
	 * @return
	 */
	@RequestMapping("/student/query")
	public Map<String,Object> query(int page,String xm,String sf,String mz,String xbbm){
		//用于封装查询条件
		Map<String,Object> map = new HashMap<>();
		map.put("xm", xm);
		map.put("xbbm", xbbm);
		map.put("sf", sf);
		map.put("mz", mz);
		
		PageHelper.startPage(page,100);
		//将查询条件map传递给业务逻辑层的查询方法
		List<Students> list = biz.query(map);
		Page<Students> pg = (Page<Students>)list;
		int pages = pg.getPages();//获取总页数
		Map<String,Object> result = new HashMap<>();
		result.put("list", list);
		result.put("pages", pages);
		return result;
	}
}
