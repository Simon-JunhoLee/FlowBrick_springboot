package com.web.spring.dao;

import java.util.List;

import com.web.spring.vo.MemberSS;

// pms.dao.Dao
public interface Dao_Dashboard {
	List<MemberSS> memList(MemberSS sch);
}
