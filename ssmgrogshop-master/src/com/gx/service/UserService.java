package com.gx.service;

import com.gx.page.Page;
import com.gx.po.UserPo;

public interface UserService {

	public UserPo selectLogin(UserPo user);

	public boolean insertUser(UserPo user);

	public boolean selectUserName(String userName);

	// 分页需要
	public Page<UserPo> pageFuzzyselect(String name, Page<UserPo> vo);

	public UserPo selectById(int id);

	public boolean updateById(UserPo userPo);

	public void deleteById(int parseInt);

}
