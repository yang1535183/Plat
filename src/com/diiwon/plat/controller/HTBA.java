package com.diiwon.plat.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.diiwon.plat.dao.TwoDecorationMapper;
import com.diiwon.plat.model.TwoDecoration;
import com.diiwon.plat.model.User;
/*
 * 合同备案
 */
@Controller
public class HTBA {
	@Resource(name = "TwoDao")
	public TwoDecorationMapper twoDao;

	public TwoDecorationMapper getTwoDao() {
		return twoDao;
	}

	public void setTwoDao(TwoDecorationMapper twoDao) {
		this.twoDao = twoDao;
	}
	
	//根据合同类型及状态返回工程列表
	@RequestMapping(value = "GCListByTypeAndState.do", method = RequestMethod.GET)
	public String GCList01(HttpSession session,ModelMap map, String type, String state) {
		User user=(User) session.getAttribute("user");
		List<TwoDecoration> list = new ArrayList<TwoDecoration>();
		if (user.getIdentify()==1) {
			list=twoDao.getByUidAndTypeAndState(user.getId(), type, state);
		}else {
			list = twoDao.getByTypeAndState(type, state);
		}
		map.addAttribute("list", list);
		map.addAttribute("type", type);
		return "hTSB";
	}
	
	//合同上报
	@RequestMapping(value = "ZHTSC.do", method = RequestMethod.GET)
	public String zHTSC01(String tid,String type,ModelMap map,HttpServletRequest request) {
		TwoDecoration td = twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		String htPath = td.getHtpath();
		if (htPath != null && !htPath.equals("")) {
			// 获取上传文件的目录
			String uploadFilePath = request.getSession().getServletContext().getRealPath(htPath);
			// 需要下载的文件名
			Map<String, String> fileNameMap = new HashMap<String, String>();
			// 递归遍历filepath下所有文件和目录，将文件的文件名存储到map集合中
			listFile(new File(uploadFilePath), fileNameMap);// file既可代表一个文件又可代表一个目录
			Set<String> set = fileNameMap.keySet();
			for (String string : set) {
				System.out.println(string + "===" + fileNameMap.get(string));
			}
			// 将Map集合发送到listfile.jsp页面进行显示
			request.setAttribute("path", htPath + "\\");
			request.setAttribute("pathName", htPath);
			request.setAttribute("fileNameMap", fileNameMap);
		} else {
			td.setHtpath(td.getId().toString());
			twoDao.updateByPrimaryKey(td);
		}
		request.setAttribute("tid", tid);
		map.addAttribute("type", type);
		map.addAttribute("td", td);
		return "zongHeTong";
	}
	
	//合同上传
	@RequestMapping(value = "ZHTSC.do", method = RequestMethod.POST)
	public String zHTSC02(MultipartFile file, String tid,String type,ModelMap map,HttpServletRequest request) {
		TwoDecoration td = twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		String htPath = td.getHtpath();

		// 文件上传路径
		String path = request.getSession().getServletContext().getRealPath(htPath);
		String fileName = file.getOriginalFilename();
		System.out.println(path);
		System.out.println(fileName);
		File dir = new File(path, fileName);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		try {
			file.transferTo(dir);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 获取上传文件的目录
		String uploadFilePath = request.getSession().getServletContext().getRealPath(htPath);
		// 需要下载的文件名
		Map<String, String> fileNameMap = new HashMap<String, String>();
		// 递归遍历filepath下所有文件和目录，将文件的文件名存储到map集合中
		listFile(new File(uploadFilePath), fileNameMap);// file既可代表一个文件又可代表一个目录
		Set<String> set = fileNameMap.keySet();
		for (String string : set) {
			System.out.println(string + "===" + fileNameMap.get(string));
		}
		// 将Map集合发送到listfile.jsp页面进行显示
		request.setAttribute("path", htPath + "\\");
		request.setAttribute("fileNameMap", fileNameMap);
		request.setAttribute("pathName", htPath);
		request.setAttribute("tid", tid);
		map.addAttribute("type", type);
		return "zongHeTong";
	}
	
	//合同审批
	@RequestMapping(value="HTTJ.do",method=RequestMethod.GET)
	public String hTTJ01(String tid,String type,HttpSession session,ModelMap map) {
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		User user=(User) session.getAttribute("user");
		List<TwoDecoration> list = new ArrayList<TwoDecoration>();
		if (user.getIdentify()==1) {
			td.setHtstate("待审核");
		}else if (user.getIdentify()==2) {
			td.setHtstate("初审通过");
		}else if (user.getIdentify()==3) {
			td.setHtstate("审核通过");
		}else if (user.getIdentify()==4) {
			td.setHtstate("审批通过");
		}
		System.out.println("HTTJ.do:"+td);
		twoDao.updateByPrimaryKey(td);
		list = twoDao.getByTypeAndState(type,"审批通过");
		map.addAttribute("list", list);
		map.addAttribute("type", type);
		return "hTSB";
	}
	
	//合同打回
	@RequestMapping(value="repulseHT.do",method=RequestMethod.GET)
	public String repulse01(String tid,String type,HttpSession session,ModelMap map) {
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		map.addAttribute("td",td);
		map.addAttribute("type", type);
		return "repulseTwo";
	}
	//合同打回
	@RequestMapping(value="repulseHT.do",method=RequestMethod.POST)
	public String repulse02(String tid,String detailinfo,String type,HttpSession session,ModelMap map) {
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		td.setHtstate("未通过");
		td.setDetailinfo(detailinfo);
		twoDao.updateByPrimaryKey(td);
		List<TwoDecoration> list = new ArrayList<TwoDecoration>();
		list = twoDao.getByTypeAndState(type, "审批通过");
		map.addAttribute("list", list);
		map.addAttribute("type", type);
		return "hTSB";
	}

	/**
	 * 递归遍历指定目录下的所有文件
	 * 
	 * @param file
	 * @param map
	 */
	public void listFile(File file, Map<String, String> map) {

		if (file == null)
			return;
		// 如果file代表的不是一个文件，而是一个目录
		if (!file.isFile()) {
			// 列出该目录下的所有文件和目录
			File files[] = file.listFiles();
			if (files == null)
				return;
			// 遍历files[]数组
			for (File f : files) {
				// 递归
				listFile(f, map);
			}
		} else {
			String realName = file.getName().substring(file.getName().indexOf("_") + 1);
			// file.getName()得到的是文件的原始名称，这个名称是唯一的，因此可以作为key，realName是处理过后的名称，有可能会重复
			map.put(file.getName(), realName);
		}
	}
}
