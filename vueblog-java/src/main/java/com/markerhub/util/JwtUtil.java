package com.markerhub.util;


import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.markerhub.entity.User;
import com.markerhub.service.UserService;
import io.jsonwebtoken.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;


@Slf4j
@Component
public class JwtUtil {

    @Autowired
    UserService userService;

    private static final String KEY = "yyds";

    private static final long EXPIRE_TIME = 1000 * 60 * 60 * 24;     // 单位：ms

    public String generateToken(String id, String userName){

        // 注意 Claim.SUBJECT = 'sub'与下面的claim.getSubject()相对应 ......
        Map<String, Object> header = new HashMap<>();
        header.put(Claims.ID, id);
        header.put(Claims.SUBJECT, userName);
        header.put(Claims.ISSUER, new Date());
//        header.put(Claims., userName);
        System.out.println("generatetoken");
        JwtBuilder builder = Jwts.builder()
                .setClaims(header)
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRE_TIME))
                .signWith(SignatureAlgorithm.HS256, KEY);
        log.info(builder.compact());
        return builder.compact();
    }

    public boolean verifyToken(String token){

        if (token == null || token.length()==0){
            throw new RuntimeException("登录才能查看");   // need to login
        }

        User user = getUserFromToken(token);

        if(user != null){
            return true;
        }else {
            throw new RuntimeException("用户不存在");     // throw
        }
    }

    public User getUserFromToken(String token){

        Claims claims = null;

        try{
            log.info("start...");
            System.out.println(token);
            claims = Jwts.parser().setSigningKey(KEY).parseClaimsJws(token).getBody();
            log.info("1"+claims.toString());
        }catch(ExpiredJwtException e){
            log.info(e.toString());
            throw new RuntimeException("token已过期:"+e.toString());
        }
//        String userName = claims.getSubject();
//        log.info("==="+id+"===" + claims.getAudience()+"===="+claims.getIssuer()+"===="+claims.getExpiration());
        String id = claims.getId();
        User user = userService.getById(id);

        return user;
    }

}
//    public String generateToken(String id, String userName) {
//        String token = "";
//        token = JWT.create().withAudience(id)
//                .sign(Algorithm.HMAC256(userName));
//        return token;
//    }

//    public boolean verifyToken(String token) {
//
//        try {
//            String id = JWT.decode(token).getAudience().get(0);
//            log.info(id);
//            log.info("===" + id + "====");
//            User user = userService.getById(id);
//            if (user != null) {
//                return true;
//            } else {
//                return false;
//            }
//        } catch (JWTDecodeException e) {
//            log.info("decodeexception");
//            return false;
//        }
//    }
















