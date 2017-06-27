package com.my.vo;

public class Match_room {

	private String room_name;
	private int room_id;
	private String email;
	private int center_id;
	private int location_id;
	private String match_type;
	private String level;
	
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getCenter_id() {
		return center_id;
	}
	public void setCenter_id(int center_id) {
		this.center_id = center_id;
	}
	public int getLocation_id() {
		return location_id;
	}
	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}
	public String getMatch_type() {
		return match_type;
	}
	public void setMatch_type(String match_type) {
		this.match_type = match_type;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	@Override
	public String toString() {
		return "Match_room [room_name=" + room_name + ", room_id=" + room_id + ", email=" + email + ", center_id="
				+ center_id + ", location_id=" + location_id + ", match_type=" + match_type + ", level=" + level + "]";
	}
	
	
	
}
