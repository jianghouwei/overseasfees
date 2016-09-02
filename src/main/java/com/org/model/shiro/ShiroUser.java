package com.org.model.shiro;

import java.io.Serializable;
import java.util.Set;

import com.google.common.base.Objects;
import com.org.system.model.UserType;

/**
 * 自定义Authentication对象，使得Subject除了携带用户的登录名外还可以携带更多信息.
 */
public class ShiroUser implements Serializable {

	/**
	 * serialVersionUID:TODO(用一句话描述这个变量表示什么).
	 * @since JDK 1.7
	 */
	private static final long serialVersionUID = 8255683668102181982L;
	
	private Long id;
	private String loginName;
	private String name;
	private Long userType;
	private Set<String> roles;
	private Set<String> stringPermissions;
	private UserType userTypeModel;

	public ShiroUser(Long id, String loginName, String name) {
		this.id = id;
		this.loginName = loginName;
		this.name = name;
	}
	

	public ShiroUser(Long id, String loginName, String name, Long userType) {
		super();
		this.id = id;
		this.loginName = loginName;
		this.name = name;
		this.userType = userType;
	}

	public ShiroUser(Long id, String loginName, String name, Long userType,
			Set<String> roles, Set<String> stringPermissions) {
		super();
		this.id = id;
		this.loginName = loginName;
		this.name = name;
		this.userType = userType;
		this.roles = roles;
		this.stringPermissions = stringPermissions;
	}

	

	public ShiroUser(Long id, String loginName, String name, Long userType,
			Set<String> roles, Set<String> stringPermissions,
			UserType userTypeModel) {
		super();
		this.id = id;
		this.loginName = loginName;
		this.name = name;
		this.userType = userType;
		this.roles = roles;
		this.stringPermissions = stringPermissions;
		this.userTypeModel = userTypeModel;
	}


	public Set<String> getRoles() {
		return roles;
	}


	public Set<String> getStringPermissions() {
		return stringPermissions;
	}

	

	public UserType getUserTypeModel() {
		return userTypeModel;
	}


	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}
	
	public Long getUserType() {
		return userType;
	}
	

	public String getLoginName() {
		return loginName;
	}



	/**
	 * 本函数输出将作为默认的<shiro:principal/>输出.
	 */
	@Override
	public String toString() {
		return loginName;
	}

	/**
	 * 重载hashCode,只计算loginName;
	 */
	@Override
	public int hashCode() {
		return Objects.hashCode(loginName);
	}

	/**
	 * 重载equals,只计算loginName;
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		ShiroUser other = (ShiroUser) obj;
		if (loginName == null) {
			if (other.loginName != null) {
				return false;
			}
		} else if (!loginName.equals(other.loginName)) {
			return false;
		}
		return true;
	}

	
	
	

}
