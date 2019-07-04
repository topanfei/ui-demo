package com.pf.entity;

public class User {

	private Integer userId;
	private String userName;
	private String userPasswd;
	private String isState;
	public User() {}
	public User(Integer userId, String userName, String userPasswd, String isState) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPasswd = userPasswd;
		this.isState = isState;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPasswd() {
		return userPasswd;
	}
	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}
	public String getIsState() {
		return isState;
	}
	public void setIsState(String isState) {
		this.isState = isState;
	}
}
