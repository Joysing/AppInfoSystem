package cn.appsys.interceptor;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.appsys.pojo.BackendUser;
import cn.appsys.pojo.DevUser;
import cn.appsys.tool.Constants;
import cn.appsys.tool.EmptyUtils;

/**
 * 系统拦截器
 * 
 * @Author Joysing
 *
 */
public class SysInterceptor extends HandlerInterceptorAdapter {
	public boolean preHandle(javax.servlet.http.HttpServletRequest request,
			javax.servlet.http.HttpServletResponse response, Object handler) throws Exception {
		HttpSession session=request.getSession();
		
		BackendUser backendUser=(BackendUser) session.getAttribute(Constants.USER_SESSION);
		DevUser devUser=(DevUser) session.getAttribute(Constants.DEV_USER_SESSION);
		
		if (EmptyUtils.isNotEmpty(devUser)) {
			return true;
		}
		if (EmptyUtils.isNotEmpty(backendUser)) {
			return true;
		}
		response.sendRedirect(request.getContextPath()+"/403.jsp");
		return false;
	}
}
