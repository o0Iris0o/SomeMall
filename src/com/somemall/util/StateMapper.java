package com.somemall.util;

import org.apache.ibatis.io.ResolverUtil.IsA;
import org.springframework.stereotype.Component;

@Component
public class StateMapper {
	
	public String mapOrderState(String state){
		if ("0".equals(state)) {
			return "待确认";
		}
		else if ("1".equals(state)) {
			return "待发货";
		}
		else if ("2".equals(state)) {
			return "已发货";
		}
		else if ("3".equals(state)) {
			return "到货";
		}
		else if ("4".equals(state)) {
			return "已签收";
		}
		else if ("5".equals(state)) {
			return "退货申请中";
		}
		else if ("6".equals(state)) {
			return "退货中";
		}
		else {
			return "已退货";
		}
	}	
	
	public String mapIsDel(String isdel){
		if ("1".equals(isdel)) {
			return "已删除";
		}
		return "";
	}
	
	public String mapIsPay(String ispay){
		if ("1".equals(ispay)) {
			return "已付款";
		}
		return null;
	}
}