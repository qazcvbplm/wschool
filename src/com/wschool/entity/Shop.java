package com.wschool.entity;

import java.io.Serializable;
import java.util.List;

public class Shop implements Serializable{
	private int id;
	private String name;//店铺名字
	private String code;//店铺编号
	private Classes typec;//分类对象
	private int type;//分类id
	private List<Classes> myclasses;
	private String  status="off";//开业状态
	private String  phone;//电话
	private int image;//图片
	private Pictrue imagec;//图片独享
	private String arrivetime="0";//到达时间
	private String startprice="0";//起送价格
	private String boxprice="0";//餐盒费
	private String psf="0";
	private String sendtype;//配送方式
	private int appid;//appid
	private User appidc;//app对象
	private String time1;
	private String time2;
	private String time3;
	private String time4;
	private String time5;
	private String time6;
	private int sid;
	
	public String getPsf() {
		return psf;
	}
	public void setPsf(String psf) {
		this.psf = psf;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStartprice() {
		return startprice;
	}
	public void setStartprice(String startprice) {
		this.startprice = startprice;
	}
	public String getBoxprice() {
		return boxprice;
	}
	public void setBoxprice(String boxprice) {
		this.boxprice = boxprice;
	}
	public String getSendtype() {
		return sendtype;
	}
	public void setSendtype(String sendtype) {
		this.sendtype = sendtype;
	}
	public String getArrivetime() {
		return arrivetime;
	}
	public void setArrivetime(String arrivetime) {
		this.arrivetime = arrivetime;
	}
	public Classes getTypec() {
		return typec;
	}
	public void setTypec(Classes typec) {
		this.typec = typec;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getImage() {
		return image;
	}
	public void setImage(Integer image) {
		this.image = image;
	}
	public Pictrue getImagec() {
		return imagec;
	}
	public void setImagec(Pictrue imagec) {
		this.imagec = imagec;
	}
	public int getAppid() {
		return appid;
	}
	public void setAppid(Integer appid) {
		this.appid = appid;
	}
	public User getAppidc() {
		return appidc;
	}
	public void setAppidc(User appidc) {
		this.appidc = appidc;
	}
	public List<Classes> getMyclasses() {
		return myclasses;
	}
	public void setMyclasses(List<Classes> myclasses) {
		this.myclasses = myclasses;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getTime2() {
		return time2;
	}
	public void setTime2(String time2) {
		this.time2 = time2;
	}
	public String getTime3() {
		return time3;
	}
	public void setTime3(String time3) {
		this.time3 = time3;
	}
	public String getTime4() {
		return time4;
	}
	public void setTime4(String time4) {
		this.time4 = time4;
	}
	public String getTime5() {
		return time5;
	}
	public void setTime5(String time5) {
		this.time5 = time5;
	}
	public String getTime6() {
		return time6;
	}
	public void setTime6(String time6) {
		this.time6 = time6;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setImage(int image) {
		this.image = image;
	}
	public void setAppid(int appid) {
		this.appid = appid;
	}
	

}
