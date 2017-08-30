package com.grad.admin.dto;

public class JSONResult {
	
	private String result; 	
	private String message; 
	private Object data; 	
	
	public JSONResult(String result, String message, Object data){
		this.result = result;
		this.message = message;
		this.data = data;
	}

	public static JSONResult success(Object data){
		return new JSONResult("success",null,data);
	}
	
	public static JSONResult error(String message){
		return new JSONResult("fail",message,null);
	}

	public String getResult() {
		return result;
	}

	public String getMessage() {
		return message;
	}

	public Object getData() {
		return data;
	}

}