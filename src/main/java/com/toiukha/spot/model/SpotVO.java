package com.toiukha.spot.model;

import java.io.Serializable;

public class SpotVO implements Serializable {
//	private static final long serialVersionUID = 1L;

	private Integer spotId;
	private String spotName;	//景點名稱
	private Integer crtId;		//會員ID
	private String spotLoc;		//地址
	private Double spotLat;		//緯度
	private Double spotLng;		//經度
	private Byte spotStatus;	//狀態
	private String spotDesc;	//描述

	// 無參數建構子
	public SpotVO() {
		super();
	}

	// get,set
	public Integer getSpotId() {
		return spotId;
	}

	public void setSpotId(Integer spotId) {
		this.spotId = spotId;
	}

	public String getSpotName() {
		return spotName;
	}

	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}

	public Integer getCrtId() {
		return crtId;
	}

	public void setCrtId(Integer crtId) {
		this.crtId = crtId;
	}

	public String getSpotLoc() {
		return spotLoc;
	}

	public void setSpotLoc(String spotLoc) {
		this.spotLoc = spotLoc;
	}

	public Double getSpotLat() {
		return spotLat;
	}

	public void setSpotLat(Double spotLat) {
		this.spotLat = spotLat;
	}

	public Double getSpotLng() {
		return spotLng;
	}

	public void setSpotLng(Double spotLng) {
		this.spotLng = spotLng;
	}

	public Byte getSpotStatus() {
		return spotStatus;
	}

	public void setSpotStatus(Byte spotStatus) {
		this.spotStatus = spotStatus;
	}

	public String getSpotDesc() {
		return spotDesc;
	}

	public void setSpotDesc(String spotDesc) {
		this.spotDesc = spotDesc;
	}

}
