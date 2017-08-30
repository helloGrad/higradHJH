package com.grad.admin.security;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD, ElementType.TYPE }) 
@Retention(RetentionPolicy.RUNTIME) 
public @interface Auth {
	
	
	//String role() default "USER"; 
	Role role() default Role.USER;
	//Role[] value() default Role.USER;
	public enum Role {ADMIN, USER }
	
}
