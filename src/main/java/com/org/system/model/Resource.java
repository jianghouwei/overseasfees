package com.org.system.model;

import java.util.List;

public class Resource {
    private Long id;

    private String url;

    private String code;

    private String name;

    private Integer levelPid;

    private Integer levelLag;
    
    private Integer leveSort;
    
    private String iconUrl;
    
    private List<Resource> subMenu;
    
    private Boolean hasMenu;
    
    private Long roleId;
    
    private String msg;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getLevelPid() {
        return levelPid;
    }

    public void setLevelPid(Integer levelPid) {
        this.levelPid = levelPid;
    }

    public Integer getLevelLag() {
        return levelLag;
    }

    public void setLevelLag(Integer levelLag) {
        this.levelLag = levelLag;
    }

	public Integer getLeveSort() {
		return leveSort;
	}

	public void setLeveSort(Integer leveSort) {
		this.leveSort = leveSort;
	}

	public String getIconUrl() {
		return iconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}

	public List<Resource> getSubMenu() {
		return subMenu;
	}

	public void setSubMenu(List<Resource> subMenu) {
		this.subMenu = subMenu;
	}

	public Boolean getHasMenu() {
		return hasMenu;
	}

	public void setHasMenu(Boolean hasMenu) {
		this.hasMenu = hasMenu;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	

}