package cn.appsys.controller.backend;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.appsys.pojo.BackendUser;
import cn.appsys.service.backend.BackendUserService;
import cn.appsys.service.developer.AppCategoryService;
import cn.appsys.service.developer.AppInfoService;
import cn.appsys.service.developer.AppVersionService;
import cn.appsys.service.developer.DataDictionaryService;
import cn.appsys.tool.Constants;
import cn.appsys.tool.EmptyUtils;

@Controller
@RequestMapping(value = "/user")
public class backendLoginController {
	@Resource
	private AppInfoService appInfoService;
	@Resource
	private DataDictionaryService dataDictionaryService;
	@Resource
	private AppCategoryService appCategoryService;
	@Resource
	private AppVersionService appVersionService;
	@Resource
	private BackendUserService backendUserService;

	@RequestMapping(value = "login")
	public String login() {
		return "backendLogin";
	}

	@RequestMapping(value = "doLogin")
	public String deLogin(@RequestParam(value = "userCode") String userCode,
			@RequestParam(value = "userPassword") String userPassword, Model model, HttpSession session) {
		BackendUser backendUser = backendUserService.findUser(userCode);
		if (EmptyUtils.isEmpty(backendUser)) {
			model.addAttribute("error", "用户名不存在!");
		} else {
			if (userPassword.equals(backendUser.getUserPassword())) {
				session.setAttribute(Constants.USER_SESSION, backendUser);
				return "backend/main";
			} else {
				model.addAttribute("error", "密码错误!");
			}
		}
		return "backendLogin";
	}

	@RequestMapping(value = "doLogout")
	public String doLogout(HttpSession session) {
		session.removeAttribute(Constants.USER_SESSION);
		return "backendLogin";
	}

	
}
