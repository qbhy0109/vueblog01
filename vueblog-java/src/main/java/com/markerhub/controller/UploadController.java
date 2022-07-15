package com.markerhub.controller;

import com.markerhub.common.lang.Result;
import com.markerhub.util.Qiniu;
import com.markerhub.util.RandomName;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.io.IOException;

@RestController
@RequestMapping("/upload")
public class UploadController {

    @PostMapping("/image")
    public Result uploadImg(@RequestParam("image") MultipartFile multipartFile) {
        if(multipartFile.isEmpty()){
            return Result.fail("file is empty");
        }
//        String name = multipartFile.getName();      // image
        String name = multipartFile.getOriginalFilename(); // original name

        FileInputStream inputStream = null;

        try{
            inputStream = (FileInputStream) multipartFile.getInputStream();
        }catch (IOException e){
            e.printStackTrace();
        }

        // 两种模式 1.随机文件名 2.保留原文件名  todo

        String suffix = name.substring(name.lastIndexOf("."));
        String fileName = "img/blogImg/"+RandomName.generateRandomName(8,false)+suffix;
        multipartFile.getName();
        String path = Qiniu.uploadImg(inputStream, fileName);       // save path

//        System.out.println(path);
        return Result.succ(path);
    }
}
