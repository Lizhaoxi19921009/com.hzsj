package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bo.VehicleInfo;
import com.bo.VehicleTypeInfo;
import com.service.VehicleInfoService;
import com.utils.GsonUtil;

import sun.awt.ModalExclude;

@Controller
public class VehicleInfoController {
	@Autowired
	private VehicleInfoService service;
	private static List<VehicleTypeInfo> typeListNew;

	@RequestMapping("/queryById")
	public String getUserById(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		System.out.println("================queryByIdController");
		VehicleInfo info = service.queryById(1);
		modelMap.put("info", info);
		return "index";
	}
/**
 * 删除按钮要跳的controller
 * @param request
 * @param response
 */
	@RequestMapping("/deleteVehicleById")
	public void deleteVehicleById(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("================deleteVehicleByIdController");

		int id = Integer.parseInt(request.getParameter("id"));
		String path ="G:/VEHICLE/" + request.getParameter("path");

		System.out.println("删除的照片id：" + id + "    删除的照片路径：" + path);
		boolean isDelete = deleteFile(path);
		if (isDelete) {
			service.deleteOneVehicleInfoById(id);
			try {
				response.getWriter().write("success");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().write("fail");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
/**
 * 之前错误的查询车型
 * @param request
 * @param response
 * @param modelMap
 * @return
 */
	@RequestMapping("/queryByVehicleType")
	public String queryByVehicleType(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		System.out.println("================queryByVehicleTypeController");
		ArrayList<String> typeList = service.queryVehicleType();
		System.out.println(typeList + typeList.get(0));

		ArrayList<VehicleInfo> infos = service.queryByVehicleType(typeList.get(0));
		System.out.println(infos.toString() + infos.size());
		VehicleInfo info = infos.get(0);
		System.out.println(info.getVehicleType() + info.getId());
		modelMap.put("infos", infos);
		modelMap.put("type", infos.get(0).getVehicleType());
		return "vehicle_info";
	}
/**
 * 之前错误的根绝车的类型查询的cotroller
 * 
 * @param request
 * @param response
 * @param modelMap
 * @return
 */
	@RequestMapping("/test")
	public String test(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		System.out.println("================pageChangeController");
		int pageNumber = 1;
		Object page = request.getParameter("pageNumber");
		if (page != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		System.out.println("pageNumber：第几页====" + pageNumber);
		ArrayList<String> typeList = service.queryVehicleType();

		System.out.println("类型数组打印结果：" + typeList + "    当前的类型为：" + typeList.get(pageNumber - 1));

		ArrayList<VehicleInfo> infos = service.queryByVehicleType(typeList.get(pageNumber - 1));
		System.out.println("一共有" + infos.size() + "个类型");
		modelMap.put("infos", infos);
		modelMap.put("type", typeList.get(pageNumber - 1));
		modelMap.put("pageNumber", pageNumber);
		modelMap.put("totalPage", typeList.size());
		return "vehicle_info";
	}

	
	
	/**
	 * 查询有多少个品牌
	 * @param request
	 * @param response
	 * @param modelMap
	 */
	@RequestMapping("/queryVehicleBrand")
	public void queryVehicleBrand(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		response.setContentType("text/html;charset=utf-8");//放在第一行
		ArrayList<String> vehicleBrandList = service.queryVehicleBrand();
		System.out.println(vehicleBrandList);
		modelMap.put("vehicleBrandList", vehicleBrandList);
		try {
			response.getWriter().write(GsonUtil.toJson(modelMap));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询有多少个子品牌
	 * @param request
	 * @param response
	 * @param modelMap
	 */
	@RequestMapping("/queryVehicleSubBrand")
	public void queryVehicleSubBrand(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		response.setContentType("text/html;charset=utf-8");//放在第一行
		String vehicleBrand = request.getParameter("vehicleBrand");
		ArrayList<String> vehicleSubBrandList = service.queryVehicleSubBrandByBrand(vehicleBrand);
		System.out.println(vehicleSubBrandList);
		modelMap.put("vehicleSubBrandList", vehicleSubBrandList);
		try {
			response.getWriter().write(GsonUtil.toJson(modelMap));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询有多少个年款
	 * @param request
	 * @param response
	 * @param modelMap
	 */
	@RequestMapping("/queryVehicleIssueYear")
	public void queryVehicleIssueYear(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		response.setContentType("text/html;charset=utf-8");//放在第一行
		String vehicleBrand = request.getParameter("vehicleBrand");
		String vehicleSubBrand = request.getParameter("vehicleSubBrand");
		ArrayList<String> vehicleIssueYearList = service.queryVehicleIssueYearByBrandAndSubBrand(vehicleBrand, vehicleSubBrand);
		System.out.println(vehicleIssueYearList);
		modelMap.put("vehicleIssueYearList", vehicleIssueYearList);
		try {
			response.getWriter().write(GsonUtil.toJson(modelMap));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 查询特定车型页
	 * @param request
	 * @param response
	 * @param modelMap
	 */
	@RequestMapping("/queryByVehicleBrandAndVehicleSubBrandAndVehicleIssueyear")
	public void queryByVehicleBrandAndVehicleSubBrandAndVehicleIssueyear(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		response.setContentType("text/html;charset=utf-8");//放在第一行
		String vehicleBrand = request.getParameter("vehicleBrand");
		String vehicleSubBrand = request.getParameter("vehicleSubBrand");
		String vehicleIssueyear = request.getParameter("vehicleIssueyear");
		System.out.println(vehicleBrand+vehicleSubBrand+vehicleIssueyear);
		System.out.println(typeListNew.size());
		int i = 0;
		for(i = 0;i<typeListNew.size();i++){
			VehicleTypeInfo vehicleTypeInfo = typeListNew.get(i);
			boolean isTypr = vehicleTypeInfo.getVehicleBrand().equals(vehicleBrand) &&vehicleTypeInfo.getVehicleSubBrand().equals(vehicleSubBrand)
					&&vehicleTypeInfo.getVehicleIssueYear().equals(vehicleIssueyear);
			if (isTypr) {
				break;
			}
		}
		System.out.println("跳到第几页========="+i);
		modelMap.put("pageNumber", i+1);
		try {
			response.getWriter().write(GsonUtil.toJson(modelMap));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 翻页调用的controller
	 * @param request
	 * @param response
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/pageChange")
	public String pageChange(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
		
		//查询得到车型数组
		List<VehicleInfo> typeList = service.queryVehicleBrandAndSubBrandAndIssueYear();
		System.out.println("================pageChange");
	    typeListNew = new ArrayList<VehicleTypeInfo>();
		
		//这有点问题 直接按index取总出错
		for (Iterator iterator = typeList.iterator(); iterator.hasNext();) {
			VehicleInfo vehicleInfo = (VehicleInfo) iterator.next();
			VehicleTypeInfo vehicleTypeInfo = new VehicleTypeInfo();
			vehicleTypeInfo.setVehicleBrand(vehicleInfo.getVehicleBrand());
			vehicleTypeInfo.setVehicleSubBrand(vehicleInfo.getVehicleSubBrand());
			vehicleTypeInfo.setVehicleIssueYear(vehicleInfo.getVehicleIssueYear());
			typeListNew.add(vehicleTypeInfo);
			
			
		}
		
		
		System.out.println(typeListNew);
		VehicleTypeInfo info =  typeListNew.get(0);
		
		
		int pageNumber = 1;
		Object page = request.getParameter("pageNumber");
		if (page != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		System.out.println("pageNumber：第几页====" + pageNumber);
		String vehicleBrand = typeListNew.get(pageNumber-1).getVehicleBrand();
		String vehicleSubBrand = typeListNew.get(pageNumber-1).getVehicleSubBrand();
		String issueYear = typeListNew.get(pageNumber-1).getVehicleIssueYear();
		String type = "品牌："+vehicleBrand+" 子品牌："+vehicleSubBrand+" 年款："+issueYear;
		
		System.out.println("当前页车型为：   "+type);
		
        //根据品牌子品牌和年款查询对应车辆的数组
		ArrayList<VehicleInfo> infos = service.queryVehicleByIssueYearAndBrandAndSubBrand(vehicleBrand, vehicleSubBrand, issueYear);
	
		System.out.println("一共有" + infos.size() + "个此类型车辆");
		modelMap.put("infos", infos);
		modelMap.put("type", type);
		modelMap.put("pageNumber", pageNumber);
		modelMap.put("totalPage", typeListNew.size());
		return "vehicle_info";
	}

	/**
	 * 删除图片
	 * 
	 * @param fileName
	 * @return
	 */
	private static boolean deleteFile(String fileName) {
		File file = new File(fileName);
		if (file.isFile() && file.exists()) {
			Boolean succeedDelete = file.delete();
			if (succeedDelete) {
				System.out.println("删除单个文件" + fileName + "成功！");
				return true;
			} else {
				System.out.println("删除单个文件" + fileName + "失败！");
				return true;
			}
		} else {
			System.out.println("删除单个文件" + fileName + "失败！");
			return false;
		}
	}
}
