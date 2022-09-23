package kr.co.mt.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( value = "/test")
public class TestController {

	private final static Logger logger = LoggerFactory.getLogger(TestController.class);

	private final static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36";

	@Autowired
	private TestService service;
	
	@RequestMapping (value = "/api", method = RequestMethod.GET)
	public String api( Model model) throws IOException {
		String url = "http://api.kcisa.kr/openapi/service/rest/meta/KTOtour?serviceKey=c5b3e281-5165-47b4-b103-e253faa437c6&numOfRows=1487&pageNo=1";
		Connection con = Jsoup.connect(url).header("Content-Type", "application/*+xml;charset=UTF-8").userAgent(USER_AGENT)
                .method(Connection.Method.GET)
                .ignoreContentType(true);
		
		Document doc = con.get();
		Elements titleList = doc.select("item");
		List<KoreaDTO> list = new ArrayList<KoreaDTO>();
		
		
		for (Element title : titleList) {

			System.out.println("===== start =====");
			System.out.println(title.select("title"));
			System.out.println(title.select("spatial"));
			System.out.println(title.select("description"));
			System.out.println("===== end =====");
			
			String titleStr = String.valueOf(title.select("title"));
			String spatialStr = String.valueOf(title.select("spatial"));
			String descStr = String.valueOf(title.select("description"));
			
			titleStr = titleStr.substring(7);
			spatialStr = spatialStr.substring(9);
			descStr = descStr.substring(13);
			
			titleStr = titleStr.substring(0, titleStr.length() - 8);
			spatialStr = spatialStr.substring(0, spatialStr.length() - 10);
			descStr = descStr.substring(0, descStr.length() - 14);
			
			titleStr = titleStr.trim();
			spatialStr = spatialStr.trim();
			descStr = descStr.trim();
			
			KoreaDTO tmp = new KoreaDTO();
			tmp.setTour_title(titleStr);
			tmp.setTour_loc(spatialStr);
			tmp.setTour_desc(descStr);
			list.add(tmp);
		}//for
		
		int successCnt = 0;
		successCnt = service.insert(list);
		
		model.addAttribute("list", list);
		return "test/api"; //jsp 파일이름
	}//api
	

} //class
