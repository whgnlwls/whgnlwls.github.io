package personal;

public class personalDTO {
	String userId;
	String userPasswd;
	String userName;
	String userEmail;
	String userPhone;
	String userGender;
	String[] userHobby;
	String userRegdate;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String[] getUserHobby() {
		return userHobby;
	}
	public void setUserHobby(String[] userHobby) {
		this.userHobby = userHobby;
	}
	public String getUserRegdate() {
		return userRegdate;
	}
	public void setUserRegdate(String userRegdate) {
		this.userRegdate = userRegdate;
	}
	boolean loginStat;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {	
		this.userId = userId;
	}
	public String getUserPasswd() {
		return userPasswd;
	}
	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}
	public boolean isLoginStat() {
		return loginStat;
	}
	public void setLoginStat(boolean loginStat) {
		this.loginStat = loginStat;
	}
}
