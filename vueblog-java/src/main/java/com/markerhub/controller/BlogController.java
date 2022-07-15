package com.markerhub.controller;


import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.markerhub.common.lang.Result;
import com.markerhub.entity.Blog;
import com.markerhub.interceptor.annotation.Authentication;
import com.markerhub.interceptor.annotation.UserLoginToken;
import com.markerhub.service.BlogService;
//import com.markerhub.util.ShiroUtil;
//import org.apache.shiro.authz.annotation.RequiresAuthentication;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 关注公众号：MarkerHub
 * @since 2020-05-25
 */
@Slf4j
@RestController
public class BlogController {

    @Autowired
    BlogService blogService;

    @GetMapping("/blogs")
    public Result list(@RequestParam(defaultValue = "1") Integer currentPage, HttpSession session) {
        log.info("/blogs: "+session.getAttribute("user"));
        Page page = new Page(currentPage, 5);
        IPage pageData = blogService.page(page, new QueryWrapper<Blog>().orderByDesc("created"));
//        pageData.
//        System.out.println("BlogController.list()");

        return Result.succ(pageData);
    }


    @GetMapping("/blog/{id}")
//    @UserLoginToken
    public Result detail(@PathVariable(name = "id") Long id, HttpSession session) {
        log.info("/detail: "+session.getAttribute("user"));
        Blog blog = blogService.getById(id);
        Assert.notNull(blog, "该博客不存在");

        return Result.succ(blog);
    }

    @Authentication
    @PostMapping("/blog/edit")
    public Result edit(@Validated @RequestBody Blog blog, HttpSession session) {
        log.info("/edit: "+session.getAttribute("user"));
//        Assert.isTrue(false, "公开版不能任意编辑！");

        Blog temp = null;
        if(blog.getId() != null) {      // update       //  如果传输过程中的blog数据中的id 被修改或删除 ，不安全？
            temp = blogService.getById(blog.getId());
            // 只能编辑自己的文章
//            System.out.println(ShiroUtil.getProfile().getId());
//            Assert.isTrue(temp.getUserId().longValue() == ShiroUtil.getProfile().getId().longValue(), "没有权限编辑");

        } else {        // new

            temp = new Blog();
//            temp.setUserId(ShiroUtil.getProfile().getId());
            temp.setUserId(1L);
//            temp.setId(100L);
            temp.setCreated(LocalDateTime.now());
            temp.setStatus(0);
        }

        BeanUtil.copyProperties(blog, temp, "id", "userId", "created", "status");
        blogService.saveOrUpdate(temp);

        return Result.succ(null);
    }

    @Authentication
    @PostMapping("/blog/delete")
    public Result delete(@RequestParam(name="blogId") String id){

        blogService.removeById(id);
        return Result.succ("remove blog successfully");
    }


}
