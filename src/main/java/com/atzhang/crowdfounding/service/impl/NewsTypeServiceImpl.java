package com.atzhang.crowdfounding.service.impl;

import com.atzhang.crowdfounding.beans.NewType;
import com.atzhang.crowdfounding.dao.NewTypeMapper;
import com.atzhang.crowdfounding.service.NewTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class NewsTypeServiceImpl implements NewTypeService {
    @Autowired
    private NewTypeMapper newTypeMapper;
    @Override
    public List<NewType> getAll() {
        return  newTypeMapper.selectByExample(null);
    }

    @Override
    public void deleteNewType(Integer id) {
        newTypeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void addNewType(NewType newType) {
        newType.setCreateTime(new Date());
        newTypeMapper.insert(newType);
    }
}
