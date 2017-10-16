package entity;

import java.io.Serializable;

import utils.Values;

public class client implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String tel;
	private String pass;
	private String nickname;
	private String email;
	private String createdate;
	private String lastdate;
	private int question;
	private String questionresult;
	private int status;
	private int logincount;
	private String logindate;
	private String comments;
	private String questionname;
	private String cstatusname;
	
	
	public String getCstatusname() {
		return Values.cstatusname[status];
	}

	public String getQuestionname() {
		return Values.questionname[question];
	}

	public client() {
		super();
	}
	
	
	
	public client(String tel, String pass, String nickname, String email,
			String createdate, String lastdate, int question,
			String questionresult, int status, int logincount,
			String logindate, String comments) {
		super();
		this.tel = tel;
		this.pass = pass;
		this.nickname = nickname;
		this.email = email;
		this.createdate = createdate;
		this.lastdate = lastdate;
		this.question = question;
		this.questionresult = questionresult;
		this.status = status;
		this.logincount = logincount;
		this.logindate = logindate;
		this.comments = comments;
	}

	

	public client(int id,String nickname, String email, String lastdate,
			int question, String questionresult, int status,
			int logincount, String logindate, String comments) {
		super();
		this.id=id;
		this.nickname = nickname;
		this.email = email;
		this.lastdate = lastdate;
		this.question = question;
		this.questionresult = questionresult;
		this.status = status;
		this.logincount = logincount;
		this.logindate = logindate;
		this.comments = comments;
	}

	

	public client(int id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getLastdate() {
		return lastdate;
	}
	public void setLastdate(String lastdate) {
		this.lastdate = lastdate;
	}
	public int getQuestion() {
		return question;
	}
	public void setQuestion(int question) {
		this.question = question;
	}
	public String getQuestionresult() {
		return questionresult;
	}
	public void setQuestionresult(String questionresult) {
		this.questionresult = questionresult;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getLogincount() {
		return logincount;
	}
	public void setLogincount(int logincount) {
		this.logincount = logincount;
	}
	public String getLogindate() {
		return logindate;
	}
	public void setLogindate(String logindate) {
		this.logindate = logindate;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
}
