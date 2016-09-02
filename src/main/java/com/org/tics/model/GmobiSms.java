package com.org.tics.model;

import java.util.Date;

import com.org.utils.DateUtil;
import com.org.utils.Page;

public class GmobiSms extends Page{
	private Long id;

	private String operator;

	private String network;

	private String msn;

	private String msgF;

	private String sno;

	private String uid;

	private String channelId;

	private String channelName;

	private String country;

	private String service;

	private Date date;

	private String msisdn;

	private String msgT;

	private String keyword;

	private String appId;

	private String appName;

	private String priceNo;

	private String priceName;

	private String priceLocal;

	private String localPrice;

	private String imsi;

	private String imei;

	private String moNo;

	private String errmsg;

	private String overStatus;

	private String status;

	private String shortCode;

	private Date createTime;

	private Date updateTime;

	private String mcc;

	private String mnc;

	private String priceService;

	/**
     */
	private Date dateStart;

	/**
     */
	private Date dateEnd;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator == null ? null : operator.trim();
	}

	public String getNetwork() {
		return network;
	}

	public void setNetwork(String network) {
		this.network = network == null ? null : network.trim();
	}

	public String getMsn() {
		return msn;
	}

	public void setMsn(String msn) {
		this.msn = msn == null ? null : msn.trim();
	}

	public String getMsgF() {
		return msgF;
	}

	public void setMsgF(String msgF) {
		this.msgF = msgF == null ? null : msgF.trim();
	}

	public String getSno() {
		return sno;
	}

	public void setSno(String sno) {
		this.sno = sno == null ? null : sno.trim();
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid == null ? null : uid.trim();
	}

	public String getChannelId() {
		return channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId == null ? null : channelId.trim();
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country == null ? null : country.trim();
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service == null ? null : service.trim();
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getMsisdn() {
		return msisdn;
	}

	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn == null ? null : msisdn.trim();
	}

	public String getMsgT() {
		return msgT;
	}

	public void setMsgT(String msgT) {
		this.msgT = msgT == null ? null : msgT.trim();
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword == null ? null : keyword.trim();
	}

	public String getAppId() {
		return appId;
	}

	public void setAppId(String appId) {
		this.appId = appId == null ? null : appId.trim();
	}

	public String getPriceNo() {
		return priceNo;
	}

	public void setPriceNo(String priceNo) {
		this.priceNo = priceNo == null ? null : priceNo.trim();
	}

	public String getPriceLocal() {
		return priceLocal;
	}

	public void setPriceLocal(String priceLocal) {
		this.priceLocal = priceLocal == null ? null : priceLocal.trim();
	}

	public String getImsi() {
		return imsi;
	}

	public void setImsi(String imsi) {
		this.imsi = imsi == null ? null : imsi.trim();
	}

	public String getImei() {
		return imei;
	}

	public void setImei(String imei) {
		this.imei = imei == null ? null : imei.trim();
	}

	public String getMoNo() {
		return moNo;
	}

	public void setMoNo(String moNo) {
		this.moNo = moNo == null ? null : moNo.trim();
	}

	public String getErrmsg() {
		return errmsg;
	}

	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg == null ? null : errmsg.trim();
	}

	public String getOverStatus() {
		return overStatus;
	}

	public void setOverStatus(String overStatus) {
		this.overStatus = overStatus == null ? null : overStatus.trim();
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status == null ? null : status.trim();
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

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getPriceName() {
		return priceName;
	}

	public void setPriceName(String priceName) {
		this.priceName = priceName;
	}

	public String getLocalPrice() {
		return localPrice;
	}

	public void setLocalPrice(String localPrice) {
		this.localPrice = localPrice;
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

	public String getPriceService() {
		return priceService;
	}

	public void setPriceService(String priceService) {
		this.priceService = priceService;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(String dateStart) {
		if (dateStart == null || dateStart == "") {
			this.dateStart = null;
		} else {
			this.dateStart = DateUtil.fomatDate(dateStart + " 00:00:00",
					"yyyy-MM-hh HH:mm:ss");
		}
	}

	public Date getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(String dateEnd) {
		if (dateEnd == null || dateEnd == "") {
			this.dateEnd = null;
		} else {
			this.dateEnd = DateUtil.fomatDate(dateEnd + " 23:59:59",
					"yyyy-MM-hh HH:mm:ss");
		}
	}

}