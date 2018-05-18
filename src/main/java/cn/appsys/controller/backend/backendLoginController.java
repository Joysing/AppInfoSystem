package cn.appsys.controller.backend;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import cn.appsys.controller.developer.DevUserController;
import org.apache.log4j.Logger;
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
	private static Logger logger = Logger.getLogger(backendLoginController.class);
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
		BackendUser a = null;
		System.out.print(""+a.getUserPassword()+a.getUserCode());
		return "backendLogin";
	}

	@RequestMapping(value = "/main")
	public String mainPage(){
		logger.info("进入主界面");
		return "backend/main";
	}

	@RequestMapping(value = "doLogin")
	public String doLogin(@RequestParam(value = "userCode") String userCode,
			@RequestParam(value = "userPassword",required=false) String userPassword, Model model, HttpSession session) {
		BackendUser backendUser = backendUserService.findUser(userCode);
		if (EmptyUtils.isEmpty(backendUser)) {
			model.addAttribute("error", "用户名不存在!");
		} else {
			if (userPassword.equals(backendUser.getUserPassword())) {
				session.setAttribute(Constants.USER_SESSION, backendUser);
				return "redirect:/user/main";
			} else {
				model.addAttribute("error", "密码错误!");
			}
		}
		return "index";
	}

	@RequestMapping(value = "doLogout")
	public String doLogout(HttpSession session) {
		session.removeAttribute(Constants.USER_SESSION);
		return "index";
	}

	
}
