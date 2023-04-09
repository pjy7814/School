package org.tukorea.myweb.persistence;

import java.util.List;

import java.util.Map;

import org.tukorea.myweb.domain.MappingVO;
import org.tukorea.myweb.domain.SubscribeVO;
import org.tukorea.myweb.domain.UserVO;

public interface SubscribeDAO {
	public List<SubscribeVO> readId(String subId) throws Exception;
	public List<SubscribeVO> readSubList() throws Exception;
	public List<SubscribeVO> readName(String subName) throws Exception;
	
	public List<MappingVO> readSub(String id) throws Exception;
	public List<MappingVO> readMappingList() throws Exception;
	
	public void addSub(MappingVO mapper) throws Exception;

	public void deleteSub(MappingVO mapper) throws Exception;

	public void update(SubscribeVO sub) throws Exception;


}
