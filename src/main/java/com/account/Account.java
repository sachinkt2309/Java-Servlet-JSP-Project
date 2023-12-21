package com.account;

public class Account {

	int CorporateId;
	long AccNumber;
	String AccName;
	String Currency;
	String Branch;
	double AvBalance;
	String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCorporateId() {
		return CorporateId;
	}
	public void setCorporateId(int corporateId) {
		CorporateId = corporateId;
	}
	public long getAccNumber() {
		return AccNumber;
	}
	public void setAccNumber(long accNumber) {
		AccNumber = accNumber;
	}
	public String getAccName() {
		return AccName;
	}
	public void setAccName(String accName) {
		AccName = accName;
	}
	public String getCurrency() {
		return Currency;
	}
	public void setCurrency(String currency) {
		Currency = currency;
	}
	public String getBranch() {
		return Branch;
	}
	public void setBranch(String branch) {
		Branch = branch;
	}
	public double getAvBalance() {
		return AvBalance;
	}
	public void setAvBalance(double avBalance) {
		AvBalance = avBalance;
	}
	
	
}
