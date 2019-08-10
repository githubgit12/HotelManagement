package com.gx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gx.dao.UserDao;
import com.gx.page.Page;
import com.gx.po.UserPo;
import com.gx.service.UserService;

@Transactional
@Service(value = "userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public UserPo selectLogin(UserPo user) {
		// TODO Auto-generated method stub
		return userDao.selectLogin(user);
	}

	@Override
	public boolean insertUser(UserPo user) {
		Boolean flag = userDao.insertUser(user);
		return flag;
	}

	@Override
	public boolean selectUserName(String userName) {
		if (userDao.selectUserName(userName) == null) {
			return false;
		} else {
			int rs = userDao.selectUserName(userName);
			return rs > 0;
		}
	}

	@Override
	public Page<UserPo> pageFuzzyselect(String name, Page<UserPo> vo) {
		int start = 0;
		if (vo.getCurrentPage() > 1) {
			start = (vo.getCurrentPage() - 1) * vo.getPageSize();
		}
		List<UserPo> list = userDao.pageFuzzyselect(name, start, vo.getPageSize());
		vo.setResult(list);
		int count = userDao.countFuzzyselect(name);
		vo.setTotal(count);
		return vo;
	}

	@Override
	public UserPo selectById(int id) {
		UserPo userPo = userDao.selectById(id);
		return userPo;
	}

	@Override
	public boolean updateById(UserPo userPo) {
		Boolean flag = userDao.updateById(userPo);
		return flag;
	}

	@Override
	public void deleteById(int parseInt) {
		userDao.deleteById(parseInt);
	}

}
