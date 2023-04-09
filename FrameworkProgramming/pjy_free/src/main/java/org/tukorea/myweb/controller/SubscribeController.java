package org.tukorea.myweb.controller;

import java.text.DateFormat;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.tukorea.myweb.domain.MappingVO;
import org.tukorea.myweb.domain.SubscribeVO;
import org.tukorea.myweb.domain.UserVO;
import org.tukorea.myweb.service.SubscribeService;
import org.tukorea.myweb.service.UserService;

@Controller
@RequestMapping(value="/subscribe")
public class SubscribeController {
	private static final Logger logger = LoggerFactory.getLogger(SubscribeController.class);
	
	   @Autowired(required=true)
	   private UserService userService;
	   @Autowired(required=true)
	   private SubscribeService subscribeService;
	   
	   @RequestMapping(value = "/", method = RequestMethod.GET)
		public String home() {
			logger.info("Welcome home! ");
			
			return "subscribe/homePage";	
	   }
	   
	   @RequestMapping(value = "/login", method = RequestMethod.GET)
	   public String login() throws Exception {
		   return "subscribe/login";
	   }
	   
	   @RequestMapping(value = "/logout", method = RequestMethod.GET)
	   public String logout() throws Exception {
		   return "subscribe/login";
	   }
	   
	   @RequestMapping(value = "/user", method = RequestMethod.POST)
	   public String readUser(@RequestParam("id") String id, @RequestParam("passwd") String passwd, Model model) throws Exception {
	   		UserVO user = userService.readUser(id);
	   		
	   		if (user.getPasswd().equals(passwd)){
	   			logger.info("login Success");
	   			model.addAttribute("user", user);
		   		return "subscribe/homePage";
	   		} else {
	   			logger.info("login Fail");
	   			return "subscribe/login";
	   		}
	   }
	   
	   @RequestMapping(value = "/list", method = RequestMethod.GET)
	   public String readSubscribe(@RequestParam("id") String id, Model model) throws Exception {
		   	List<SubscribeVO> subscribeList = subscribeService.readSubbyId(id);
		   	UserVO user = userService.readUser(id);
		   	
		   	model.addAttribute("user", user);
   			model.addAttribute("subscribe", subscribeList);
	   		return "subscribe/subscribe_list";
	   }
	   
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		 public String deleteSubscribe(@RequestParam("id") String id, @RequestParam("subId") String subId) throws Exception {
				   
				   	MappingVO mapper = new MappingVO();
				   	mapper.setId(id);
				   	mapper.setSubId(subId);
				   	subscribeService.deleteSub(mapper);
				   	
			   		return "redirect:/subscribe/list?id="+id;
			}	  
		
		@RequestMapping(value = {"/platformList"}, method = RequestMethod.GET)
		   public String platformList(@RequestParam("id") String id) throws Exception {
			   
			   return "subscribe/platformList";
		}
		
		@RequestMapping(value = {"/platformPriceList"}, method = RequestMethod.GET)
		   public String platformPriceList(@RequestParam("id") String id,@RequestParam("platform") String platform, Model model) throws Exception {
			
				List<SubscribeVO> subscribeList = subscribeService.readName(platform);
				
				model.addAttribute("subscribe", subscribeList);
			   return "subscribe/subscribe_insertList";
		}
		
		@RequestMapping(value = "/addSubscribe", method = RequestMethod.GET)
		   public String addSubscribe(@RequestParam("id") String id, @RequestParam("platformId") String platformId, Model model) throws Exception {
			   
			   	MappingVO mapper = new MappingVO();
			   	mapper.setId(id);
			   	mapper.setSubId(platformId);
			   	subscribeService.addSub(mapper);
			   	
		   		return "redirect:/subscribe/list?id="+id;
		}

}
