package com.atzhang.crowdfounding.service;

import com.atzhang.crowdfounding.beans.Certificates;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface CertificateService {

    PageInfo<Certificates> getPage(Integer pageno, Integer pagesize);

    void Save(Certificates cert);

    Certificates findOneById(Integer id);

    void update(Certificates certificate);

    void deleteCertificate(String ids);

    void batchdeleteCerificate(List<Integer> idlist);

    PageInfo<Certificates> getpageByKeyWord(String word, Integer pageno, Integer pagesize);
}
