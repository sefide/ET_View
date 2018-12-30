package com.kh.et.manager.model.vo;

public class PlanInterest implements java.io.Serializable{
	
	private String PI_type;
	
	public PlanInterest() {}

	public String getPI_type() {
		return PI_type;
	}

	public void setPI_type(String pI_type) {
		PI_type = pI_type;
	}

	public PlanInterest(String pI_type) {
		super();
		PI_type = pI_type;
	}

	@Override
	public String toString() {
		return "PlanInterest [PI_type=" + PI_type + "]";
	}

	
	

}
