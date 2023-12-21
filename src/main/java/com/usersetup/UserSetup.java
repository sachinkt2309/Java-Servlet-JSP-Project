package com.usersetup;

public class UserSetup {
int CorporateId;
String UserId;
String UserPassword;
String Department;
String Address;
long PhoneNumber;
int DeleteStatus;
int NewUser;
public int getNewUser() {
	return NewUser;
}
public void setNewUser(int newUser) {
	NewUser = newUser;
}
public int getCorporateId() {
	return CorporateId;
}
public void setCorporateId(int corporateId) {
	CorporateId = corporateId;
}
public String getUserId() {
	return UserId;
}
public void setUserId(String userId) {
	UserId = userId;
}
public String getUserPassword() {
	return UserPassword;
}
public void setUserPassword(String userPassword) {
	UserPassword = userPassword;
}
public String getDepartment() {
	return Department;
}
public void setDepartment(String department) {
	Department = department;
}
public String getAddress() {
	return Address;
}
public void setAddress(String address) {
	Address = address;
}
public long getPhoneNumber() {
	return PhoneNumber;
}
public void setPhoneNumber(long phoneNumber) {
	PhoneNumber = phoneNumber;
}
public int getDeleteStatus() {
	return DeleteStatus;
}
public void setDeleteStatus(int deleteStatus) {
	DeleteStatus = deleteStatus;
}

}
