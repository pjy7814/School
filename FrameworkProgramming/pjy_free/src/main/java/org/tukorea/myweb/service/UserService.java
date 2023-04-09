package org.tukorea.myweb.service;

import java.util.List;
import java.util.Map;

import org.tukorea.myweb.domain.MappingVO;
import org.tukorea.myweb.domain.SubscribeVO;
import org.tukorea.myweb.domain.UserVO;

public interface UserService {
	
	public UserVO read(String id) throws Exception;
	public UserVO readUser(String id) throws Exception;
	public void addUser(UserVO user) throws Exception;
	
	public void deleteUser(String id) throws Exception;
	public void updateUser(UserVO user) throws Exception;
}
