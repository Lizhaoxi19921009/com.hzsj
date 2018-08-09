package com.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bo.VehicleInfo;
import com.dao.VehicleInfoDao;
import com.service.VehicleInfoService;


@Service
public class VehicleInfoServiceImpl implements VehicleInfoService{

	@Autowired
	private VehicleInfoDao vehicleInfoDao;
	@Override
	public ArrayList<VehicleInfo> queryByVehicleType(String vehicleType) {
		return vehicleInfoDao.queryByVehicleType(vehicleType);
	}

	@Override
	public int deleteOneVehicleInfoById(int id) {
		return vehicleInfoDao.deleteOneVehicleInfoById(id);
	}

	@Override
	public VehicleInfo queryById(int id) {
		return vehicleInfoDao.queryById(id);
	}

	@Override
	public ArrayList<String> queryVehicleType() {
		return vehicleInfoDao.queryVehicleType();
	}

	@Override
	public List<VehicleInfo> queryVehicleBrandAndSubBrandAndIssueYear() {
		return vehicleInfoDao.queryVehicleBrandAndSubBrandAndIssueYear();
	}

	@Override
	public ArrayList<VehicleInfo> queryVehicleByIssueYearAndBrandAndSubBrand(String vehicleBrand,
			String vehicleSubBrand, String issueYear) {
		return vehicleInfoDao.queryVehicleByIssueYearAndBrandAndSubBrand(vehicleBrand, vehicleSubBrand, issueYear);
	}

	@Override
	public ArrayList<String> queryVehicleBrand() {
		return vehicleInfoDao.queryVehicleBrand();
	}

	@Override
	public ArrayList<String> queryVehicleSubBrandByBrand(String vehicleBrand) {
		return vehicleInfoDao.queryVehicleSubBrandByBrand(vehicleBrand);
	}

	@Override
	public ArrayList<String> queryVehicleIssueYearByBrandAndSubBrand(String vehicleBrand, String vehicleSubBrand) {
		return vehicleInfoDao.queryVehicleIssueYearByBrandAndSubBrand(vehicleBrand, vehicleSubBrand);
	}

}
