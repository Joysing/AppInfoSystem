package cn.appsys.android.developer;

import cn.appsys.pojo.DevUser;
import cn.appsys.service.developer.DevUserService;
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

/**
 * 开发者用户控制器
 * 
 * @author 117！！！！
 *
 */

@Controller
@RequestMapping(value = "/android/dev")
public class AndroidDevUserController {
	private static Logger logger = Logger.getLogger(AndroidDevUserController.class);
	@Resource
	private DevUserService devUserService;

	/**
	 * 进行登录验证
	 *
	 * @param devPassword
	 * @param devCode
	 * @return
	 */
	@RequestMapping(value = "/doLogin")
    @ResponseBody
	public DevUser doLogin(@RequestParam("userPassword") String devPassword
			, @RequestParam("userCode") String devCode,
						  HttpSession session) {
		DevUser devUser = devUserService.getDevUserByCode(devCode);
        if (EmptyUtils.isEmpty(devUser)) {
            return null;
        } else {
            if (devPassword.equals(devUser.getDevPassword())) {
                session.setAttribute(Constants.DEV_USER_SESSION, devUser);
            } else {
                return null;
            }
        }
        return devUser;
	}

	/**
	 * 退出登录
	 *
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/doLogout")
	public String doLogout(HttpSession session) {
		session.removeAttribute(Constants.DEV_USER_SESSION);
		return "index";
	}

}
