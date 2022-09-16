package kr.co.mt.travel.timeline;

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

import kr.co.mt.SearchDTO;
import kr.co.mt.dto.MemberDTO;
import kr.co.mt.dto.MoneyDTO;
import kr.co.mt.travel.category.CategoryDTO;
import kr.co.mt.travel.category.CategoryService;

@Controller
@RequestMapping(value = "/timeline")
public class TimelineController {
	private final static Logger logger = LoggerFactory.getLogger(TimelineController.class);
	
	@Autowired
	private TimelineService service;
	
	@Autowired
	private CategoryService cservice;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String timeline(String cate_no, Model model) {
		CategoryDTO dto = new CategoryDTO();
		dto = cservice.cate_select(cate_no);
		
		List<TimelineDTO> list = null;
		list = service.timeline_list(cate_no);
		
		List<TimelineDTO> mapList = null;
		mapList = service.timeline_maplist(cate_no);
		
		
		
		model.addAttribute("category", dto);
		model.addAttribute("list", list);
		model.addAttribute("mapList", new Gson().toJson(mapList));
		
		return "/travel/timeline/timeline";
	}

	@RequestMapping( value = "/list", method = RequestMethod.GET )
	public String list( Model model, SearchDTO dto ) {
		List<TimelineDTO> list = null;
		list = service.searchList( dto );
		model.addAttribute("list", list);
		model.addAttribute("search_dto", dto);
		return "/travel/timeline/search";//jsp file name
		
	}//list
	
	
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String timeline_write(String cate_no, Model model) {
		List<MoneyDTO> list = null;
		
		
		model.addAttribute("cate_no", cate_no);
		model.addAttribute("money", new Gson().toJson(list));
		
		return "/travel/timeline/timeline_write";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public void timeline_insert(TimelineDTO dto, HttpSession session, PrintWriter out) throws IOException {
		String mno = ((MemberDTO)session.getAttribute("login_info")).getMno();
		dto.setMno(mno);
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);
		
		String email = ((MemberDTO)session.getAttribute("login_info")).getEmail();
		File newFolder = new File("C:/upload/timeline/" + email + "/");
		if (!newFolder.exists()) {
			newFolder.mkdirs();
		}
		
		
		MultipartFile timeline_photo = dto.getTimeline_photo();
		if (timeline_photo != null && !timeline_photo.getOriginalFilename().equals("")) {
			InputStream is = timeline_photo.getInputStream();
			FileOutputStream fos = new FileOutputStream("C:/upload/timeline/" + email + "/" + todayNalja + "_" + todaySigan + "_" + timeline_photo.getOriginalFilename());
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			
			dto.setTimeline_photoname(todayNalja + "_" + todaySigan + "_" + timeline_photo.getOriginalFilename());
			dto.setTimeline_photopath("/upload/timeline/" + email + "/" + todayNalja + "_" + todaySigan + "_" + timeline_photo.getOriginalFilename());
		}
		
		System.out.println(dto.toString());
		
		int successCnt = 0;
		successCnt = service.timeline_insert(dto);
		
		out.print(successCnt);
		out.close();
	}
}
