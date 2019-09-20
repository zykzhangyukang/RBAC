package com.atzhang.crowdfounding.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class MyFileUpLoadUtils {
    /**
     * 上传图片
     * @param multipartFiles
     * @return
     */
    public static List<String> UpLoadImgs(MultipartFile[] multipartFiles) {
        List<String> paths=new ArrayList<>();
        for (int i=0;i<multipartFiles.length;i++){
            //图片的原始名字
            String originalFilename = multipartFiles[i].getOriginalFilename();
            //拿到配置文件中上传到服务器的路径
            String windowpath=MyPropertyUtils.getUploadPath("windows");
            //构建在服务器上的路径
            String substring = UUID.randomUUID().toString().substring(0, 6);
            windowpath=windowpath+"\\"+substring+originalFilename;
            try {
                multipartFiles[i].transferTo(new File(windowpath));
                if((substring+originalFilename).length()>7){
                    paths.add(substring+originalFilename);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return paths;
    }
}
