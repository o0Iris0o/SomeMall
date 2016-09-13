package com.somemall.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.somemall.dao.CartDao;
import com.somemall.dao.ItemDao;
import com.somemall.dao.OrderDao;
import com.somemall.entity.CartItem;
import com.somemall.entity.Item;
import com.somemall.entity.User;
import com.somemall.util.TimeUtil;

@Controller
@RequestMapping("/user")
public class CartController {
	
	@Resource
	private CartDao cartDao;
	@Resource
	private ItemDao itemDao;
	@Resource
	private OrderDao orderDao;
	@Resource
	private TimeUtil timeUtil;

	@RequestMapping("/tocart")
	public String toCart(HttpSession session,Model model){
		
		User user = (User) session.getAttribute("user");
		Integer userid = user.getUserid();
		List<CartItem> cartItems = cartDao.findCartItemByUserID(userid);
		model.addAttribute("cartItems",cartItems);
		return "user/cart";
	}
	
	@RequestMapping("/addItemToCart.do")
	@ResponseBody
	public void addToCart(Integer userid,Integer itemid){
		System.out.println("userid 和 itemid:"+userid+":"+itemid);
		int count = cartDao.findCartExist(userid, itemid);
		if (count==1) {
			cartDao.updateCartItemAmount(userid,itemid);
		}else {
			cartDao.addToCart(itemid, userid);
		}
	}
	@RequestMapping("/delectCartItem.do")
	public void delectCartItem(Integer userid,Integer itemid) {
		System.out.println("delectItem:"+itemid);
		cartDao.deleCartItem(userid, itemid);
	}
	@RequestMapping("/changCartItemAmount.do")
	public void changCartItemAmount(Integer userid,Integer itemid,int itemamount) {
//		System.out.println("changCartItemAmount:"+itemid+":"+itemamount);
		cartDao.changCartItemAmount(userid, itemid,itemamount);
	}
	@RequestMapping("/delectCartItems.do")
	@ResponseBody
	public String deleteCartItems(Integer userid,String itemids) {
		System.out.println("delectCartItems:"+itemids);
		String[] itemid =itemids.split(",");
		for (int i = 0; i < itemid.length; i++) {
			cartDao.deleCartItem(userid, Integer.parseInt(itemid[i]));
		}
		return "1";
	}
	
	@RequestMapping("/orderCartItems.do")
	public String orderCartItems(Integer userid,String itemids) {
		double totalprice=0;
		System.out.println("orderCartItems:"+itemids);
		String[] itemidargs =itemids.split(",");
		orderDao.createOrder(timeUtil.getUnixTimestamp(), userid, totalprice, orderDao.findDefaultAddrIDByUserID(userid),timeUtil.getDateStringFotOrder());
		System.out.println("cccoooodddrrrrrrr");
		int oi=orderDao.findNewestID();
		for (int i=0;i<itemidargs.length;i++) {
			String id=itemidargs[i];
			CartItem cartItem = cartDao.findCartItemByItemID(userid, Integer.parseInt(id));
			Item item = new Item();
			item = itemDao.findItemByItemid(cartItem.getItemid());
			
			totalprice=totalprice+item.getPrice()*cartItem.getAmount();
			System.out.println("ttp"+totalprice);

			orderDao.insertOrderItem(Integer.parseInt(id), item.getItemname(), item.getDisplayname(), item.getPrice(), cartItem.getAmount(), item.getPrice()*cartItem.getAmount(),oi,userid);
			cartDao.deleCartItem(userid, cartItem.getItemid());
		}
		orderDao.updateTotalprice(totalprice, oi);
		System.out.println("ttp"+totalprice);
		
		
		return "user/redirect";
	}
}