package com.atzhang.crowdfounding.controllers;

import com.atzhang.crowdfounding.beans.Msg;
import com.atzhang.crowdfounding.beans.New;
import com.atzhang.crowdfounding.beans.NewType;
import com.atzhang.crowdfounding.beans.NewsComment;
import com.atzhang.crowdfounding.service.NewService;
import com.atzhang.crowdfounding.service.NewTypeService;
import com.atzhang.crowdfounding.utils.MyFileUpLoadUtils;
import com.github.pagehelper.PageInfo;
import org.omg.PortableInterceptor.TRANSPORT_RETRY;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//新闻
@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewService newService=null;

    @Autowired
    private NewTypeService newTypeService;
    //添加新闻的类别
    @RequestMapping("/addNewType")
    public String addNewType(NewType newType){
        try {
            newTypeService.addNewType(newType);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:error.jsp";
        }
        return "redirect:/news/types";
    }

    //删除新闻的类别
    @ResponseBody
    @RequestMapping("/deleteNewType")
    public Msg deleteNewType(@RequestParam("id") Integer id){
        try {
            newTypeService.deleteNewType(id);
        } catch (Exception e) {
            e.printStackTrace();
            return new Msg().fail();
        }
        return new Msg().success();
    }
    //去新闻添加页面
    @RequestMapping("/add")
    public String goToAddNew(Map<String,Object> map){
        List<NewType> all = newTypeService.getAll();
        map.put("types",all);
        return "news/add";
    }
    //新闻发布
    @RequestMapping("/doAddNew")
    public String doAddNew(New ne , Map<String,Object> map, HttpSession session, @RequestParam("imgs") MultipartFile[] multipartFiles){
        //上传图片

        List<String> imgpaths= MyFileUpLoadUtils.UpLoadImgs(multipartFiles);//拿到存储在网服务器上的路径
       // System.out.println(imgpaths);
        try {
            newService.doAddNew(ne,imgpaths,session);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/news/add";
    }

    @RequestMapping("/index")
    public String index(Map<String,Object> map){
        map.put("types",newTypeService.getAll());
        return "news/index";
    }

    @RequestMapping("/types")
    public String toNewtypes(Map<String,Object> map){
        List<NewType> newTypes=newTypeService.getAll();
        map.put("types",newTypes);
        return "news/new_typs";
    }
    //去新闻管理页面
    @RequestMapping("/tomanager")
    public String tomanager(){
        return "news/manager_news";
    }
    @ResponseBody
    @RequestMapping("/deleteNew")
    public Msg deleteNewdelete(@RequestParam("ids") String ids){
        if(ids.contains("-")){
            List<Integer> idlist=new ArrayList<>();
            String[] split = ids.split("-");
            for (String s : split) {
                idlist.add(Integer.parseInt(s));
            }
            newService.BatchDeleteNews(idlist);
        }else {
            newService.deleteNew(Integer.parseInt(ids.trim()));
        }
        return new Msg().success();
    }
    /**
     * 新闻详情
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("/getNewDetails")
    public String getNewDetails(@RequestParam("id") Integer id,Map<String,Object> map){
        New mynews =newService.getFindNewsDetails(id);
        map.put("mynew",mynews);
        List<String> urls=newService.getAllImgs(id);
        map.put("imgs",urls);
        //获取所有的评论信息
        List<NewsComment> newsComments=newService.getAllComment(id);
        map.put("comments",newsComments);
        return "news/newdetails";
    }

    /**
     *  新闻分页
     * @param pageno
     * @param pagesize
     * @param map
     * @return
     */
    @ResponseBody
    @RequestMapping("/getnewspage")
    public Msg getNewsPage(@RequestParam(value = "pageno",defaultValue = "1") Integer pageno,
                           @RequestParam(value = "pagesize",defaultValue = "12") Integer pagesize,
                           Map<String,Object> map){
        PageInfo<New> newpage= newService.getNewPage(pageno,pagesize);
        map.put("page",newpage);
        return new Msg().success().add("page",newpage);
    }


}
