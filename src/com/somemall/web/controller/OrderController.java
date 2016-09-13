package com.somemall.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.somemall.dao.ToOrderDao;
import com.somemall.entity.DisplayOrder;
import com.somemall.entity.Item;
import com.somemall.entity.Order;
import com.somemall.entity.User;
import com.somemall.util.StateMapper;

@Controller
@RequestMapping("/user")
public class OrderController {
	public static String FORMAT_FULL = "yyyy年MM月dd日";
	SimpleDateFormat df = new SimpleDateFormat(FORMAT_FULL);
	@Resource
	private ToOrderDao toOrderDao;
	@RequestMapping("/toorder.do")
	public String toOrder(HttpSession session,Model model){
		User user = (User) session.getAttribute("user");
		Integer userid = user.getUserid();
		List<Order> orders = toOrderDao.findOrderByUserID(userid);
//		System.out.println("orders="+orders.toString());
		List<DisplayOrder> displayOrders = new ArrayList<DisplayOrder>();
		Order order = new Order();
		StateMapper stateMapper = new StateMapper();
		Iterator<Order> orderIterator=orders.iterator();
		int i=1;
		while(orderIterator.hasNext()){
			DisplayOrder displayOrder = new DisplayOrder();
			order = orderIterator.next();
			displayOrder.setOrderdate(df.format(order.getOrderdate()));
			displayOrder.setOrdershowid(order.getOrdershowid());
			displayOrder.setOrdertotalprice(order.getOrdertotalprice());
			displayOrder.setState(stateMapper.mapOrderState(order.getState()));
			displayOrder.setAddr(toOrderDao.findAddrByID(order.getAddrid()));
			List<Item> orderitems = toOrderDao.findOrderItemByOrderID(order.getOrderid());
			//System.out.println("第"+i+"次循环//"+order.getOrderid()+":"+orderitems);
			Iterator<Item> orderItemIterator = orderitems.iterator();
			String itemlist = "  ";
			while(orderItemIterator.hasNext()){
				Item item = new Item();
				item = orderItemIterator.next();
//				itemlist=itemlist+"<a href='item/toItem.do?itemid="+item.getItemid()+">"+item.getDisplaynameString()+"</a> ";
				itemlist=itemlist+"<a href='item/toItem.do?itemid="+item.getItemid()+"'>"+item.getDisplayname()+"</a> &nbsp;&nbsp;&nbsp;";    
//				<a href='item/toItem.do?itemid=    3      '>aaa</a>
			}
			displayOrder.setItemlist(itemlist);
			System.out.println("displayorder is:"+displayOrder);
			displayOrders.add(displayOrder);
			i++;
		}
		model.addAttribute("displayorders", displayOrders);
		System.out.println("displayorders is :"+displayOrders);
		return "user/order";
	}
}