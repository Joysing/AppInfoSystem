package cn.appsys.android.backend;

import cn.appsys.pojo.BackendUser;
import cn.appsys.service.backend.BackendUserService;
import cn.appsys.service.developer.AppCategoryService;
import cn.appsys.service.developer.AppInfoService;
import cn.appsys.service.developer.AppVersionService;
import cn.appsys.service.developer.DataDictionaryService;
import cn.appsys.tool.Constants;
import cn.appsys.tool.EmptyUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/android/user")
public class AndroidBackendLoginController {
	@Resource
	private BackendUserService backendUserService;

	@RequestMapping(value = "doLogin")
	@ResponseBody
	public BackendUser doLogin(@RequestParam(value = "userCode") String userCode,
			@RequestParam(value = "userPassword",required=false) String userPassword, HttpSession session) {
		BackendUser backendUser = backendUserService.findUser(userCode);
		if (EmptyUtils.isEmpty(backendUser)) {
			return null;
		} else {
			if (userPassword.equals(backendUser.getUserPassword())) {
				session.setAttribute(Constants.USER_SESSION, backendUser);
			} else {
				return null;
			}
		}
		return backendUser;
	}

	@RequestMapping(value = "doLogout")
	public String doLogout(HttpSession session) {
		session.removeAttribute(Constants.USER_SESSION);
		return "index";
	}

	
}
