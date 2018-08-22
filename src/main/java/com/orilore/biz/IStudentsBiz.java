package com.orilore.biz;
import com.orilore.model.*;
import java.util.List;
import java.util.Map;
public interface IStudentsBiz{
	public boolean save(Students students);
	public boolean remove(Integer id);
	public Students find(Integer id);
	public List<Students> query(Map<String,Object> map);
}