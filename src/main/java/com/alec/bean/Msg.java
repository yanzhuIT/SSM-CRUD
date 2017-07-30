package com.alec.bean;


import java.util.HashMap;
import java.util.Map;

// generic class for JSON
public class Msg {
	// status code
	private int code;
	// prompt message
	private String msg;
	// data returned to browser
	private Map<String, Object> extend = new HashMap<String, Object>();
	
	public static Msg success(){
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("success!");
		return result;
	}
	
	public static Msg failure(){
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("failure!");
		return result;
	}
	
	public Msg add(String key, Object value){
		this.getExtend().put(key, value);
		return this;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

}
