package com.kh.dp.project.model.vo;

public class TaskCount {

	private int one;
	private int two;
	private int three;
	private int four;
	private int five;
	
	public TaskCount() {
		super();
	}
	public TaskCount(int one, int two, int three, int four, int five) {
		super();
		this.one = one;
		this.two = two;
		this.three = three;
		this.four = four;
		this.five = five;
	}
	public int getOne() {
		return one;
	}
	public void setOne(int one) {
		this.one = one;
	}
	public int getTwo() {
		return two;
	}
	public void setTwo(int two) {
		this.two = two;
	}
	public int getThree() {
		return three;
	}
	public void setThree(int three) {
		this.three = three;
	}
	public int getFour() {
		return four;
	}
	public void setFour(int four) {
		this.four = four;
	}
	public int getFive() {
		return five;
	}
	public void setFive(int five) {
		this.five = five;
	}
	@Override
	public String toString() {
		return "TaskCount [one=" + one + ", two=" + two + ", three=" + three + ", four=" + four + ", five=" + five
				+ "]";
	}
	
}
