package com.learn.edu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.learn.edu.entity.Users;
import com.learn.edu.entity.UserProfile;
import com.learn.edu.entity.UserRole;
import com.learn.edu.repository.RoleRepository;
import com.learn.edu.repository.UserProfileRepository;
import com.learn.edu.repository.UserRepository; 
 

@CrossOrigin(origins = "http://localhost:3000")
@Controller
public class LoginController {
	@Autowired
	UserProfileRepository userProfileRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	RoleRepository userRoleRepository;
	
	@RequestMapping(value="/")
	public String login() { 
		return "redirect:/home";
	}
	
	@RequestMapping(value="/login")
	public String login1(HttpServletRequest req,Model model) {
		model.addAttribute("status",req.getSession().getAttribute("status"));
		req.getSession().removeAttribute("status");
		return "login";
	}
	
	@RequestMapping(value = "add-new-user")
	public String registration(HttpServletRequest req,UserProfile profile,Users user) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12); // Strength set as 12
		String encodedPassword = encoder.encode(user.getPassword());
		System.out.println("encodedPassword======"+encodedPassword);
		userProfileRepository.save(profile);
		user.setEnabled(1);
		user.setPassword(encodedPassword);
		userRepository.save(user);
		UserRole userRole=new UserRole();
		userRole.setUsername(user.getUsername());
		userRole.setRole("ROLE_USER");
		userRoleRepository.save(userRole);
		req.getSession().setAttribute("status","1");
		return "redirect:/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/validateUserName")
	public int usernameAvailable(HttpServletRequest req,Model model) {
	  String username=req.getParameter("username");
	  Users user =userRepository.findByUsername(username);
	  int status=0;
	  if(user == null) {
		  status=0;
	  }else {
		  status=1;
	  } 
		return status;
	}
	
}
