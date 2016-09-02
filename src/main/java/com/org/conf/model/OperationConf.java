package com.org.conf.model;

import java.math.BigDecimal;
import java.util.Date;

import com.org.utils.Page;

public class OperationConf extends Page{
    private Long id;

    private String priceService;

    private String country;

    private String operator;

    private String shortCode;

    private BigDecimal localPrice;

    private String mcc;

    private String mnc;

    private String keyword;

    private Long createUser;

    private Date createTime;

    private Date updateTime;

    private Long updateUser;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getShortCode() {
        return shortCode;
    }

    public void setShortCode(String shortCode) {
        this.shortCode = shortCode == null ? null : shortCode.trim();
    }

    public BigDecimal getLocalPrice() {
        return localPrice;
    }

    public void setLocalPrice(BigDecimal localPrice) {
        this.localPrice = localPrice;
    }

    public String getMcc() {
        return mcc;
    }

    public void setMcc(String mcc) {
        this.mcc = mcc == null ? null : mcc.trim();
    }

    public String getMnc() {
        return mnc;
    }

    public void setMnc(String mnc) {
        this.mnc = mnc == null ? null : mnc.trim();
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public Long getCreateUser() {
        return createUser;
    }

    public void setCreateUser(Long createUser) {
        this.createUser = createUser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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
}