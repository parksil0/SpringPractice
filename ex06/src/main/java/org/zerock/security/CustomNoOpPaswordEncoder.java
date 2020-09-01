package org.zerock.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomNoOpPaswordEncoder implements PasswordEncoder{

	public String encode(CharSequence rawPassword) {
		
		log.warn("before encode" + rawPassword);
		
		return rawPassword.toString();
	}
	
	public boolean matches(CharSequence rawPassword, String encodePassword) {
		
		log.warn("matches : " + rawPassword + ":" + encodePassword);
		
		return rawPassword.toString().equals(encodePassword);
	}
}
