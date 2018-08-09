package com.bo;

public class VehicleInfo {
	private int id;
	private int picType;//图片类型
	private int vehicleLeft;//截取的x，y和长宽
	private int vehicleTop;
	private int vehicleWidth;
	private int vehicleHeight;
	private String vehicleBrand;//品牌
	private String vehicleSubBrand;//子品牌
	private String vehicleIssueYear;//年款
	private String vehicleType;//车型
	private String freightTon;
	private String plate;//车牌
	private String plateType;//车牌类型
	private double confidence;//置信度
	private String sourcePicDeviceCode;//源图数据来源设备的编码
	private String outputPicPath;//目标图片保存位置
	private String feature;//车辆特征值
	private String sourcePicPath;//源图位置
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPicType() {
		return picType;
	}
	public void setPicType(int picType) {
		this.picType = picType;
	}
	public int getVehicleLeft() {
		return vehicleLeft;
	}
	public void setVehicleLeft(int vehicleLeft) {
		this.vehicleLeft = vehicleLeft;
	}
	public int getVehicleTop() {
		return vehicleTop;
	}
	public void setVehicleTop(int vehicleTop) {
		this.vehicleTop = vehicleTop;
	}
	public int getVehicleWidth() {
		return vehicleWidth;
	}
	public void setVehicleWidth(int vehicleWidth) {
		this.vehicleWidth = vehicleWidth;
	}
	public int getVehicleHeight() {
		return vehicleHeight;
	}
	public void setVehicleHeight(int vehicleHeight) {
		this.vehicleHeight = vehicleHeight;
	}
	public String getVehicleBrand() {
		return vehicleBrand;
	}
	public void setVehicleBrand(String vehicleBrand) {
		this.vehicleBrand = vehicleBrand;
	}
	public String getVehicleSubBrand() {
		return vehicleSubBrand;
	}
	public void setVehicleSubBrand(String vehicleSubBrand) {
		this.vehicleSubBrand = vehicleSubBrand;
	}
	public String getVehicleIssueYear() {
		return vehicleIssueYear;
	}
	public void setVehicleIssueYear(String vehicleIssueYear) {
		this.vehicleIssueYear = vehicleIssueYear;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	public String getFreightTon() {
		return freightTon;
	}
	public void setFreightTon(String freightTon) {
		this.freightTon = freightTon;
	}
	public String getPlate() {
		return plate;
	}
	public void setPlate(String plate) {
		this.plate = plate;
	}
	public String getPlateType() {
		return plateType;
	}
	public void setPlateType(String plateType) {
		this.plateType = plateType;
	}
	public double getConfidence() {
		return confidence;
	}
	public void setConfidence(double confidence) {
		this.confidence = confidence;
	}
	public String getSourcePicDeviceCode() {
		return sourcePicDeviceCode;
	}
	public void setSourcePicDeviceCode(String sourcePicDeviceCode) {
		this.sourcePicDeviceCode = sourcePicDeviceCode;
	}
	public String getOutputPicPath() {
		
		return outputPicPath;
	}
	public void setOutputPicPath(String outputPicPath) {	
		String[] z = outputPicPath.split("\\\\");
		String gString = "";
		for(int i = 2;i<z.length;i++){
			gString += z[i]+"\\";
		}
		gString = gString.substring(0,gString.length()-1);
		this.outputPicPath = gString;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getSourcePicPath() {
		return sourcePicPath;
	}
	public void setSourcePicPath(String sourcePicPath) {
		this.sourcePicPath = sourcePicPath;
	}
	
	
	
}
