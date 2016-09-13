package com.somemall.web.controller;

import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.somemall.dao.InsDao;


@Controller
@RequestMapping("/user")
public class Inserter {

	@Resource
	private InsDao insDao;
	Random r = new Random();  
	
	
	@RequestMapping("/ins.do")
	public String rrr(){
		for(int i=1;i<667;i++){
			double price = 400.0+r.nextInt(100);
			String str = "米其林轮胎,型号:"+String.valueOf(i);
			insDao.insertIntoDB(str, 8, price, 100, str);
			//                 name catid      num  display
		}
		return "home/inssuccess";
	}


}