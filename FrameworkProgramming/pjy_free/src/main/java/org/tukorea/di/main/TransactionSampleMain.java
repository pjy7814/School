package org.tukorea.di.main;

import org.springframework.context.ApplicationContext;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.tukorea.myweb.domain.SubscribeVO;
import org.tukorea.myweb.service.SubscribeService;
import org.tukorea.myweb.service.UserService;

public class TransactionSampleMain {
	private static ApplicationContext ctx = null;
	public static void main(String[] args) throws Exception {
		System.out.println("안녕하세요 TRANSACTION-PJY");
		
		ctx = new GenericXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/root-context.xml");
		SubscribeService subscribeService = ctx.getBean(SubscribeService.class);
		
		String strSubID1 = "Netflix1";
		String strSubName1 = "Netflix";
		String strSubPrice1 = "9700";
		String strSubLevel1 = "BASIC";
		String strSubLink1 = "https://www.netflix.com/";
		SubscribeVO vo1 = new SubscribeVO();
		
		vo1.setSubId(strSubID1);
		vo1.setSubLevel(strSubLevel1);
		vo1.setSubName(strSubName1);
		vo1.setSubPrice(strSubPrice1);
		vo1.setSubLink(strSubLink1);
		
		
		try {
			subscribeService.updateSub(vo1);
			System.out.println("Transaction 처리 완료");
		} catch(Exception e) {
			System.out.println(e);
		}
		
		
	}
}
