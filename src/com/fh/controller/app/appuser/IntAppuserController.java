package com.fh.controller.app.appuser;

import com.fh.controller.base.BaseController;
import com.fh.utils.ResponseUtils;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






/**@author
  * 会员-接口类
  * 相关参数协议：
  * 00	请求失败
  * 01	请求成功
  * 02	返回空值
  * 03	请求协议参数不完整
  * 04  用户名或密码错误
  * 05  FKEY验证失败
 */
@Controller
@RequestMapping(value="/appuser")
public class IntAppuserController extends BaseController {


	public static final String RESULT = "result";
	public static final String MESSAGE = "message";
	@RequestMapping("/login")
	public JSONObject login(String userName,String password){
		System.out.println("执行token登录");
		JSONObject jsonObject = new JSONObject();
		if(StringUtils.isNotEmpty(userName)&&StringUtils.isNotEmpty(password)) {
			UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession();
			System.out.println(session.getId());

			try {
				subject.login(token);
				jsonObject.put("token", session.getId());
				jsonObject.put(RESULT, 1);
				jsonObject.put(MESSAGE, "登录成功");
			} catch (AuthenticationException e) {
				jsonObject.put(RESULT, 0);
				jsonObject.put(MESSAGE, "登录失败");
				e.printStackTrace();
			} catch (Exception e) {
				jsonObject.put(RESULT, 0);
				jsonObject.put(MESSAGE, "登录失败");
				e.printStackTrace();
			}
		}else{
			jsonObject.put(RESULT,0);
			jsonObject.put(MESSAGE,"登录失败");
		}

		return jsonObject;
	}

	@RequestMapping("/loginPrevent")
	public JSONObject needLogin(){
		JSONObject jsonObject = new JSONObject();

		jsonObject.put(RESULT,0);
		jsonObject.put(MESSAGE,"没有登录");
		return jsonObject;
	}


	/*
	 * 退出
	 */
	@RequestMapping(value="/logout")
	@ResponseBody
	public String logout(HttpServletResponse response,HttpServletRequest request) throws Exception {
		response.addHeader("Access-Control-Allow-Origin", "*");
		JSONObject object = new JSONObject();
		JSONObject object_data = new JSONObject();
		String data = request.getParameter("data");
		if(data==null||data.equals("")){
			object.put("success","false");
			object.put("msg","获取信息失败！");
			ResponseUtils.renderJson(response, object.toString());
			return null;
		}
		JSONObject string_to_json = JSONObject.fromObject(data);
		JSONObject json_to_data = string_to_json.getJSONObject("data");
		String tokenid =json_to_data.getString("tokenid");

		if(tokenid!=null&&!tokenid.equals("")){

		}else{
			object.put("success","false");
			object.put("msg","未获取信息！");
		}
		ResponseUtils.renderJson(response, object.toString());
		return null;
	}
	

}
	
 