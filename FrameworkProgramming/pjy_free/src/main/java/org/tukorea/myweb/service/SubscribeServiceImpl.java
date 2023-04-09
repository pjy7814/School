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


//@Service
@Component
public class SubscribeServiceImpl implements SubscribeService{
	
	
	@Autowired
	private SubscribeDAO subscribeDAO;
	
	public List<SubscribeVO> readSubList() throws Exception{
		return subscribeDAO.readSubList();
	}
	
	public List<SubscribeVO> readSubbyId(String subId) throws Exception{
		return subscribeDAO.readId(subId);
	}
	
	public List<SubscribeVO>  readName(String subName) throws Exception{
		return subscribeDAO.readName(subName);
	}
	
	public List<MappingVO> readSub(String id) throws Exception{
		return subscribeDAO.readSub(id);
	}
	
	public List<MappingVO> readMappingList() throws Exception{
		return subscribeDAO.readMappingList();
	}
	
	public void addSub(MappingVO mapper) throws Exception{
		subscribeDAO.addSub(mapper);
	}

	public void deleteSub(MappingVO mapper) throws Exception{
		subscribeDAO.deleteSub(mapper);
	}

	public void updateSub(SubscribeVO sub) throws Exception{
		subscribeDAO.update(sub);
	}

}
