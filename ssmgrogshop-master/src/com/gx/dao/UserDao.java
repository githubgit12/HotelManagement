package com.gx.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gx.po.UserPo;;

public interface UserDao {

	public UserPo selectLogin(UserPo user);

	public Boolean insertUser(UserPo user);

	public Integer selectUserName(String userName);

	// 分页模糊查询
	public List<UserPo> pageFuzzyselect(@Param("name") String name, @Param("start") int start,
			@Param("pageSize") int pageSize);

	// 分页模糊查询总条数
	public int countFuzzyselect(String name);

	public UserPo selectById(int id);

	public Boolean updateById(UserPo userPo);

	public void deleteById(int id);

}
