package com.somemall.web.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.somemall.dao.FindHotestDao;
import com.somemall.dao.GenerateUserLogDao;
import com.somemall.dao.ItemDao;
import com.somemall.dao.UserDao;
import com.somemall.dao.ToOrderDao;
import com.somemall.entity.Item;
import com.somemall.entity.User;
import com.somemall.entity.UserOperateLog;
import com.somemall.service.recommender.ItemCFRecommender;
import com.somemall.service.recommender.MySlopeOneRecommender;
import com.somemall.service.recommender.UserCFRecommender;
import com.somemall.util.CreateOperateLogFile;

@Controller
@RequestMapping("/home")
@SessionAttributes("addr")
public class HomeController {
	@Resource
	private FindHotestDao findHotestDao;
	@Resource
	private UserDao userDao;
	@Resource
	private ToOrderDao userFunctionDao;
	@Resource
	private ItemDao itemDao;
	@Resource
	private GenerateUserLogDao generateUserLogDao;
	
	
	@RequestMapping("/findmostsold.do")
	@ResponseBody
	public List<Item> findMostSold(){
		List<Item> list = findHotestDao.findMostSold();
		return list;
	}
	
	@RequestMapping("/findhotcollect.do")
	@ResponseBody
	public List<Item> findhotcollect(){
		List<Item> list = findHotestDao.findhotcollect();
		return list;
	}
	
	@RequestMapping("/findhotcomment.do")
	@ResponseBody
	public List<Item> findhotcomment(){
		List<Item> list = findHotestDao.findnewitem();/////////
		return list;
	}
	
	@RequestMapping("/findnewitem.do")
	@ResponseBody
	public List<Item> findnewitem(){
		List<Item> list = findHotestDao.findnewitem();
		return list;
	}
	
	@RequestMapping("/login.do")
	@ResponseBody
	public Map<String, Object> login(String username, String password,
			HttpSession session)
			throws IOException {

		User user = userDao.findByUsernameAndPassword(username, password);
		Map<String, Object> map = new HashMap<String, Object>();
		if (user == null) {
			map.put("logininfo", 0);// 用户名或密码错误
		} else {
			map.put("logininfo", 1);
			session.setAttribute("user", user);
		}
		System.out.println(user);
		System.out.println(map);

		return map;
		
		// (HttpServletResponse response)
		// PrintWriter pw = response.getWriter();
		// pw.print("{ 'info': '1', 'logininfo': '0' }");
		// pw.print(map.get("logininfo"));pw.flush();pw.close();
	}
	
	
	
	@RequestMapping("/regist.do")
	@ResponseBody
	public String regist(String username,String password,String email,
			HttpSession session) {
		System.out.println(username);
		User user  = userDao.findUserByUsername(username);
		if (user!=null) {
			return "0";
		}else{
			userDao.addUser(username, password,email);
			
			user = userDao.findByUsernameAndPassword(username, password);
			userDao.addUserInitAddr(user.getUserid(),user.getUsername(),user.getPhone());
			System.out.println(user);
			session.setAttribute("user", user);
			return "1";
		}
		
		
	}
	
	@RequestMapping("/toLogin.do")
	public String toLogin() {
		return  "/basic/login";
	}
	
	@RequestMapping("/toRegist.do")
	public String toRegist() {
		return  "/basic/regist";
	}
	
	@RequestMapping("/toMallHome.do")
	public String findHotest(HttpSession session,Model model){
		List<Item> list = findHotestDao.findHotest();
		if(session.getAttribute("user")!=null&&session.getAttribute("user")!=""){
//			String furl = "C:\\Users\\dust\\Desktop\\test2.txt";
//			File f = new File(furl);
//			new CreateOperateLogFile(f);
//			List<UserOperateLog> cartlogs = generateUserLogDao.mineFromOrder();
//			Iterator<UserOperateLog> cartlogit = cartlogs.iterator();
//			FileOutputStream fos = null;
//			try {
//				fos = new FileOutputStream(f);
//			} catch (FileNotFoundException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
//			while(cartlogit.hasNext()){
//				UserOperateLog log = cartlogit.next();
//				String uid = log.getUserid();
//				String iid = log.getItemid();
//				String str = uid+","+iid+","+"3.75"+"\r\n";
//				byte bt[] = new byte[1024];  
//		        bt = str.getBytes();
//				try {
//					fos.write(bt, 0, bt.length);
//					fos.flush();
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//			try {
//				fos.close();
//			} catch (IOException e1) {
//				// TODO Auto-generated catch block
//				e1.printStackTrace();
//			}
			
			User user = (User) session.getAttribute("user");
			String addr = userFunctionDao.findAddrByUserid(user.getUserid());
			model.addAttribute("addr", addr);
			int userid = user.getUserid();
			int num=3;
			Map UserCFMap=new HashMap();
			Map ItemCFMap=new HashMap();
			Map SlopeOneMap=new HashMap();
			UserCFRecommender usercf=new UserCFRecommender();
			ItemCFRecommender itemcf=new ItemCFRecommender();
			MySlopeOneRecommender slopeone=new MySlopeOneRecommender();
			try {
				UserCFMap=usercf.getUserCF(userid, num);
				ItemCFMap=slopeone.getSlopeOneCF(userid, num);
				SlopeOneMap=itemcf.getItemCF(userid, num);
				
				Set<String> UserCFMapSet = UserCFMap.keySet();
				Iterator usercfkeyit = UserCFMapSet.iterator();
				Set<String> ItemCFMapSet = ItemCFMap.keySet();
				Iterator itemcfkeyit = ItemCFMapSet.iterator();
				Set<String> SlopeOneMapSet = SlopeOneMap.keySet();
				Iterator slopeonekeyit = SlopeOneMapSet.iterator();
				
				Map map = new HashMap();
				
				while(usercfkeyit.hasNext()){
					String key = usercfkeyit.next().toString();
					map.put(key,UserCFMap.get(key));
				}
				
				while(itemcfkeyit.hasNext()){
					String key = itemcfkeyit.next().toString();
					map.put(key,ItemCFMap.get(key));
				}
				
				while(slopeonekeyit.hasNext()){
					String key = slopeonekeyit.next().toString();
					map.put(key,SlopeOneMap.get(key));
				}
				System.out.println("推荐给此用户的Itemid----评分map");
				System.out.println(map);
				Set<String> recset = map.keySet();
				Iterator<String> recsetit = recset.iterator();
				List<Item> recItems = new ArrayList<Item>();
				while(recsetit.hasNext()){
					Item recItem = itemDao.findItemByItemid(Integer.parseInt(recsetit.next()));
					recItems.add(recItem);
				}
				model.addAttribute("recs", recItems);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		model.addAttribute("hotestlist", list);
		
		return "home/home";
	}
	
	@RequestMapping("/toLogout.do")
	public String  toLogout(HttpSession session,Model model) {
		session.setAttribute("user", null);
		String string = findHotest(session, model);
		return string;
	}
	
	
	@RequestMapping("/toForget.do")
	public String toForget() {
		return "/basic/forget";
	}
}