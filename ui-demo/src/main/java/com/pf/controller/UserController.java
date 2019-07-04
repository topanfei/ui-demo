package com.pf.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pf.entity.User;

@Controller
@RequestMapping("/module")
public class UserController {

	/**
	 * 查看列表信息
	 * @return
	 */
	@RequestMapping(value="dataList",method=RequestMethod.POST)
	public String dataList(Model model,Integer pageSize){
		System.out.println("pageSize="+pageSize);
		pageSize = pageSize==null ? 50:pageSize;
		List<User> userList = new ArrayList<User>();
		for(int i = 0;i<pageSize;i++) {
			User u = new User(i+1, "张三"+i, "111", "0");
			userList.add(u);
		}
		model.addAttribute("userList", userList);
		return "module/dataList";
	}
}
