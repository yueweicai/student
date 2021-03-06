package com.orilore.biz;
import com.orilore.model.*;
import com.orilore.mapper.*;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class StudentsBiz implements IStudentsBiz{
	@Resource
	private StudentsMapper mapper;

	@Override
	public boolean save(Students bean) {
		if(bean.getId()!=null){
			return this.mapper.update(bean);
		}else{
			return this.mapper.insert(bean);
		}
	}

	@Override
	public boolean remove(Integer id) {
		return this.mapper.delete(id);
	}

	@Override
	public Students find(Integer id) {
		return this.mapper.selectOne(id);
	}

	@Override
	public List<Students> query(Map<String,Object> map) {
		//将查询条件map传递给数据访问层的select方法
		return this.mapper.select(map);
	}
}
