package com.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.TeamMemberDao;
import com.gx.page.Page;
import com.gx.po.TeamMembers;
import com.gx.service.TeamMemberService;

@Transactional
@Service(value = "TeamMemberService")
public class TeamMemberImpl implements TeamMemberService {

	@Autowired
	private TeamMemberDao teamMemberDao;

	@Override
	public Page<TeamMembers> pageFuzzyselect(String name, Page<TeamMembers> vo) {
		int start = 0;
		if (vo.getCurrentPage() > 1) {
			start = (vo.getCurrentPage() - 1) * vo.getPageSize();
		}
		List<TeamMembers> list = teamMemberDao.pageFuzzyselect(name, start, vo.getPageSize());
		vo.setResult(list);
		int count = teamMemberDao.countFuzzyselect(name);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public int insertAll(TeamMembers teamMembers) {
		return teamMemberDao.insertAll(teamMembers);

	}

	@Override
	public int selectByTeamName(String teamName) {
		int team_id = teamMemberDao.selectByTeamName(teamName);
		return team_id;
	}

	@Override
	public TeamMembers selectById(int id) {
		// TODO Auto-generated method stub
		return teamMemberDao.selectById(id);
	}

	@Override
	public int updateById(TeamMembers teamMembers) {
		// TODO Auto-generated method stub
		return teamMemberDao.updateById(teamMembers);
	}

	@Override
	public void deleteById(int parseInt) {
		teamMemberDao.deleteById(parseInt);

	}
}
