package com.garvintimothy.authentication.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.garvintimothy.authentication.models.LoginUser;
import com.garvintimothy.authentication.models.User;
import com.garvintimothy.authentication.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;
	
	public User register(User newUser, BindingResult result) {
		Optional<User> potentialNewUser = userRepo.findByEmail(newUser.getEmail());
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The Confirm Password must match Password.");
		}
		else if (potentialNewUser.isPresent()){
			result.rejectValue("email", "Present", "This email is already assigned to an account.");
			return null;
		}
		else if (result.hasErrors()) {
			return null;
		}  
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		return userRepo.save(newUser); 
		
	}
	
	public User login(LoginUser newLoginObject, BindingResult result) {
		Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
		if (result.hasErrors()) {
			return null;
		}
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "Absent", "We did not find an email matching yours. Did you make a typo?");
			return null;
		} 
		User user = potentialUser.get();

		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Password!");
			return null;
		}
		return user;
		
	}
}
