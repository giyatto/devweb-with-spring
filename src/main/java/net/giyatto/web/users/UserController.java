package net.giyatto.web.users;

import java.util.List;

import javax.validation.Valid;

import net.giyatto.dao.users.User;
import net.giyatto.dao.users.UserDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/users")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserDao userDao;
	
	@RequestMapping("/form")
	public String form(Model model){
		model.addAttribute("user", new User());
		return "form";
	}
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public String create(@Valid User user, BindingResult bindingResult){	//@Valid 붙여주고, 결과를 bindingResult에 담아준다.
		logger.debug("User : {}", user);
		if(bindingResult.hasErrors()){
			logger.debug("Binding Result has error!");
			List<ObjectError> errors = bindingResult.getAllErrors();
			for(ObjectError error : errors){
				logger.debug("error : {}", error.getDefaultMessage());
			}
			return "form";
		}
		userDao.create(user);
		logger.debug("Database : {}", userDao.findById(user.getUserId()));
		return "redirect:/";
	}
}
