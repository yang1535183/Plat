package com.diiwon.plat.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.diiwon.plat.dao.RecordMapper;
import com.diiwon.plat.dao.TwoDecorationMapper;
import com.diiwon.plat.dao.UserMapper;
import com.diiwon.plat.model.Record;
import com.diiwon.plat.model.TwoDecoration;
import com.diiwon.plat.model.User;

/*
 * 工程上报模块
 */
@Controller
public class GCSB {
	// 合同编码默认值
	public int FJNumber = 101;
	public int SZNumber = 101;
	public int ZSNumber = 101;
	public int CCNumber = 101;

	@Resource(name = "TwoDao")
	TwoDecorationMapper twoDao;
	@Resource(name = "UserDao")
	UserMapper userDao;
	@Resource(name = "RecordDao")
	RecordMapper recordDao;

	public RecordMapper getRecordDao() {
		return recordDao;
	}

	public void setRecordDao(RecordMapper recordDao) {
		this.recordDao = recordDao;
	}

	public UserMapper getUserDao() {
		return userDao;
	}

	public void setUserDao(UserMapper userDao) {
		this.userDao = userDao;
	}

	public TwoDecorationMapper getTwoDao() {
		return twoDao;
	}

	public void setTwoDao(TwoDecorationMapper twoDao) {
		this.twoDao = twoDao;
	}

	// 根据工程id获取工程信息
	@RequestMapping(value = "GCSB.do", method = RequestMethod.GET)
	public String gcsb01(String tid, ModelMap map) {
		TwoDecoration td = null;
		if (tid != null && !tid.equals("")) {
			td = twoDao.selectByPrimaryKey(Integer.parseInt(tid));
			System.out.println(td);
			map.addAttribute("td", td);
		}
		return "GCSB";
	}

