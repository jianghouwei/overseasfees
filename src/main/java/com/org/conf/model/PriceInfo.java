package com.org.conf.model;

import java.math.BigDecimal;
import java.util.Date;

import com.org.utils.Page;

public class PriceInfo extends Page{
	
    private Long id;

    private String appId;

    private String priceId;

    private String priceName;

    private String priceBriefing;

    private String priceType;

    private String priceService;

    /**
     * 运营商Id
     */
    private Long qcId;
    
    private String country;

    private String operator;

    //当地价格
    private BigDecimal localPrice;
    
    private String localPriceStr;
    
    //全球价格
    private BigDecimal globalPrice;

    private String isTip;

    private String isParam;

    private String params;

    private Date updateTime;

    private Long updateUser;

    private Date createTime;

    private Long createUser;
    
    private String appName;
    
    private String status;

    private String shortCode;

    private String mcc;

    private String mnc;

    private String keyword;

    
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

    public String getPriceId() {
        return priceId;
    }

    public void setPriceId(String priceId) {
        this.priceId = priceId == null ? null : priceId.trim();
    }

    public String getPriceName() {
        return priceName;
    }

    public void setPriceName(String priceName) {
        this.priceName = priceName == null ? null : priceName.trim();
    }

    public String getPriceBriefing() {
        return priceBriefing;
    }

    public void setPriceBriefing(String priceBriefing) {
        this.priceBriefing = priceBriefing == null ? null : priceBriefing.trim();
    }

    public String getPriceType() {
        return priceType;
    }

    public void setPriceType(String priceType) {
        this.priceType = priceType == null ? null : priceType.trim();
    }

    public String getPriceService() {
        return priceService;
    }

    public void setPriceService(String priceService) {
        this.priceService = priceService == null ? null : priceService.trim();
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator == null ? null : operator.trim();
    }

    public BigDecimal getLocalPrice() {
        return localPrice;
    }

    public void setLocalPrice(BigDecimal localPrice) {
        this.localPrice = localPrice;
    }

    public String getIsTip() {
        return isTip;
    }

    public void setIsTip(String isTip) {
        this.isTip = isTip == null ? null : isTip.trim();
    }

    public String getIsParam() {
        return isParam;
    }

    public void setIsParam(String isParam) {
        this.isParam = isParam == null ? null : isParam.trim();
    }

    public String getParams() {
        return params;
    }

    public void setParams(String params) {
        this.params = params == null ? null : params.trim();
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

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public BigDecimal getGlobalPrice() {
		return globalPrice;
	}

	public void setGlobalPrice(BigDecimal globalPrice) {
		this.globalPrice = globalPrice;
	}

	public String getLocalPriceStr() {
		return localPriceStr;
	}

	public void setLocalPriceStr(String localPriceStr) {
		this.localPriceStr = localPriceStr;
	}

	public Long getQcId() {
		return qcId;
	}

	public void setQcId(Long qcId) {
		this.qcId = qcId;
	}

	public String getShortCode() {
		return shortCode;
	}

	public void setShortCode(String shortCode) {
		this.shortCode = shortCode;
	}

	public String getMcc() {
		return mcc;
	}

	public void setMcc(String mcc) {
		this.mcc = mcc;
	}

	public String getMnc() {
		return mnc;
	}

	public void setMnc(String mnc) {
		this.mnc = mnc;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}