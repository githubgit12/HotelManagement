package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.TeamMembers;

public interface TeamMemberDao {

	// 分页查询
	public List<TeamMembers> pageFuzzyselect(@Param("name") String name, @Param("start") int start,
			@Param("pageSize") int pageSize);

	// 分页查询总条数
	public int countFuzzyselect(@Param("name") String name);

	public int insertAll(TeamMembers teamMembers);

	public int selectByTeamName(@Param("teamName") String teamName);

	public TeamMembers selectById(Integer id);

	public int updateById(TeamMembers teamMembers);

	public void deleteById(int parseInt);
}
