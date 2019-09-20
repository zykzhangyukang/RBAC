package com.atzhang.crowdfounding.utils;

import com.atzhang.crowdfounding.beans.Permission;
import sun.awt.windows.WingDings;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class MyPropertyUtils {


    public static String getUploadPath(String windows) {
        Properties properties=new Properties();
        InputStream resourceAsStream = MyPropertyUtils.class.getClassLoader().getResourceAsStream("myfileupload.properties");
        try {
            properties.load(resourceAsStream);
            String property = properties.getProperty(windows);
            return property;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
