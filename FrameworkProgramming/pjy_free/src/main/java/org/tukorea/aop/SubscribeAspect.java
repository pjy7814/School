package org.tukorea.aop;

import org.aspectj.lang.JoinPoint;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.tukorea.myweb.domain.UserVO;

@Aspect
@Component
public class SubscribeAspect {
	
	@Around("execution(* read(String))")
	public UserVO aroundMethod(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("[AroundMethod before] : 메소드 호출 전");
		UserVO user = (UserVO) pjp.proceed();
		System.out.println("[AroundMethod after] : 메소드 호출 후");
		return user;
	}

}
