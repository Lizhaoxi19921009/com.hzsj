package com.dao;

import java.util.ArrayList;
import java.util.List;

import com.bo.VehicleInfo;

public interface VehicleInfoDao {
	/**
	 * 根据车辆类型查找对应车辆
	 * @param vehicleType
	 * @return
	 */
	public ArrayList<VehicleInfo> queryByVehicleType(String vehicleType);
	/**
	 * 删除一个车辆信息通过id
	 * @param vehicleInfo
	 * @return
	 */
	public int deleteOneVehicleInfoById(int id);
	
	/**
	 * 通过id查找一个车辆信息
	 */
	
	public VehicleInfo queryById(int id); 
	
	/**
	 * 查询有多少个类型
	 */
	public ArrayList<String> queryVehicleType();
	
	/**
	 * 查询有多少个品牌
	 */
	public ArrayList<String> queryVehicleBrand();
	
	/**
	 * 根据品牌 查询有几个子品牌
	 * @param vehicleBrand
	 * @return
	 */
	
	public ArrayList<String> queryVehicleSubBrandByBrand(String vehicleBrand);
	
	
	/**
	 * 根据品牌 子品牌 查询有多少个年款
	 * @param vehicleBrand
	 * @return
	 */
	public ArrayList<String> queryVehicleIssueYearByBrandAndSubBrand(String vehicleBrand,String vehicleSubBrand);
	
	/**
	 * 查询的车型数组
	 */
	public List<VehicleInfo> queryVehicleBrandAndSubBrandAndIssueYear();
	
	/**
	 * 查询具体类型下的车辆
	 * @param vehicleBrand
	 * @param vehicleSubBrand
	 * @return
	 */
	public ArrayList<VehicleInfo> queryVehicleByIssueYearAndBrandAndSubBrand(String vehicleBrand,String vehicleSubBrand,String issueYear);
	
}
