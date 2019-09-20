package com.atzhang.crowdfounding.beans;

import java.util.Date;

public class NewsComment {
    private Integer id;

    private String content;

    private Date time;

    private Integer newsId;

    private Integer userId;

    private Integer dznum;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getDznum() {
        return dznum;
    }

    public void setDznum(Integer dznum) {
        this.dznum = dznum;
    }
}