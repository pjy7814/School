package org.tukorea.myweb.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.tukorea.myweb.domain.MappingVO;
import org.tukorea.myweb.domain.SubscribeVO;
import org.tukorea.myweb.domain.UserVO;
import org.tukorea.myweb.persistence.SubscribeDAO;
import org.tukorea.myweb.persistence.UserDAO;
import org.springframework.stereotype.Component;


@Service
@Component
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO userDAO;
	
	public UserVO readUser(String id) throws Exception{
		return userDAO.readUser(id);
	}
	
	public UserVO read(String id) throws Exception{
		return userDAO.read(id);
	}
	public void addUser(UserVO user) throws Exception{
		userDAO.add(user);
	}
	public void deleteUser(String id) throws Exception{
		userDAO.delete(id);
	}
	public void updateUser(UserVO user) throws Exception{
		userDAO.update(user);
	}
}
