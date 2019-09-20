package com.atzhang.crowdfounding.beans;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    //状态码:100请求成功,200请求失败
    private String code;
    //封装jason的map
    private Map<String,Object> extend=new HashMap();
    //提示信息
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    /**
     * 请求成功的方法
     * @return
     */
    public Msg success(){
        Msg msg = new Msg();
        msg.setCode("100");
        msg.setMessage("请求成功");
        return msg;
    }
    /**
     * 请求s失败的方法
     * @return
     */
    public Msg fail(){
        Msg msg = new Msg();
        msg.setCode("200");
        msg.setMessage("请求失败");
        return msg;
    }

    /**
     * 添加数据
     * @param key
     * @param value
     * @return
     */
    public Msg add(String key,Object value){
         this.extend.put(key, value);
         return this;
    }

}
