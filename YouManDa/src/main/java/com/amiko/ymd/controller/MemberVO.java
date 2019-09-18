package com.amiko.ymd.controller;

public class MemberVO {
	String name;
	String nick;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", nick=" + nick + "]";
	}
	
	
}
