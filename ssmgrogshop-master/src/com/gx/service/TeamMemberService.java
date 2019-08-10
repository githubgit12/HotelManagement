package com.gx.service;

import com.gx.page.Page;
import com.gx.po.TeamMembers;

public interface TeamMemberService {
	// 分页需要
	public Page<TeamMembers> pageFuzzyselect(String name, Page<TeamMembers> vo);

	public int insertAll(TeamMembers teamMembers);

	public int selectByTeamName(String teamName);

	public TeamMembers selectById(int id);

	public int updateById(TeamMembers teamMembers);

	public void deleteById(int parseInt);

}
