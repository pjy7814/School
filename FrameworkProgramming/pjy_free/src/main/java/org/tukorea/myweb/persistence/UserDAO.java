package org.tukorea.myweb.persistence;



import org.tukorea.myweb.domain.UserVO;

public interface UserDAO {
	public UserVO read(String id) throws Exception;
	public UserVO readUser(String id) throws Exception;
	public void add(UserVO user) throws Exception;
//	public void addUser(UserVO user) throws Exception;
	public void delete(String id) throws Exception;
	public void update(UserVO user) throws Exception;
}
