package org.tukorea.di.main;

import org.tukorea.myweb.domain.MappingVO;
import org.tukorea.myweb.domain.UserVO;
import org.tukorea.myweb.service.UserService;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class SubscribeSampleMain {
	
	private static ApplicationContext ctx = null;

	public static void main(String[] args) throws Exception {
		
		System.out.println("안녕하세요  AOP-SUBSCRIBE");
		
		ctx = new GenericXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/root-context.xml");
		UserService userService = ctx.getBean(UserService.class);

		
		UserVO user = userService.read("jiyoung");
		System.out.println(user.getUsername());
	
	}

}
