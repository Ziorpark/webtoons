package com.kopo.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kopo.domain.Webtoon;
import com.kopo.domain.Webtoon2;
import com.kopo.domain.Webtoon3;
import com.kopo.service.WebtoonService;

@Controller
//@RequestMapping("/webtoons")
@RequestMapping
public class WebtoonController { //service 계층과 연동이 되어야 함
	
	@Autowired //(의존성주입)  즉, 스프링 컨테이너가 해당 어노테이션이 적용된 필드에 맞는 빈을 찾아서 자동으로 주입함.
	//이렇게 의존성 주입을 통해 webtoonService 변수는 컨트롤러나 다른 컴포넌트에서 WebtoonService 인터페이스의 메서드를 호출할 수 있게 됩니다. 
	//이를 통해 필요한 비즈니스 로직을 처리하거나 데이터를 조작하는 등의 작업을 수행할 수 있습니다.
	private WebtoonService webtoonService;
	
	//@RequestMapping(value="/webtoons", method=RequestMethod.GET)
	@GetMapping("/home")
	public String requestWebtoonList(Model model) {
		List<Webtoon> list = webtoonService.getAllwebtoonList();
		model.addAttribute("webtoonList",list);
		return "webtoons";
	}

	
	@RequestMapping
	//@GetMapping("/home")
	public String requestAllWebtoonList(Model model) {
		List<Webtoon> list = webtoonService.getAllwebtoonList();
		model.addAttribute("webtoonList",list);
		return "webtoons";
	}
	
	@GetMapping("/list")
	public String requestAllWebtoonList2(Model model) {
		List<Webtoon2> list = webtoonService.getAllwebtoonList2();
		model.addAttribute("webtoonList",list);
		return "webtoons2";
	}
	
	@GetMapping("/titleId")
	public String requestBookById(@RequestParam("id") String titleId, Model model) {
		Webtoon2 webtoonById = webtoonService.getWebtoonById(titleId);
		model.addAttribute("webtoon", webtoonById);

		return "webtoonId";
	}
	
	//총점에 따라 웹툰 리스트 출력
	@GetMapping("/search/{key}")
	public String requestWebtoonScore(@RequestParam("key") String totalScore, Model model) {
		//double t = Double.parseDouble(totalScore);
		//model.addAttribute("score", t);
		
		List<Webtoon2> list = webtoonService.getWebtoonByScore(totalScore);
		model.addAttribute("webtoonList", list);
		
		return "webtoons2";
	}
	
	//폼테크 호출
	@GetMapping("/admin/add")
	public String requestAddWebtoonForm(@ModelAttribute("NewWebtoon") Webtoon3 webtoon) {
		return "addWebtoon";
	}
	
	//입력폼 받기
	@PostMapping("/admin/add")
	public String submitAddNewWebtoon(@ModelAttribute("NewWebtoon") Webtoon3 webtoon,
													HttpServletRequest request, HttpSession session) {
		
		//데이터를 담을 그릇 생성
		Webtoon2 web = new Webtoon2();
		
		//데이터 전처리
		String name = webtoon.getName();
		String imgPath = webtoon.getImageFile().getOriginalFilename();
		String author = webtoon.getAuthor();
		String publicationDay = webtoon.getPublicationDay();
		String ageLimit = webtoon.getAgeLimit();
		String description = webtoon.getDescription();
		String website = webtoon.getWebsite();
		String genre = webtoon.getGenre();
		String url = webtoon.getUrl();
		String titleId = webtoon.getTitleId();
		
		//파일 저장하기
		try {
			
			MultipartFile imageFile = webtoon.getImageFile();
			//String filename = StringUtils.cleanPath(imageFile.getOriginalFilename());
//			String filePath = "C:\\03WorkSpaces\\WebtoonPage2\\src\\main\\webapp\\resources\\img\\naver\\" + imgPath;
//	        imageFile.transferTo(new File(filePath));
			
			Path filePath = Paths.get("C:\\03WorkSpaces\\WebtoonPage2\\src\\main\\webapp\\resources\\img\\naver\\", imageFile.getOriginalFilename());
            Files.write(filePath, imageFile.getBytes());
	         
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		double drawing = webtoon.getDrawing();
		double material = webtoon.getMaterial();
		double story = webtoon.getStory();
		double message = webtoon.getMessage();
		
		DecimalFormat df = new DecimalFormat("#.#");
		
		double ttScore = (drawing + material + story + message) / 4.0;
		String totalScore = df.format(ttScore);
		
		//데이터 입력
		web.setName(name);
		web.setImagPath(imgPath);
		web.setAuthor(author);
		web.setPublicationDay(publicationDay);
		web.setAgeLimit(ageLimit);
		web.setDescription(description);
		web.setWebsite(website);
		web.setGenre(genre);
		web.setUrl(url);
		web.setTitleId(titleId);
		
		web.setDrawing(drawing);
		web.setMaterial(material);
		web.setStory(story);
		web.setMessage(message);
		web.setTotalScore(totalScore);
		
		webtoonService.setNewWebtoon(web);
		
		return "redirect:/list";
	}
	
//	//로그인 하기
//	@GetMapping("/login")
//	public String requestLogin(Model model) {
//		return "webtoons2";
//	}
//	
//	//로그 아웃하기
//	@GetMapping("/logout")
//	public String requestLogout(Model model) {
//		return "webtoons2";
//	}
}
