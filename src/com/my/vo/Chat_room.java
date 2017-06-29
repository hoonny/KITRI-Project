package com.my.vo;

public class Chat_room {
	
	private String owner_id;
	private String user_id;
	private int count;
	
	public String getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(String owner_id) {
		this.owner_id = owner_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "Chat_room [owner_id=" + owner_id + ", user_id=" + user_id + ", count=" + count + "]";
	}
	
	
	
	
}
