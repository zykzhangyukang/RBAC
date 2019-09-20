package com.atzhang.crowdfounding.dao;

import com.atzhang.crowdfounding.beans.Certificates;
import com.atzhang.crowdfounding.beans.CertificatesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CertificatesMapper {
    long countByExample(CertificatesExample example);

    int deleteByExample(CertificatesExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Certificates record);

    int insertSelective(Certificates record);

    List<Certificates> selectByExample(CertificatesExample example);

    Certificates selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Certificates record, @Param("example") CertificatesExample example);

    int updateByExample(@Param("record") Certificates record, @Param("example") CertificatesExample example);

    int updateByPrimaryKeySelective(Certificates record);

    int updateByPrimaryKey(Certificates record);
}