package com.org.tics.model;

import java.util.Date;

import com.org.utils.DateUtil;
import com.org.utils.Page;

public class SalesMsg extends Page{
	
    private Long id;

    private String appId;

    private String lc;//渠道号

    private String brand;//厂商

    private String model;//手机型号

    private String androidVersion;//系统本版

    private String imei;//手机唯一码

    private String imsi;//手机卡唯一码

    private String token;//手机唯一标识

    private String installType;//安装类型  1预置  2安装

    private String appName;

    private String packagename;

    private String version;//应用版本号 

    private Date activitTime;//激活上报时间

    private String ip;

    private String country;

    private String area;

    private String region;

    private String city;

    private String areaId;

    private String countryId;

    private String regionId;

    private String cityId;
    
    private String channelCode;
    
    private String channelName;
    
    /**
     * 上报开始时间
     */
    private Date dateStart;
    
    /**
     * 上报结束时间
     */
    private Date dateEnd;
    
    

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

    public String getLc() {
        return lc;
    }

    public void setLc(String lc) {
        this.lc = lc == null ? null : lc.trim();
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand == null ? null : brand.trim();
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model == null ? null : model.trim();
    }

    public String getAndroidVersion() {
        return androidVersion;
    }

    public void setAndroidVersion(String androidVersion) {
        this.androidVersion = androidVersion == null ? null : androidVersion.trim();
    }

    public String getImei() {
        return imei;
    }

    public void setImei(String imei) {
        this.imei = imei == null ? null : imei.trim();
    }

    public String getImsi() {
        return imsi;
    }

    public void setImsi(String imsi) {
        this.imsi = imsi == null ? null : imsi.trim();
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token == null ? null : token.trim();
    }

    public String getInstallType() {
        return installType;
    }

    public void setInstallType(String installType) {
        this.installType = installType == null ? null : installType.trim();
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName == null ? null : appName.trim();
    }

    public String getPackagename() {
        return packagename;
    }

    public void setPackagename(String packagename) {
        this.packagename = packagename == null ? null : packagename.trim();
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version == null ? null : version.trim();
    }

    public Date getActivitTime() {
        return activitTime;
    }

    public void setActivitTime(Date activitTime) {
        this.activitTime = activitTime;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip == null ? null : ip.trim();
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region == null ? null : region.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getAreaId() {
        return areaId;
    }

    public void setAreaId(String areaId) {
        this.areaId = areaId == null ? null : areaId.trim();
    }

    public String getCountryId() {
        return countryId;
    }

    public void setCountryId(String countryId) {
        this.countryId = countryId == null ? null : countryId.trim();
    }

    public String getRegionId() {
        return regionId;
    }

    public void setRegionId(String regionId) {
        this.regionId = regionId == null ? null : regionId.trim();
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId == null ? null : cityId.trim();
    }

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(String dateStart) {
		if(dateStart == null || dateStart == ""){
			this.dateStart = null;
		}else{
			this.dateStart = DateUtil.fomatDate(dateStart+" 00:00:00","yyyy-MM-hh HH:mm:ss");
		}
	}
	public Date getDateEnd() {
		return dateEnd;
	}

	public void setDateEnd(String dateEnd) {
		if(dateEnd == null || dateEnd == ""){
			this.dateEnd = null;
		}else{
			this.dateEnd = DateUtil.fomatDate(dateEnd+" 23:59:59","yyyy-MM-hh HH:mm:ss");
		}
	}
    
}