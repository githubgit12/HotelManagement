package com.gx.po;

public class TeamMembers {
	private Integer id;
	private String name;
	private String sex;
	private String phoneNumber;
	private String papersNumber;
	private Integer team_id;
	private ReceiveTargetPo receiveTargetPo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPapersNumber() {
		return papersNumber;
	}

	public void setPapersNumber(String papersNumber) {
		this.papersNumber = papersNumber;
	}

	public Integer getTeam_id() {
		return team_id;
	}

	public void setTeam_id(Integer team_id) {
		this.team_id = team_id;
	}

	public ReceiveTargetPo getReceiveTargetPo() {
		return receiveTargetPo;
	}

	public void setReceiveTargetPo(ReceiveTargetPo receiveTargetPo) {
		this.receiveTargetPo = receiveTargetPo;
	}

}
