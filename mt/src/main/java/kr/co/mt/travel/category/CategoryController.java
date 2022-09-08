package kr.co.mt.travel.category;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.mt.dto.MemberDTO;
import kr.co.mt.dto.RegionDTO;

@Controller
@RequestMapping(value = "/category")
public class CategoryController {
	private final static Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	private CategoryService service;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String list(HttpSession session, Model model) {
		String mno = ((MemberDTO)session.getAttribute("login_info")).getMno();
		
		List<CategoryDTO> list = null;
		list = service.cateList(mno);
		
		model.addAttribute("catelist", list);
		
		return "/travel/category/category_list";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String categoryAdd() {
		
		return "/travel/category/category_write";
	}
	
	@RequestMapping(value = "/region", method = RequestMethod.GET)
	public void region(PrintWriter out) {
		List<RegionDTO> list = null;
		list = service.regionList();
		
		out.print( new Gson().toJson(list) );
		out.close();
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void cate_insert(CategoryDTO dto, HttpSession session, PrintWriter out) throws IOException {
		String mno = ((MemberDTO)session.getAttribute("login_info")).getMno();
		dto.setMno(mno);
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		String email = ((MemberDTO)session.getAttribute("login_info")).getEmail();
		File newFolder = new File("C:/upload/category/" + email + "/");
		if (!newFolder.exists()) {
			newFolder.mkdirs();
		}
		
		
		MultipartFile cate_photo = dto.getCate_photo();
		if (cate_photo != null && !cate_photo.getOriginalFilename().equals("")) {
			InputStream is = cate_photo.getInputStream();
			FileOutputStream fos = new FileOutputStream("C:/upload/category/" + email + "/" + todayNalja + "_" + todaySigan + "_" + cate_photo.getOriginalFilename());
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			
			dto.setCate_photoname(todayNalja + "_" + todaySigan + "_" + cate_photo.getOriginalFilename());
			dto.setCate_photopath("/upload/category/" + email + "/" + todayNalja + "_" + todaySigan + "_" + cate_photo.getOriginalFilename());
		}
		
		System.out.println(dto.toString());
		
		int successCnt = 0;
		successCnt = service.cate_insert(dto);
		
		out.print(successCnt);
		out.close();
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void cateDelete(String cate_no, PrintWriter out) {
		int successCnt = 0;
		successCnt = service.cate_delete(cate_no);
		
		out.print(successCnt);
		out.close();
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String categoryUpdate(String cate_no, Model model) {
		CategoryDTO dto = new CategoryDTO();
		dto = service.cate_select(cate_no);
		model.addAttribute("category", dto);

		return "/travel/category/category_update";
	}
	
	@RequestMapping(value = "/cate_update", method = RequestMethod.POST)
	public void cate_update(CategoryDTO dto, PrintWriter out, HttpSession session) throws IOException {
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		String email = ((MemberDTO)session.getAttribute("login_info")).getEmail();
		File newFolder = new File("C:/upload/category/" + email + "/");
		if (!newFolder.exists()) {
			newFolder.mkdirs();
		}
		
		
		MultipartFile cate_photo = dto.getCate_photo();
		if (cate_photo != null && !cate_photo.getOriginalFilename().equals("")) {
			InputStream is = cate_photo.getInputStream();
			FileOutputStream fos = new FileOutputStream("C:/upload/category/" + email + "/" + todayNalja + "_" + todaySigan + "_" + cate_photo.getOriginalFilename());
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			
			dto.setCate_photoname(todayNalja + "_" + todaySigan + "_" + cate_photo.getOriginalFilename());
			dto.setCate_photopath("/upload/category/" + email + "/" + todayNalja + "_" + todaySigan + "_" + cate_photo.getOriginalFilename());
		}
		
		System.out.println(dto.toString());
		int successCnt = 0;
		successCnt = service.cate_update(dto);
		
		out.print(successCnt);
		out.close();
	}
}
