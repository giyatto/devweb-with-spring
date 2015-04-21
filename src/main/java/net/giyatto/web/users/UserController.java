package net.giyatto.web.users;

import net.giyatto.dao.users.User;
import net.giyatto.dao.users.UserDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/users")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/form")
	public String form(){
		return "form";
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public String create(User user){
		logger.debug("User : {}", user);
		userDao.create(user);
		logger.debug("Database : {}", userDao.findById(user.getUserId()));
		return "form";
	}
}