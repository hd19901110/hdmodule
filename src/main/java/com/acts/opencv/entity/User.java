package com.acts.opencv.entity;

/**
 * 测试mybitas
 * 
 * @author zhaohuis
 *
 */
public class User {
	private int id;
	private String name;
	private String sex;
	private String age;
	private String stature;
	private String weight;
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getStature() {
		return stature;
	}
	public void setStature(String stature) {
		this.stature = stature;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", sex=" + sex + ", age=" + age + ", stature=" + stature
				+ ", weight=" + weight + "]";
	}
	
	
	

}
