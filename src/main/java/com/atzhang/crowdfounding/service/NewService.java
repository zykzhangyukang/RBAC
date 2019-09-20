package com.atzhang.crowdfounding.service;

import com.atzhang.crowdfounding.beans.New;
import com.atzhang.crowdfounding.beans.NewsComment;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface NewService {


    PageInfo<New> getNewPage(Integer pageno, Integer pagesize);

    New getFindNewsDetails(Integer id);

    void deleteNew(int i);

    void BatchDeleteNews(List<Integer> ids);


    void doAddNew(New ne, List<String> imgpaths, HttpSession session);

    List<String> getAllImgs(Integer id);

    List<NewsComment> getAllComment(Integer id);
}
