//package com.kopo.config;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.security.core.Authentication;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//
//public class LoginSuccessHandler implements AuthenticationSuccessHandler{
//	
//	private String loginidname;
//    private String defaultUrl;
// 
//    @Override
//    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
//            Authentication authentication) throws IOException, ServletException {
//    }
// 
//    public String getLoginidname() {
//        return loginidname;
//    }
// 
//    public void setLoginidname(String loginidname) {
//        this.loginidname = loginidname;
//    }
// 
//    public String getDefaultUrl() {
//        return defaultUrl;
//    }
// 
//    public void setDefaultUrl(String defaultUrl) {
//        this.defaultUrl = defaultUrl;
//    }
//    
//}
