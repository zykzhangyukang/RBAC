package com.atzhang.crowdfounding.service;

import com.atzhang.crowdfounding.beans.NewType;

import java.util.List;

public interface NewTypeService {
    List<NewType> getAll();

    void deleteNewType(Integer id);

    void addNewType(NewType newType);
}
