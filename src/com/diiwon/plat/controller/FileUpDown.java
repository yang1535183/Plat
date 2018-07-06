package com.diiwon.plat.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.diiwon.plat.dao.TwoDecorationMapper;

/*
 * 文件上传下载
 */
@Controller
public class FileUpDown {
	
	@Resource(name = "TwoDao")
	public TwoDecorationMapper twoDao;

	public TwoDecorationMapper getTwoDao() {
		return twoDao;
	}

	public void setTwoDao(TwoDecorationMapper twoDao) {
		this.twoDao = twoDao;
	}
	
	@RequestMapping(value = "upload.do", method = RequestMethod.GET)
	public String upload01(HttpServletRequest request) {
		// 获取上传文件的目录
		String uploadFilePath = request.getSession().getServletContext().getRealPath("upload");
		// 需要下载的文件名
		Map<String, String> fileNameMap = new HashMap<String, String>();
		// 递归遍历filepath下所有文件和目录，将文件的文件名存储到map集合中
		listFile(new File(uploadFilePath), fileNameMap);// file既可代表一个文件又可代表一个目录
		Set<String> set = fileNameMap.keySet();
		for (String string : set) {
			System.out.println(string + "===" + fileNameMap.get(string));
		}
		// 将Map集合发送到listfile.jsp页面进行显示
		request.setAttribute("path", "upload" + "\\");
		request.setAttribute("fileNameMap", fileNameMap);
		return "zongHeTong";
	}

	@RequestMapping(value = "upload.do", method = RequestMethod.POST)
	public String upload02(MultipartFile file, HttpServletRequest request) {
		// 文件上传路径
		String path = request.getSession().getServletContext().getRealPath("upload");
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
		
		request.setAttribute("message", "文件已上传");
		return "redirect:upload.do";
	}

	/*@RequestMapping(value = "downFile.do", method = RequestMethod.GET)
	public String downFile01() {
		return "downFile";
	}*/

	/*@RequestMapping(value = "downFile.do", method = RequestMethod.GET)
	public String downFile01(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 模拟文件，myfile.txt为需要下载的文件
		String fileName = request.getSession().getServletContext().getRealPath("upload") + "/软件系统开发合同(标准模板).doc";
		// 获取输入流
		InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
		// 假如以中文名下载的话
		String filename = "软件系统开发合同(标准模板).doc";
		// 转码，免得文件名中文乱码
		filename = URLEncoder.encode(filename, "UTF-8");
		// 设置文件下载头
		response.addHeader("Content-Disposition", "attachment;filename=" + filename);
		// 1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
		response.setContentType("multipart/form-data");
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int len = 0;
		while ((len = bis.read()) != -1) {
			out.write(len);
			out.flush();
		}
		out.close();
		request.setAttribute("message", "文件已下载");
		return "message";
	}*/

	@RequestMapping(value = "listFile.do", method = RequestMethod.GET)
	public String listFile01(HttpServletRequest request) {
		// 获取上传文件的目录
		String uploadFilePath = request.getSession().getServletContext().getRealPath("upload");
		// 需要下载的文件名
		Map<String, String> fileNameMap = new HashMap<String, String>();
		// 递归遍历filepath下所有文件和目录，将文件的文件名存储到map集合中
		listFile(new File(uploadFilePath), fileNameMap);// file既可代表一个文件又可代表一个目录
		Set<String> set = fileNameMap.keySet();
		for (String string : set) {
			System.out.println(string + "===" + fileNameMap.get(string));
		}
		// 将Map集合发送到listfile.jsp页面进行显示
		request.setAttribute("path", "upload" + "\\");
		request.setAttribute("fileNameMap", fileNameMap);
		return "listFile";
	}

	@RequestMapping(value = "downFiles.do", method = RequestMethod.GET)
	public String downFiles01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 得到要下载的文件名
		String fileName = request.getParameter("filename");
		String path = request.getParameter("path");
		fileName = new String(fileName.getBytes(), "UTF-8");
		// 上传的文件都是保存在upload目录下的子目录当中
		String fileSaveRootPath = request.getSession().getServletContext().getRealPath(path);
		// 得到要下载的文件
		File file = new File(fileSaveRootPath + "\\" + fileName);
		// 如果文件不存在
		if (!file.exists()) {
			request.setAttribute("message", "您要下载的资源已被删除！！");
			return "message";
		}
		// 处理文件名
		String realname = fileName.substring(fileName.indexOf("_") + 1);
		// 设置响应头，控制浏览器下载该文件
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
		// 读取要下载的文件，保存到文件输入流
		FileInputStream in = new FileInputStream(fileSaveRootPath + "\\" + fileName);
		// 创建输出流
		OutputStream out = response.getOutputStream();
		// 创建缓冲区
		byte buffer[] = new byte[1024];
		int len = 0;
		// 循环将输入流中的内容读取到缓冲区当中
		while ((len = in.read(buffer)) > 0) {
			// 输出缓冲区的内容到浏览器，实现文件下载
			out.write(buffer, 0, len);
		}
		// 关闭文件输入流
		in.close();
		// 关闭输出流
		out.close();
		request.setAttribute("message", "已下载");
		return "message";
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
