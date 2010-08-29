package kr.pe.okjsp.jersey.manager;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import kr.pe.okjsp.jersey.bean.ResultBean;
import kr.pe.okjsp.member.Member;
import kr.pe.okjsp.member.MemberHandler;

import com.sun.jersey.spi.resource.Singleton;

/**
 * @author topolo
 *
 */
@Singleton
@Path("/login")
public class LoginManager {
	
	@POST
	@Path("/")
	@Produces("text/xml")
	public ResultBean loginXml(@FormParam(value = "id") String id,@FormParam(value = "password") String password) {
		boolean isLogin = login(id,password);
		ResultBean resultbean = new ResultBean();
		if (isLogin) {
			resultbean.setResult("true");
		} else {
			resultbean.setResult("false");
		}
		
		return resultbean;
	}

	/*
	 * 로그인처리
	 */
	private boolean login(String id, String password) {
		 boolean isLogin = false;
		 MemberHandler mh = new MemberHandler();
		 Member member = new Member();
		 member.setId(id);
		 member.setPassword(password);
		 
		 try {
			if (mh.doLogin(member) == 1) {
				 isLogin = true;
			 } else {
				 isLogin = false;
			 }
		} catch (Exception e) {
			isLogin = false;
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isLogin;
	}
	
}
