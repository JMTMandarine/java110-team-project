package indiesker.java110.ms.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import indiesker.java110.ms.domain.Busker;
import indiesker.java110.ms.service.TotalFeedService;

@Controller
@RequestMapping("/totalfeed")
public class TotalFeedController {

	TotalFeedService totalFeedService;
	ServletContext sc;

	public TotalFeedController(TotalFeedService totalFeedService, ServletContext sc) {
		this.totalFeedService = totalFeedService;
		this.sc = sc;
	}

	// 전체피드
	@GetMapping("nonmembers")
	public void nonmembers(Model model,
			@RequestParam(value="searchType", required=false) String searchType,
			@RequestParam(value="keyword", required=false)String keyword,
			@RequestParam(value="sortType", required=false, defaultValue="lcnt") String sortType){
		if (searchType != null && !"".equals(searchType)) { // searchType이 null이 아니고 빈 문자열이 아닐 때는 search
			Map<String, Object> params = new HashMap<>();
			
			if (keyword == null) {
				keyword = "";
			}
			
			params.put("keyword", "%" + keyword + "%");
			params.put("sortType", sortType);
			
			if ("city".equals(searchType)) {
				List<Busker> list = totalFeedService.SearchByCity(params);
				model.addAttribute("city",list);	
			} else if ("teamname".equals(searchType)) {
				List<Busker> list = totalFeedService.SearchByTeamname(params);
				model.addAttribute("teamname", list);
			} else if ("genre".equals(searchType)) {
				List<Busker> list = totalFeedService.SearchByGenre(params);
				model.addAttribute("teamgenre", list);
			} else {
				List<Busker> totalFeed = totalFeedService.findTotalFeed(sortType);
				model.addAttribute("totalFeed", totalFeed);
			}
		} else {
			List<Busker> totalFeed = totalFeedService.findTotalFeed(sortType);
			model.addAttribute("totalFeed", totalFeed);
		}
	}

	/*
	 * //전체피드
	 * 
	 * @GetMapping("nonmembers") public void nonmembersUptodate(Model model){
	 * 
	 * List<Busker> totalFeed = totalFeedService.findTotalFeed();
	 * model.addAttribute("totalFeed", totalFeed); }
	 */
	// 도시로 검색
	
//	@GetMapping(value = "nonmembers", params = "city", produces = "text/plain;charset=UTF-8")
//	public void city(String city, Model model) {
//		List<Busker> list = totalFeedService.SearchByCity(city);
//		model.addAttribute("city", list);
//	}

	// 팀명으로 검색
//	@GetMapping(value = "nonmembers", params = "teamname", produces = "text/plain;charset=UTF-8")
//	public void teamname(String teamname, Model model) {
//		List<Busker> list = totalFeedService.SearchByTeamname(teamname);
//		model.addAttribute("teamname", list);
//	}

	// 장르으로 검색
//	@GetMapping(value = "nonmembers", params = "genre", produces = "text/plain;charset=UTF-8")
//	public void genre(String teamgenre, Model model) {
//		List<Busker> list = totalFeedService.SearchByGenre(teamgenre);
//		model.addAttribute("teamname", list);
//	}

	/*
	 * @PostMapping(value="nonmembers", params="city") public String city(String
	 * city) throws Exception { String cities[] = city.split(","); if(cities.length
	 * > 1) city = URLEncoder.encode(cities[1], "UTF-8"); else city =
	 * URLEncoder.encode(cities[0], "UTF-8"); return
	 * "redirect:nonmembers?city="+city; }
	 */
}