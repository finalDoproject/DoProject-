package com.kh.dp.task.model.vo;

public class TaskKeep {
	
	private int bkmno;
	private int bkbno;
	
	
	
	public TaskKeep() {
		super();
	}


	public TaskKeep(int bkmno, int bkbno) {
		super();
		this.bkmno = bkmno;
		this.bkbno = bkbno;
	}


	public int getBkmno() {
		return bkmno;
	}


	public void setBkmno(int bkmno) {
		this.bkmno = bkmno;
	}


	public int getBkbno() {
		return bkbno;
	}


	public void setBkbno(int bkbno) {
		this.bkbno = bkbno;
	}


	@Override
	public String toString() {
		return "TaskKeep [bkmno=" + bkmno + ", bkbno=" + bkbno + "]";
	}
	
		
	

}
