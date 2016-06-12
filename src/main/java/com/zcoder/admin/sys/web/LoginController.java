package com.zcoder.admin.sys.web;

import com.zcoder.admin.core.common.BaseController;
import com.zcoder.admin.core.exception.GlobalException;
import com.zcoder.admin.sys.domain.SysUser;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by lin on 2016-05-18.
 */
@Controller
@Slf4j
public class LoginController extends BaseController {



	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String init(Model model, @ModelAttribute("type") String type, @ModelAttribute("content") String content) {
		model.addAttribute("type", type);
		model.addAttribute("content", content);
		return "login";
	}

	/**
	 * 登录
	 * 
	 * @param sysUser
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(SysUser sysUser, RedirectAttributes redirectAttributes) throws GlobalException {
		if (log.isDebugEnabled()) {
			log.debug("loginName:{}", sysUser.getLoginName());
			log.debug("loginPwd:{}", sysUser.getLoginPwd());
		}
		UsernamePasswordToken token = new UsernamePasswordToken(sysUser.getLoginName(), sysUser.getLoginPwd());
		Subject currentUser = SecurityUtils.getSubject();
		String username = sysUser.getLoginName();
		try {
			// 在调用了login方法后,SecurityManager会收到AuthenticationToken,并将其发送给已配置的Realm执行必须的认证检查
			// 每个Realm都能在必要时对提交的AuthenticationTokens作出反应
			// 所以这一步在调用login(token)方法时,它会走到MyRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法
			log.info("对用户[" + username + "]进行登录验证,验证开始...");
			currentUser.login(token);
			log.info("对用户[" + username + "]进行登录验证,验证通过.");
		} catch (UnknownAccountException uae) {
			log.error("对用户[" + username + "]进行登录验证,验证未通过,未知账户");
			addMessage(redirectAttributes, MESSAGE_ERROR, "未知账户");
		} catch (IncorrectCredentialsException ice) {
			log.error("对用户[" + username + "]进行登录验证,验证未通过,错误的凭证");
			addMessage(redirectAttributes, MESSAGE_ERROR, "密码不正确");
		} catch (LockedAccountException lae) {
			log.error("对用户[" + username + "]进行登录验证,验证未通过,账户已锁定");
			addMessage(redirectAttributes, MESSAGE_ERROR, "账户已锁定");
		} catch (ExcessiveAttemptsException eae) {
			log.error("对用户[" + username + "]进行登录验证,验证未通过,错误次数过多");
			addMessage(redirectAttributes, MESSAGE_ERROR, "用户名或密码错误次数过多");
		} catch (AuthenticationException ae) {
			// 通过处理Shiro的运行时AuthenticationException就可以控制用户登录失败或密码错误时的情景
			log.error("对用户[" + username + "]进行登录验证,验证未通过,堆栈轨迹如下");
			ae.printStackTrace();
			addMessage(redirectAttributes, MESSAGE_ERROR, "用户名或密码不正确");
		}
		// 验证是否登录成功
		if (currentUser.isAuthenticated()) {
			log.info("用户[" + username + "]登录认证通过.");
			return "index";
		} else {
			token.clear();
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(RedirectAttributes redirectAttributes) {
		SecurityUtils.getSubject().logout();
		addMessage(redirectAttributes, MESSAGE_INFO, "您已安全退出");
		return "redirect:/login";
	}
	
	
}
