package com.markerhub.util;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import lombok.extern.slf4j.Slf4j;

import java.io.FileInputStream;

@Slf4j
public class Qiniu {

    private static final String ACCESS_KEY = "nx44sswxO5oHTDT5DmiUntDAcnXIPMmn92rQj4DV";
    private static final String SECRET_KEY = "0cDtM8C-vJ3sBSeIcnSph3DG1iT-jG2KArYW6jjw";
    private static final String BUCKET = "qbhy";         // bucket 是 空间名
    private static final String DOMAIN = "http://static.yjzq.online/";

//    String localFilePath = "D:\\WorkSpace\\JAVA\\learning\\vueblog\\vueblog-vue\\public\\favicon.ico";
    // key 是文件路径+文件名
//    String key = "others/"+localFilePath.substring(localFilePath.lastIndexOf("\\")+1);

    public static String uploadImg(FileInputStream file, String fileName){

        Configuration cfg = new Configuration(Region.region2());
        UploadManager uploadManager = new UploadManager(cfg);

        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        String upToken = auth.uploadToken(BUCKET);

        try{
            Response response = uploadManager.put(file, fileName, upToken, null, null);
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            return DOMAIN+putRet.key;       // image url
//            System.out.println(putRet.key);
//            System.out.println(putRet.hash);
        }catch (QiniuException ex) {
//            System.err.println(ex.toString());      // throw
            ex.printStackTrace();
            return ex.toString();
        }

    }


}