	// 接收工程上报的信息并存储（附件存储位置按当前系统时间生成文件夹集中保存）
	@RequestMapping(value = "ZSGCForm.do", method = RequestMethod.POST)
	public String zsGC01(HttpServletRequest request, MultipartFile file1, MultipartFile file2, MultipartFile file3,
			MultipartFile file4, MultipartFile file5, MultipartFile file6, MultipartFile file7, MultipartFile file8,
			MultipartFile file9, ModelMap map, HttpSession session, TwoDecoration td,String id) {
		//再次提交是否需要带上上次不通过的审查意见
//		if (id!=null && "".equals(id)) {
//			TwoDecoration agoTD=twoDao.selectByPrimaryKey(Integer.parseInt(id));
//			td.setInfo(agoTD.getInfo());
//		}
		User user = (User) session.getAttribute("user");
		td.setUid(user.getId());
		td.setState("待审核");
		td.setSupervisionlv("正常监管");
		td.setSupervisionnum(2);
		System.out.println("前端td"+td);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		if (td.getPath()==null) {
			td.setPath(sdf.format(new Date()));
		}
		// 文件上传路径
		String upPath = request.getSession().getServletContext().getRealPath(td.getPath());
		System.out.println("前端tdPath"+upPath);
		String fileName1 = file1.getOriginalFilename();
		String fileName2 = file2.getOriginalFilename();
		String fileName3 = file3.getOriginalFilename();
		String fileName4 = file4.getOriginalFilename();
		String fileName5 = file5.getOriginalFilename();
		String fileName6 = file6.getOriginalFilename();
		String fileName7 = file7.getOriginalFilename();
		String fileName8 = file8.getOriginalFilename();
		String fileName9 = file9.getOriginalFilename();
		File dir1 = new File(upPath, fileName1);
		File dir2 = new File(upPath, fileName2);
		File dir3 = new File(upPath, fileName3);
		File dir4 = new File(upPath, fileName4);
		File dir5 = new File(upPath, fileName5);
		File dir6 = new File(upPath, fileName6);
		File dir7 = new File(upPath, fileName7);
		File dir8 = new File(upPath, fileName8);
		File dir9 = new File(upPath, fileName9);
		if (!dir1.exists() || !dir2.exists() || !dir3.exists() || !dir4.exists() || !dir5.exists() || !dir6.exists()
				|| !dir7.exists() || !dir8.exists() || !dir9.exists()) {
			dir1.mkdirs();
			dir2.mkdirs();
			dir3.mkdirs();
			dir4.mkdirs();
			dir5.mkdirs();
			dir6.mkdirs();
			dir7.mkdirs();
			dir8.mkdirs();
			dir9.mkdirs();
		}
		try {
			file1.transferTo(dir1);
			file2.transferTo(dir2);
			file3.transferTo(dir3);
			file4.transferTo(dir4);
			file5.transferTo(dir5);
			file6.transferTo(dir6);
			file7.transferTo(dir7);
			file8.transferTo(dir8);
			file9.transferTo(dir9);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (td.getId() != null && !td.getId().toString().equals("")) {
			System.out.println("再次提交");
			twoDao.updateByPrimaryKey(td);
		} else {
			System.out.println("提交新工程");
			twoDao.insert(td);
		}

		List<TwoDecoration> ZSGCList = new ArrayList<TwoDecoration>();
		if (user.getIdentify() != 1) {
			ZSGCList = twoDao.getAll();
		} else {
			ZSGCList = twoDao.getByUid(user.getId());
		}

		// 插入记录
		System.out.println("工程提交插入记录");
		System.out.println(td);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Record r = new Record();
		r.setTid(td.getId());
		r.setRdate(sdf2.format(new Date()));
		r.setRaction(user.getCompany() + "提交报监资料");
		recordDao.insert(r);

		map.addAttribute("ZSGCList", ZSGCList);
		return "GCList";
	}

	// 根据登入对象返回对应的工程信息，非企业用户则再按工程状态检索
	@RequestMapping(value = "GCList.do", method = RequestMethod.GET)
	public String gCList01(HttpSession session, ModelMap map) {
		User user = (User) session.getAttribute("user");
		List<TwoDecoration> ZSGCList = new ArrayList<TwoDecoration>();
		if (user.getIdentify() == 1) {
			ZSGCList = twoDao.getByUid(user.getId());
		} else if (user.getIdentify() == 3) {
			ZSGCList = twoDao.getByType(user.getPosition());
		} else if (user.getIdentify() == 4) {
			if (user.getPosition() != null) {
				String position = user.getPosition();
				String tid[] = position.split(",");
				for (int i = 0; i < tid.length; i++) {
					System.out.println(tid[i]);
					if (tid[i] != null && !"".equals(tid[i])) {
						ZSGCList.add(twoDao.selectByPrimaryKey(Integer.parseInt(tid[i])));
					}
				}
			}
		}
		map.addAttribute("ZSGCList", ZSGCList);
		return "GCList";
	}

	// app端获取工程列表（同上）
	@RequestMapping(value = "appGCList.do", method = RequestMethod.GET)
	@ResponseBody
	public List<TwoDecoration> appGCList02(String id) {
		System.out.println(id);
		User user = userDao.selectByPrimaryKey(Integer.parseInt(id));
		List<TwoDecoration> ZSGCList = new ArrayList<TwoDecoration>();
		if (user.getIdentify() == 1) {
			ZSGCList = twoDao.getByUid(user.getId());
		} else if (user.getIdentify() == 3) {
			ZSGCList = twoDao.getByType(user.getPosition());
		} else if (user.getIdentify() == 4) {
			if (user.getPosition() != null) {
				String position = user.getPosition();
				String tid[] = position.split(",");
				for (int i = 0; i < tid.length; i++) {
					System.out.println(tid[i]);
					if (tid[i] != null && !tid[i].equals("")) {
						ZSGCList.add(twoDao.selectByPrimaryKey(Integer.parseInt(tid[i])));
					}
				}
			}
		}
		return ZSGCList;
	}

	// 获取工程详情
	@RequestMapping(value = "ZSGCDetail.do", method = RequestMethod.GET)
	public String ZSGCDetail01(String id, ModelMap map, HttpServletRequest request) {
		TwoDecoration td = twoDao.selectByPrimaryKey(Integer.parseInt(id));
		if (td.getPath() != null && !td.getPath().equals("")) {
			// 获取上传文件的目录
			String uploadFilePath = request.getSession().getServletContext().getRealPath(td.getPath());
			// 需要下载的文件名
			Map<String, String> fileNameMap = new HashMap<String, String>();
			// 递归遍历filepath下所有文件和目录，将文件的文件名存储到map集合中
			listFile(new File(uploadFilePath), fileNameMap);// file既可代表一个文件又可代表一个目录
			Set<String> set = fileNameMap.keySet();
			for (String string : set) {
				System.out.println(string + "===" + fileNameMap.get(string));
			}
			// 将Map集合发送到listfile.jsp页面进行显示
			request.setAttribute("path", td.getPath() + "\\");
			request.setAttribute("pathName", td.getPath());
			request.setAttribute("fileNameMap", fileNameMap);
		}

		System.out.println("ZSGCDetail.do" + td);
		List<Record> list2 = new ArrayList<Record>();
		list2 = recordDao.getAllByTid(td.getId());
		map.addAttribute("list2", list2);
		map.addAttribute("td", td);
		return "ZSGCDetail";
	}

	// 审查员选择领导
	@RequestMapping(value = "selOne.do", method = RequestMethod.GET)
	@ResponseBody
	public List<User> selOne01() {
		List<User> list = new ArrayList<User>();
		list = userDao.getLinDao();
		return list;
	}

	// 工程审批通过，根据用户的不同，改变工程状态
	@RequestMapping(value = "pass.do", method = RequestMethod.GET)
	public String pass01(String uid, String tid, String info, HttpSession session, ModelMap map) {
		TwoDecoration td = twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		User user = (User) session.getAttribute("user");
		User u = null;

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Record r = new Record();

		if (user.getIdentify() == 3) {
			td.setState("审核通过");
			td.setInfo(info);
			u = userDao.selectByPrimaryKey(Integer.parseInt(uid));
			if (u.getPosition() == null) {
				u.setPosition(tid);
			} else {
				u.setPosition(u.getPosition() + "," + tid);
			}

			// 插入记录
			r.setTid(td.getId());
			r.setRdate(sdf2.format(new Date()));
			r.setRaction(user.getName() + "审核通过");
			recordDao.insert(r);

			map.addAttribute("msg", td.getEngname() + "审核通过");
		} else if (user.getIdentify() == 4) {
			// 插入记录
			r.setTid(td.getId());
			r.setRdate(sdf2.format(new Date()));
			r.setRaction(user.getName() + "审批通过");
			recordDao.insert(r);

			td.setState("审批通过");
			user.setPosition(user.getPosition().replaceAll(tid, ""));
			userDao.updateByPrimaryKey(user);
			map.addAttribute("msg", td.getEngname() + "审批通过");

			// 注册码生成
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			String number = "";
			switch (td.getType()) {
			case "房建工程":
				number += sdf.format(new Date()) + FJNumber;
				FJNumber++;
				break;
			case "市政工程":
				number += "SZ" + sdf.format(new Date()) + SZNumber;
				SZNumber++;
				break;
			case "装饰工程":
				number += "ZS" + sdf.format(new Date()) + ZSNumber;
				ZSNumber++;
				break;
			case "拆除工程":
				number += "CHC" + sdf.format(new Date()) + CCNumber;
				CCNumber++;
				break;
			default:
				break;
			}
			td.setNumber(number);
		}
		System.out.println("pass" + td);
		twoDao.updateByPrimaryKey(td);
		if (u != null) {
			userDao.updateByPrimaryKey(u);
		}
		return "message";
	}

	// app审批通过（同上）
	@RequestMapping(value = "appPass.do", method = RequestMethod.GET)
	@ResponseBody
	public TwoDecoration pass02(String tid, String uid) {
		System.out.println(tid);
		System.out.println(uid);
		User user = userDao.selectByPrimaryKey(Integer.parseInt(uid));
		TwoDecoration td = twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		td.setState("审批通过");

		// 插入记录
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Record r = new Record();
		r.setTid(td.getId());
		r.setRdate(sdf2.format(new Date()));
		r.setRaction(user.getName() + "移动端审批通过");
		recordDao.insert(r);

		// 注册码生成
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String number = "";
		switch (td.getType()) {
		case "房建工程":
			number += sdf.format(new Date()) + FJNumber;
			FJNumber++;
			break;
		case "市政工程":
			number += "SZ" + sdf.format(new Date()) + SZNumber;
			SZNumber++;
			break;
		case "装饰工程":
			number += "ZS" + sdf.format(new Date()) + ZSNumber;
			ZSNumber++;
			break;
		case "拆除工程":
			number += "CHC" + sdf.format(new Date()) + CCNumber;
			CCNumber++;
			break;
		default:
			break;
		}
		td.setNumber(number);
		twoDao.updateByPrimaryKey(td);
		return td;
	}

	// 工程被打回
	@RequestMapping(value = "repulse.do", method = RequestMethod.GET)
	public String repulse01(String tid, String infoStr, String yiJianDetail, String detailInfo, ModelMap map,
			HttpSession session) {
		TwoDecoration td = twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		System.out.println("打回"+td);
		System.out.println("infoStr"+infoStr);
		System.out.println("yiJianDetail"+yiJianDetail);
		System.out.println("detailInfo"+detailInfo);
		td.setDetailinfo(detailInfo);
		User user = (User) session.getAttribute("user");
		String infoArr[] = null;
		if (infoStr!=null && !"".equals(infoStr)) {
			infoArr = infoStr.split(",");
		}
		String yiJianArr[] = null;
		if (yiJianDetail!=null && !"".equals(yiJianDetail)) {
			yiJianArr= yiJianDetail.split(",");
			System.out.println("yiJianArr.length"+yiJianArr.length);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");
		String info=null;
		if (infoArr!=null) {
			info= "审查人：" + user.getName() + ",审查时间" + sdf.format(new Date()) + "审核未通过项：";
			for (int i = 0; i < infoArr.length; i++) {
				if ("1".equals(infoArr[i])) {
					switch (i) {
					case 0:
						info += "工程名称;" + "审查员意见：" + yiJianArr[i];
						break;
					case 1:
						info += "工程地点;" + "审查员意见：" + yiJianArr[i];
						break;
					case 2:
						info += "投资类别;" + "审查员意见：" + yiJianArr[i];
						break;
					case 3:
						info += "预算造价;" + "审查员意见：" + yiJianArr[i];
						break;
					case 4:
						info += "建筑面积;" + "审查员意见：" + yiJianArr[i];
						break;
					case 5:
						info += "结构类型层次;" + "审查员意见：" + yiJianArr[i];
						break;
					case 6:
						info += "平方米造价;" + "审查员意见：" + yiJianArr[i];
						break;
					default:
						break;
					}
				}
			}
		}
		System.out.println("打回意见"+info);
		td.setInfo(info);
		td.setState("未通过");
		System.out.println("打回结果td"+td);
		twoDao.updateByPrimaryKey(td);
		
		// 插入记录
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Record r = new Record();
		r.setTid(td.getId());
		r.setRdate(sdf2.format(new Date()));
		r.setRaction(user.getName() + "审核未通过");
		recordDao.insert(r);
		
		//插入意见
		Record yJRecord=new Record();
		yJRecord.setTid(td.getId());
		yJRecord.setRdate(sdf2.format(new Date()));
		yJRecord.setRaction(info);
		recordDao.insert(yJRecord);
		map.addAttribute("msg", td.getEngname() + "未通过");
		return "message";
	}
	
	//领导打回
	@RequestMapping(value="lindaoRepulse.do",method=RequestMethod.GET)
	public String lindaoRepulse01(String tid,ModelMap map) {
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		map.addAttribute("td", td);
		return "lindaoRepulse";
	}
	
	@RequestMapping(value="lindaoRepulse.do",method=RequestMethod.POST)
	public String lindaoRepulse02(HttpSession session,String info,String tid,ModelMap map) {
		TwoDecoration td=twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		User user=(User) session.getAttribute("user");
		String tidArr=user.getPosition();
		tidArr=tidArr.replaceAll(td.getId()+"", "");
		user.setPosition(tidArr);
		userDao.updateByPrimaryKey(user);
		td.setState("未通过");
		twoDao.updateByPrimaryKey(td);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Record r=new Record();
		r.setTid(Integer.parseInt(tid));
		r.setRdate(sdf.format(new Date()));
		r.setRaction(user.getName()+"未通过"+info);
		recordDao.insert(r);
		map.addAttribute("msg", td.getEngname() + "未通过");
		return "message";
	}

	// app端工程打回
	@RequestMapping(value = "appRepulse.do", method = RequestMethod.GET)
	public TwoDecoration repulse02(String tid) {
		System.out.println(tid);
		TwoDecoration td = twoDao.selectByPrimaryKey(Integer.parseInt(tid));
		// 插入记录
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Record r = new Record();
		r.setTid(td.getId());
		r.setRdate(sdf2.format(new Date()));
		r.setRaction("移动端审核未通过");
		recordDao.insert(r);
		td.setState("未通过");
		twoDao.updateByPrimaryKey(td);
		return td;
	}

	// 被打回的工程进行再次提交
	@RequestMapping(value = "again.do", method = RequestMethod.GET)
	public String again01(HttpSession session, String tid, ModelMap map) {
		TwoDecoration td = twoDao.selectByPrimaryKey(Integer.parseInt(tid));

		User user = (User) session.getAttribute("user");

		// 插入记录
		// SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// Record r = new Record();
		// r.setTid(td.getId());
		// r.setRdate(sdf2.format(new Date()));
		// r.setRaction(user.getName() + "再次提交");
		// recordDao.insert(r);

		map.addAttribute("td", td);
		switch (td.getType()) {
		case "房建工程":
			return "one";
		case "市政工程":
			return "two";
		case "装饰工程":
			return "three";
		case "拆除工程":
			return "four";
		default:
			return "GCSB";
		}
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
