package com.corporate;

public class Corporate {
int CorporateId;
String CorporateName;
String Address;
long phoneNumber;
int DeleteStatus;
public int getDeleteStatus() {
	return DeleteStatus;
}
public void setDeleteStatus(int deleteStatus) {
	DeleteStatus = deleteStatus;
}
public int getCorporateId() {
	return CorporateId;
}
public void setCorporateId(int corporateId) {
	CorporateId = corporateId;
}
public String getCorporateName() {
	return CorporateName;
}
public void setCorporateName(String corporateName) {
	CorporateName = corporateName;
}
public String getAddress() {
	return Address;
}
public void setAddress(String address) {
	Address = address;
}
public long getPhoneNumber() {
	return phoneNumber;
}
public void setPhoneNumber(long phoneNumber) {
	this.phoneNumber = phoneNumber;
}

}
