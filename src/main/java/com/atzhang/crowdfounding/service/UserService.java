package com.atzhang.crowdfounding.service;

import com.atzhang.crowdfounding.beans.Role;
import com.atzhang.crowdfounding.beans.User;
import com.github.pagehelper.PageInfo;
import org.apache.commons.mail.EmailException;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserService {

    User queryForLogin(User user);

    boolean IdIsMatchPwd(User user1, User dbuser);

    User IsHaveUserByAccountId(String loginId);

    PageInfo<User> getUserPage(Integer pageno, Integer size);

    void deleteUser(int i);

    void BatchDelete( List<Integer> ids);

    User findUserById(Integer id);

    void updateUser(User user);

    void saveUser(User user);

    PageInfo<User> findUserLike(String keyword,Integer pageno,Integer pagesize);

    List<Role> getAllReadyRoles(Integer id);

    List<Role> getUnHaveRoles(Integer id);

    void AssignRole(Map<String, Object> map);

    void unAssignRole(Map<String, Object> map);

    boolean Register(User user);

    boolean sendEmail(String email);

    boolean emailIsHave(String email);

    boolean doSetPwd(String newpwd, String token);


    void saveToken(Integer id, String s);

    User getUserByAutoLoginToken(String token);
}
