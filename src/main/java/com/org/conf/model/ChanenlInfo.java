package com.org.conf.model;

import java.math.BigDecimal;
import java.util.Date;

import com.org.utils.Page;

public class ChanenlInfo extends Page{
    private Long id;

    private String appId;

    private String channelCode;

    private String channelName;

    private String channelBriefing;

    private Long channelUser;

    private BigDecimal percentage;

    private Date createTime;

    private Long createUser;

    private Date updateTime;

    private Long updateUser;
    /**
     * 渠道所有者
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

    public String getChannelCode() {
        return channelCode;
    }

    public void setChannelCode(String channelCode) {
        this.channelCode = channelCode == null ? null : channelCode.trim();
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName == null ? null : channelName.trim();
    }

    public String getChannelBriefing() {
        return channelBriefing;
    }

    public void setChannelBriefing(String channelBriefing) {
        this.channelBriefing = channelBriefing == null ? null : channelBriefing.trim();
    }

    public Long getChannelUser() {
        return channelUser;
    }

    public void setChannelUser(Long channelUser) {
        this.channelUser = channelUser;
    }

    public BigDecimal getPercentage() {
        return percentage;
    }

    public void setPercentage(BigDecimal percentage) {
        this.percentage = percentage;
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