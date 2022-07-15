package com.markerhub.controller;


import com.markerhub.common.lang.Result;
import com.markerhub.entity.User;
import com.markerhub.interceptor.annotation.UserLoginToken;
import com.markerhub.service.UserService;
import com.markerhub.util.Qiniu;
//import org.apache.shiro.authz.annotation.RequiresAuthentication;
import com.markerhub.util.RandomName;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 关注公众号：MarkerHub
 * @since 2020-05-25
 */
@Slf4j
@ResponseBody
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    //@RequiresAuthentication
    @GetMapping("/index")
    public Result index() {
        User user = userService.getById(1L);
        return Result.succ(user);
    }

//    @UserLoginToken
    @PostMapping("/save")
    public Result save(@Validated @RequestBody User user) {
        return Result.succ(user);
    }

    @PostMapping("/setAvatar")
    public Result setAvatar(@RequestParam("image") MultipartFile multipartFile, HttpSession session){
        log.info("setAvatar");
        // session断开，重新登录，带token操作怎么判断，todo
        User user = (User)session.getAttribute("user");
        if(user==null){
            log.info("no session");
            return Result.fail("请登录");
        }

        if(multipartFile.isEmpty()){
            return Result.fail("file is empty");
        }

        // 判断是否为图片，todo

        String name = multipartFile.getOriginalFilename(); // original name
        FileInputStream inputStream = null;

        try{
            inputStream = (FileInputStream) multipartFile.getInputStream();
        }catch (IOException e){
            e.printStackTrace();
            return Result.fail(e.toString());
        }

        String suffix = name.substring(name.lastIndexOf("."));
        String fileName = "img/userImg/"+ System.currentTimeMillis() + suffix;
        String path = Qiniu.uploadImg(inputStream, fileName);

        if(path=="") return Result.fail("上传失败");

        user.setAvatar(path);
        userService.saveOrUpdate(user);

        return Result.succ(path);
    }

}
