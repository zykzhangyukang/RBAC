package com.atzhang.crowdfounding.beans;

import java.util.Date;

public class New {
    private Integer newsid;

    private String newstitle;

    private String newscontent;

    private Date newsdate;

    private String newsdesc;

    private String newsimagepath;

    private Integer newslooknum;

    private Integer sendUserId;

    private Integer typeId;

    public Integer getNewsid() {
        return newsid;
    }

    //新闻标签
    private NewType newType;

    //新闻发布者
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public NewType getNewType() {
        return newType;
    }

    public void setNewType(NewType newType) {
        this.newType = newType;
    }

    public void setNewsid(Integer newsid) {
        this.newsid = newsid;
    }

    public String getNewstitle() {
        return newstitle;
    }

    public void setNewstitle(String newstitle) {
        this.newstitle = newstitle == null ? null : newstitle.trim();
    }

    public String getNewscontent() {
        return newscontent;
    }

    public void setNewscontent(String newscontent) {
        this.newscontent = newscontent == null ? null : newscontent.trim();
    }

    public Date getNewsdate() {
        return newsdate;
    }

    public void setNewsdate(Date newsdate) {
        this.newsdate = newsdate;
    }

    public String getNewsdesc() {
        return newsdesc;
    }

    public void setNewsdesc(String newsdesc) {
        this.newsdesc = newsdesc == null ? null : newsdesc.trim();
    }

    public String getNewsimagepath() {
        return newsimagepath;
    }

    public void setNewsimagepath(String newsimagepath) {
        this.newsimagepath = newsimagepath == null ? null : newsimagepath.trim();
    }

    public Integer getNewslooknum() {
        return newslooknum;
    }

    public void setNewslooknum(Integer newslooknum) {
        this.newslooknum = newslooknum;
    }

    public Integer getSendUserId() {
        return sendUserId;
    }

    public void setSendUserId(Integer sendUserId) {
        this.sendUserId = sendUserId;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    @Override
    public String toString() {
        return "New{" +
                "newsid=" + newsid +
                ", newstitle='" + newstitle + '\'' +
                ", newscontent='" + newscontent + '\'' +
                ", newsdate=" + newsdate +
                ", newsdesc='" + newsdesc + '\'' +
                ", newsimagepath='" + newsimagepath + '\'' +
                ", newslooknum=" + newslooknum +
                ", sendUserId=" + sendUserId +
                ", typeId=" + typeId +
                ", newType=" + newType +
                '}';
    }
}