package com.markerhub.interceptor;

import com.markerhub.interceptor.annotation.Authentication;
import com.markerhub.interceptor.annotation.UserLoginToken;
import com.markerhub.util.JwtUtil;
import com.markerhub.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Slf4j
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    UserService userService;

    @Autowired
    JwtUtil jwtUtil;

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse
            , Object object) throws Exception{

//
//        httpServletResponse.setHeader("Access-Control-Allow-Origin", httpServletRequest.getHeader("Origin"));
//        httpServletResponse.setHeader("Access-Control-Allow-Methods", "*");
//        httpServletResponse.setHeader("Access-Control-Allow-Headers", "*");
//        httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");

        log.info(httpServletRequest.getSession().getId());

        Map<String, String> headerMap = new HashMap<>();
        Enumeration<String> enumeration = httpServletRequest.getHeaderNames();
        while (enumeration.hasMoreElements()) {
            String name	= enumeration.nextElement();
            String value = httpServletRequest.getHeader(name);
            headerMap.put(name, value);
        }
        log.info(headerMap.toString());




        if(!(object instanceof HandlerMethod)){     // ???????
            return true;
        }

        String token = httpServletRequest.getHeader("token");

        HandlerMethod handlerMethod = (HandlerMethod) object;
        Method method = handlerMethod.getMethod();

        log.info("method");

        if(method.isAnnotationPresent(Authentication.class)){

            Authentication authentication = method.getAnnotation(Authentication.class);
            if (authentication.require()){

                return jwtUtil.getUserFromToken(token).equals(httpServletRequest.getSession().getAttribute("user"));
            }
        }

        if(method.isAnnotationPresent(UserLoginToken.class)){

            UserLoginToken userLoginToken = method.getAnnotation(UserLoginToken.class);

            if(userLoginToken.require()){
                return jwtUtil.verifyToken(token);
            }
        }

        return true;
    }

}


























