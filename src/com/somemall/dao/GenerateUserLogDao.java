package com.somemall.dao;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;

import com.somemall.entity.UserOperateLog;

@SomeMallRepository
public interface GenerateUserLogDao {
	public List<UserOperateLog> mineFromOrder();
}