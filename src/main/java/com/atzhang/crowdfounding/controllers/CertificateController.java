package com.atzhang.crowdfounding.controllers;

import com.atzhang.crowdfounding.beans.Certificates;
import com.atzhang.crowdfounding.beans.Msg;
import com.atzhang.crowdfounding.service.CertificateService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class CertificateController {

    @Autowired
    private CertificateService certificateService=null;

    /**
     * 去资质维护页面
     * @return
     */
    @RequestMapping("/toCertificate")
    public String certificate(){
        return "certificate";
    }

    /**
     * 批量
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping("/deleteCertificate")
    public Msg deleteCertificate(@RequestParam("ids") String ids){
        try {
            if(ids.contains("-")){
                List<Integer> idlist=new ArrayList<>();
                String[] split = ids.split("-");
                for(String s:split){
                    idlist.add(Integer.parseInt(s));
                }
                certificateService.batchdeleteCerificate(idlist);
            }else {
                certificateService.deleteCertificate(ids);
            }
        }catch (Exception e){
           new Msg().fail();
        }

        return new Msg().success();
    }
    /**
     * 更新
     * @param certificate
     * @return
     */
    @ResponseBody
    @RequestMapping("/updateCertificate")
    public Msg updateCertificate(Certificates certificate){
        try {
            certificateService.update(certificate);
        } catch (Exception e) {
            e.printStackTrace();
            new Msg().fail();
        }
        return new Msg().success();
    }
    /**
     * 编辑
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("/editCertificate")
    public Msg editCertificate(@RequestParam("id") Integer id){
        Certificates certificate=null;
        try {
           certificate= certificateService.findOneById(id);
        } catch (Exception e) {
            e.printStackTrace();
            new Msg().fail();
        }
        return new Msg().success().add("certificate",certificate);
    }
    /**
     * 添加
     * @return
     */
    @ResponseBody

    @RequestMapping("/addCertificate")
    public Msg addCertificate(Certificates cert){
        try {
            certificateService.Save(cert);
        } catch (Exception e) {
            e.printStackTrace();
            new Msg().fail();
        }
        return new Msg().success();
    }
    /**
     * 资质分页
     * @param pageno
     * @param pagesize
     * @return
     */
    @ResponseBody
    @RequestMapping("/getCertPage")
    public Msg getCertPage(@RequestParam("pageno") Integer pageno,@RequestParam("pagesize") Integer pagesize){
        PageInfo<Certificates>  page= certificateService.getPage(pageno,pagesize);
        return new Msg().success().add("page",page);
    }

    /**
     * 模糊查询资质
     * @param word
     * @param map
     * @param pageno
     * @param pagesize
     * @return
     */
    @ResponseBody
    @RequestMapping("/queryForCert")
    public Msg queryForCert(@RequestParam("keyword") String word,Map<String,Object> map,
                            @RequestParam(value = "pageno" ,defaultValue = "1") Integer pageno,
                            @RequestParam(value = "pagesize",defaultValue = "8") Integer pagesize ){
        PageInfo<Certificates> pageInfo=null;
        try {
            pageInfo=certificateService.getpageByKeyWord(word,pageno,pagesize);
        } catch (Exception e) {
            e.printStackTrace();
            return new Msg().fail();
        }

        return new Msg().success().add("page",pageInfo);
    }

}
