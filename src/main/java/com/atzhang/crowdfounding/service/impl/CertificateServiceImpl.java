package com.atzhang.crowdfounding.service.impl;

import com.atzhang.crowdfounding.beans.Certificates;
import com.atzhang.crowdfounding.beans.CertificatesExample;
import com.atzhang.crowdfounding.dao.CertificatesMapper;
import com.atzhang.crowdfounding.service.CertificateService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CertificateServiceImpl implements CertificateService {

    @Autowired
    private CertificatesMapper certificatesMapper=null;


    @Autowired
    private SqlSessionFactory sqlSessionFactory=null;

    //分页
    public PageInfo<Certificates> getPage(Integer pageno, Integer pagesize) {
        PageHelper.startPage(pageno,pagesize);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        CertificatesMapper mapper = sqlSession.getMapper(CertificatesMapper.class);
        List<Certificates> certificates = mapper.selectByExample(null);
        PageInfo<Certificates> certificatesPageInfo = new PageInfo<>(certificates);
        return certificatesPageInfo;
    }

    @Override
    public void Save(Certificates cert) {
        certificatesMapper.insert(cert);
    }

    @Override
    public Certificates findOneById(Integer id) {
        return certificatesMapper.selectByPrimaryKey(id);
    }

    @Override
    public void update(Certificates certificate) {
        certificatesMapper.updateByPrimaryKey(certificate);
    }

    @Override
    public void deleteCertificate(String ids) {
       certificatesMapper.deleteByPrimaryKey(Integer.parseInt(ids));
    }

    @Override
    public void batchdeleteCerificate(List<Integer> idlist) {
        CertificatesExample exemple=new CertificatesExample();
        CertificatesExample.Criteria criteria = exemple.createCriteria();
         criteria.andIdIn(idlist);
        certificatesMapper.deleteByExample(exemple);
    }

    @Override
    public PageInfo<Certificates> getpageByKeyWord(String word, Integer pageno, Integer pagesize) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        CertificatesMapper mapper = sqlSession.getMapper(CertificatesMapper.class);
        PageHelper.startPage(pageno,pagesize);
        CertificatesExample example=new CertificatesExample();
        CertificatesExample.Criteria criteria = example.createCriteria();
        criteria.andNameLike(word);
        List<Certificates> list = mapper.selectByExample(example);

        return new PageInfo<>(list);
    }
}
