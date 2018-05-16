package cn.appsys.controller.developer;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 开发者用户控制器
 * 
 * @author 117
 *
 */

@Controller
@RequestMapping(value = "/dev")
public class DevUserController {
	private static Logger logger = Logger.getLogger(DevUserController.class);
	/**
	 * 进入开发者登录界面jj
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login")
	public String loginInfo() {
		logger.info("进入登录界面!!!!!!!!!!!!!!!!!!!");
		return "devLogin";
	}



}
