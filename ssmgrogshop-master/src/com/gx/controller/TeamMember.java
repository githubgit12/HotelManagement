package com.gx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gx.page.Page;
import com.gx.po.AttributePo;
import com.gx.po.TeamMembers;
import com.gx.service.AttributeService;
import com.gx.service.TeamMemberService;

@Controller
@RequestMapping("/Team")
public class TeamMember {

	@Autowired
	private AttributeService attributeService;
	@Autowired
	private TeamMemberService teamMemberService;

	@RequestMapping("/teamMembers")
	public ModelAndView tolist(HttpServletRequest request, Integer currentPage, TeamMembers tMembers) {
		ModelAndView mv = null;
		String teamName = tMembers.getReceiveTargetPo().getTeamName();

		mv = new ModelAndView("/teamMembers/list");
		Page<TeamMembers> vo = new Page<TeamMembers>();
		if (currentPage == null) {
			currentPage = 1;
		} else if (currentPage == 0) {
			currentPage = 1;
		}

		vo.setCurrentPage(currentPage);
		vo = this.teamMemberService.pageFuzzyselect(teamName, vo);
		mv.addObject("list", vo);
		mv.addObject("txtname", teamName);
		return mv;
	}

	@RequestMapping("/toadd")
	public ModelAndView toadd(String teamName) {
		ModelAndView mv = null;
		int team_id = teamMemberService.selectByTeamName(teamName);
		List<AttributePo> listGender = attributeService.selectGender();
		List<AttributePo> listThingReason = attributeService.selectThingReason();
		mv = new ModelAndView("/teamMembers/add");
		mv.addObject("teamName", teamName);
		mv.addObject("listThingReason", listThingReason);
		mv.addObject("team_id", team_id);

		return mv;
	}

	@RequestMapping("/toupdate")
	public ModelAndView toupdate(int id) {
		ModelAndView mv = null;
		mv = new ModelAndView("/teamMembers/update");
		TeamMembers list = teamMemberService.selectById(id);

		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping("/add")
	public ModelAndView add(TeamMembers teamMembers) {
		ModelAndView mv = null;
		teamMemberService.insertAll(teamMembers);
		mv = new ModelAndView("redirect:/ReceiveTarget/tolist.do");
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView update(TeamMembers teamMembers) {
		ModelAndView mv = null;
		teamMemberService.updateById(teamMembers);
		mv = new ModelAndView("redirect:/ReceiveTarget/tolist.do");
		return mv;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(String id) {
		ModelAndView mv = null;
		String[] FenGe = id.split(",");
		for (int i = 0; i < FenGe.length; i++) {
			teamMemberService.deleteById(Integer.parseInt(FenGe[i]));
		}
		mv = new ModelAndView("redirect:/ReceiveTarget/tolist.do");
		return mv;
	}

	// @ResponseBody
	// @RequestMapping(value = "/YZ")
	// public Object YZ(String papersNumber) {
	// int YorN = passengerService.selectYZ(papersNumber);
	// Gson gson = new Gson();
	// return gson.toJson(YorN);
	// }

}
