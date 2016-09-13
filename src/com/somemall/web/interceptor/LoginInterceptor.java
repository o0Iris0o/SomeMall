package com.somemall.web.interceptor;

/**
 * preHandle（...）方法会返回布尔值，可以使用该方法终止或继续执行的处理链。 当返回true时，处理链继续执行。
 * 否则的话，DispatcherServlet会假设拦截器已经处理了请求（如渲染适当的视图），不再执行其它拦截器和当前的处理器。
 * */

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.somemall.entity.User;

public class LoginInterceptor implements HandlerInterceptor {
	private List<String> excludedUrls;

	public void setExcludedUrls(List<String> excludedUrls) {
		this.excludedUrls = excludedUrls;
	}

	// preHandle（...）在处理器调用之前被调用；
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse arg1, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("------Login Interceptor------" + System.nanoTime());
		String requestUri = request.getRequestURI();
//		System.out.println(requestUri);
		for (String url : excludedUrls) {
			if (requestUri.contains(url)) {
				return true;
			}
		}
//		System.out.println(excludedUrls);
		if (request.getSession().getAttribute("user") == null||request.getSession().getAttribute("user") == "") {
			System.out.println("need login");
			throw new AuthorizationException();
//			return false;
		} else {
			return true;
		}

	}

	// afterCompletion（...）在请求结束之后调用
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	// postHandle（...）在处理器调用之后执行
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj, ModelAndView modelAndView)
			throws Exception {

	}

}
