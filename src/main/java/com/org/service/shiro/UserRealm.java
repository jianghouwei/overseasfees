package com.org.service.shiro;

import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.org.model.shiro.ShiroUser;
import com.org.sysetem.service.PermissionService;
import com.org.sysetem.service.RolesService;
import com.org.sysetem.service.UserInfoService;
import com.org.system.model.UserInfo;
import com.org.utils.CaptchaException;
import com.org.utils.Encodes;
import com.org.utils.UserInfoNullException;
import com.org.utils.UserUtil;

/**
 * 用户登录授权service(shrioRealm)
 */
@Service
public class UserRealm extends AuthorizingRealm {

	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private PermissionService permissionService;
	
	@Autowired
	private RolesService rolesService;

	/**
	 * 认证回调函数,登录时调用.
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {
		UsernamePasswordCaptchaToken token = (UsernamePasswordCaptchaToken) authcToken;
//		token.setRememberMe(false);  
		UserInfo user = userInfoService.selectByLoginName(token.getUsername());
		if (user != null && doCaptchaValidate(token)) {
			Set<String> stringPermissions = null;
			Set<String> roles = rolesService.getRolesByUserId(user.getId());
			if(!roles.isEmpty()){
				String lag = roles.iterator().next();
				stringPermissions = permissionService.getPermissionByUserId(user.getId(),lag);
			}
			byte[] salt = Encodes.decodeHex(user.getSalt());
			ShiroUser shiroUser = new ShiroUser(user.getId(), user.getLoginName(), 
			user.getName(),user.getUserType(),roles,stringPermissions);
			// 设置用户session
			Session session = SecurityUtils.getSubject().getSession();
			session.setAttribute("shiroUser", shiroUser);//user  权限和
			session.setAttribute("user", user);//用户详情
			return new SimpleAuthenticationInfo(shiroUser, user.getPassword(), ByteSource.Util.bytes(salt), getName());
		} else {
		   throw new UserInfoNullException("用户不存在！");
		}
	}

	/**
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		ShiroUser shiroUser = (ShiroUser) principals.getPrimaryPrincipal();
		//依据登录名
		//把principals放session中 key=userId value=principals
		SecurityUtils.getSubject().getSession().setAttribute(String.valueOf(shiroUser.getId()),
				SecurityUtils.getSubject().getPrincipals());
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		Set<String> roles = null;//角色
		Set<String> stringPermissions = null ;//权限
		if(shiroUser.getRoles() == null){
			roles = rolesService.getRolesByUserId(shiroUser.getId());
		}else{
			roles = shiroUser.getRoles();
		}
		//无角色坑定无权限
		if(shiroUser.getStringPermissions() == null && !roles.isEmpty()){
			String lag = roles.iterator().next();
			stringPermissions = permissionService.getPermissionByUserId(shiroUser.getId(),lag);
		}else{
			stringPermissions = shiroUser.getStringPermissions();
		}
		// 赋予角色
		for(String role:roles){
			info.addRole(role);
		}
		// 赋予权限
		for(String permission:stringPermissions){
			//判断是否有  del view addf edit addc jurisdiction
			info.addStringPermission(permission);
		}
		/***************************/
			//设置一些用户登录记录
		/***************************/
		return info;

	}

	/**
	 * 验证码校验
	 * 
	 * @param token
	 * @return boolean
	 */
	protected boolean doCaptchaValidate(UsernamePasswordCaptchaToken token) {
		String captcha = (String) SecurityUtils.getSubject().getSession()
				.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		if (captcha != null && !captcha.equalsIgnoreCase(token.getCaptcha())) {
			throw new CaptchaException("验证码错误！");
		}
		return true;
	}

	/**
	 * 设定Password校验的Hash算法与迭代次数.
	 */
	@PostConstruct
	public void initCredentialsMatcher() {
		HashedCredentialsMatcher matcher = new HashedCredentialsMatcher(UserUtil.HASH_ALGORITHM);
		matcher.setHashIterations(UserUtil.HASH_INTERATIONS);
		setCredentialsMatcher(matcher);
	}
	
	@Override
	public void clearCachedAuthorizationInfo(PrincipalCollection principals) {
		super.clearCachedAuthorizationInfo(principals);
	}

	@Override
	public void clearCachedAuthenticationInfo(PrincipalCollection principals) {
		super.clearCachedAuthenticationInfo(principals);
	}

	@Override
	public void clearCache(PrincipalCollection principals) {
		super.clearCache(principals);
	}

	public void clearAllCachedAuthorizationInfo() {
		getAuthorizationCache().clear();
	}

	public void clearAllCachedAuthenticationInfo() {
		getAuthenticationCache().clear();
	}

	public void clearAllCache() {
		clearAllCachedAuthenticationInfo();
		clearAllCachedAuthorizationInfo();
	}

}
