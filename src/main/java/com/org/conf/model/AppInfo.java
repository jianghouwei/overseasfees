package com.org.conf.model;

import java.util.Date;

import com.org.utils.Page;

public class AppInfo extends Page{
    private Long id;

    private String appId;

    private String pkgName;

    private String appName;

    private String appBriefing;

    private Long appUser;

    private Date createTime;

    private Long createUser;

    private Date updateTime;

    private Long updateUser;

    private String channelCode;
    
    private String channelName;
    
    /**
     *  应用所有者名称
     */
    private String name;
    
    private Long count;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId == null ? null : appId.trim();
    }

    public String getPkgName() {
        return pkgName;
    }

    public void setPkgName(String pkgName) {
        this.pkgName = pkgName == null ? null : pkgName.trim();
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName == null ? null : appName.trim();
    }

    public String getAppBriefing() {
        return appBriefing;
    }

    public void setAppBriefing(String appBriefing) {
        this.appBriefing = appBriefing == null ? null : appBriefing.trim();
    }

    public Long getAppUser() {
        return appUser;
    }

    public void setAppUser(Long appUser) {
        this.appUser = appUser;
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

	public String getChannelCode() {
		return channelCode;
	}

	public void setChannelCode(String channelCode) {
		this.channelCode = channelCode;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}
    
    
}