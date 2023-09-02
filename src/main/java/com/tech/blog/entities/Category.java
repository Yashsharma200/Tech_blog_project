package com.tech.blog.entities;

public class Category {
	private int id;
	private String name;
	private String descrition;
	
	public Category(int id, String name, String descrition) {
		super();
		this.id = id;
		this.name = name;
		this.descrition = descrition;
	}

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescrition() {
		return descrition;
	}

	public void setDescrition(String descrition) {
		this.descrition = descrition;
	}
	
	
	
}
