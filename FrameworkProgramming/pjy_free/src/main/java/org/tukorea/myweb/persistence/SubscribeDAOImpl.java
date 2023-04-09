package org.tukorea.myweb.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.tukorea.myweb.domain.MappingVO;
import org.tukorea.myweb.domain.SubscribeVO;
import org.tukorea.myweb.domain.UserVO;

@Repository
public class SubscribeDAOImpl implements SubscribeDAO{
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.tukorea.myweb.mapper.SubscribeMapper";
	
	public List<SubscribeVO> readSubList() throws Exception {
		List<SubscribeVO> subscribeList = new ArrayList<SubscribeVO>();
		subscribeList = sqlSession.selectList(namespace + ".selectAllSubscribe");
		return subscribeList;
	}
	
	public List<SubscribeVO> readId(String subId) throws Exception {
		List<SubscribeVO> subscribeList = new ArrayList<SubscribeVO>();
		subscribeList = sqlSession.selectList(namespace+".selectByid", subId);
		return subscribeList;   
	}
	
	public List<SubscribeVO> readName(String subName) throws Exception {
		List<SubscribeVO> subscribeList = new ArrayList<SubscribeVO>();
		subscribeList = sqlSession.selectList(namespace+".selectByName", subName);
		return subscribeList;   
	}
	
	public List<MappingVO> readSub(String id) throws Exception {
		List<MappingVO> mappingList = new ArrayList<MappingVO>();
		mappingList = sqlSession.selectList(namespace+".selectSubById", id);
		return mappingList; 
	}
	
	public List<MappingVO> readMappingList() throws Exception {
		List<MappingVO> mappingList = new ArrayList<MappingVO>();
		mappingList = sqlSession.selectList(namespace + ".selectAll");
		return mappingList;
	}
	
	public void addSub(MappingVO mapper) throws Exception {
		sqlSession.insert(namespace + ".insertSub", mapper);
	}

	public void deleteSub(MappingVO mapper) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + ".deleteSub", mapper);
	}

	public void update(SubscribeVO sub) throws Exception {
		// TODO Auto-generated method stub
	    sqlSession.update(namespace + ".updateSub", sub);
	}
}
