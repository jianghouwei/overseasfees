package com.org.system.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.org.utils.Page;

public class UserInfo extends Page{

	private Long id;

	private String name;

	private String loginName;

	private String password;

	private String telName;

	private String telphone;

	private String qq;

	private String email;

	private String companyName;

	private Long userType;

	private Date createTime;

	private Long createUser;

	private Date updateTime;

	private Long updateUser;

	private String icon;

	private Date createDate;

	private String state;

	private Integer loginCount;

	private Date previousVisit;

	private Date lastVisit;

	private String delFlag;

	private String salt;

	private String plainPassword;

	private Set<UserRole> userRoles = new HashSet<UserRole>(0);

	private Date createDateBg;

	private Date createDateEg;

	private String confirmPassword;

	private UserType userTypeModel;

	private String SKIN;

	private Long roleId;

	private String roleName;

	private Long userTypeId;

	private String userTypeName;


	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Long getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(Long updateUser) {
		this.updateUser = updateUser;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getTelName() {
		return telName;
	}

	public void setTelName(String telName) {
		this.telName = telName == null ? null : telName.trim();
	}

	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone == null ? null : telphone.trim();
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq == null ? null : qq.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName == null ? null : companyName.trim();
	}

	public Long getUserType() {
		return userType;
	}

	public void setUserType(Long userType) {
		this.userType = userType;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getCreateUser() {
		return createUser;
	}

	public void setCreateUser(Long createUser) {
		this.createUser = createUser;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Integer getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}

	public Date getPreviousVisit() {
		return previousVisit;
	}

	public void setPreviousVisit(Date previousVisit) {
		this.previousVisit = previousVisit;
	}

	public Date getLastVisit() {
		return lastVisit;
	}

	public void setLastVisit(Date lastVisit) {
		this.lastVisit = lastVisit;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public Set<UserRole> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Set<UserRole> userRoles) {
		this.userRoles = userRoles;
	}

	public Date getCreateDateBg() {
		return createDateBg;
	}

	public void setCreateDateBg(Date createDateBg) {
		this.createDateBg = createDateBg;
	}

	public Date getCreateDateEg() {
		return createDateEg;
	}

	public void setCreateDateEg(Date createDateEg) {
		this.createDateEg = createDateEg;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getPlainPassword() {
		return plainPassword;
	}

	public void setPlainPassword(String plainPassword) {
		this.plainPassword = plainPassword;
	}

	public UserType getUserTypeModel() {
		return userTypeModel;
	}

	public void setUserTypeModel(UserType userTypeModel) {
		this.userTypeModel = userTypeModel;
	}

	public String getSKIN() {
		return SKIN;
	}

	public void setSKIN(String sKIN) {
		SKIN = "default";
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Long getUserTypeId() {
		return userTypeId;
	}

	public void setUserTypeId(Long userTypeId) {
		this.userTypeId = userTypeId;
	}

	public String getUserTypeName() {
		return userTypeName;
	}

	public void setUserTypeName(String userTypeName) {
		this.userTypeName = userTypeName;
	}

	
}