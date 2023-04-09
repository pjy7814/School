package org.tukorea.myweb.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.tukorea.myweb.domain.UserVO;

//@Repository
@Component
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.tukorea.myweb.mapper.UserMapper";

	private Map<String, UserVO> storage = new HashMap<String, UserVO>(); 
	
	public UserVO read(String id) throws Exception { 
//		return storage.get(id); 
		UserVO vo = sqlSession.selectOne(namespace+".selectByid", id);
		return vo;  
	}
	
	public void add(UserVO user) throws Exception {
		storage.put(user.getId(), user);
	}
	
	public UserVO readUser(String id) throws Exception {
		
		UserVO vo = sqlSession.selectOne(namespace+".selectByid", id);
		return vo;   
	}
 
//	public void addUser(UserVO user) throws Exception {
//		sqlSession.insert(namespace + ".insert", user);
//	}

	public void delete(String id) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".delete", id);
	}

	public void update(UserVO user) throws Exception {
		// TODO Auto-generated method stub
	    sqlSession.update(namespace + ".update", user);
	}
}
