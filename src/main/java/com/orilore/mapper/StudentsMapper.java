package com.orilore.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.orilore.model.*;

@Mapper
public interface StudentsMapper{
	public boolean insert(Students bean);
	public Students selectOne(Integer id);
	public boolean delete(Integer id);
	public List<Students> select();
	public boolean update(Students bean);
}