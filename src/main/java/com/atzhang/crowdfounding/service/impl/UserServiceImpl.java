package com.atzhang.crowdfounding.service.impl;

import com.atzhang.crowdfounding.beans.Role;
import com.atzhang.crowdfounding.beans.User;
import com.atzhang.crowdfounding.beans.UserToken;
import com.atzhang.crowdfounding.beans.UserTokenExample;
import com.atzhang.crowdfounding.dao.UserMapper;
import com.atzhang.crowdfounding.dao.UserTokenMapper;
import com.atzhang.crowdfounding.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 用户
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserTokenMapper userTokenMapper
            ;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public User queryForLogin(User user) {
        return userMapper.QueryForLogin(user);
    }

    @Override
    public boolean IdIsMatchPwd(User user1, User dbuser) {
        String formpwd = user1.getPassword();
        formpwd = DigestUtils.md5DigestAsHex(formpwd.getBytes());
        if (formpwd != "" && formpwd.equals(dbuser.getPassword())) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public User IsHaveUserByAccountId(String loginId) {
        return userMapper.isHaveUser(loginId);
    }

    @Override
    public PageInfo<User> getUserPage(Integer pageno, Integer size) {
        PageHelper.startPage(pageno, size);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        List<User> users = mapper.getList();
        PageInfo<User> pageInfo = new PageInfo<>(users);
        return pageInfo;
    }

    @Override
    public void deleteUser(int i) {
        userMapper.deleteUser(i);
    }

    @Override
    public void BatchDelete(List<Integer> idlist) {
        userMapper.batchDelete(idlist);
    }

    @Override
    public User findUserById(Integer id) {
        return userMapper.findUserById(id);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    @Override
    public void saveUser(User user) {
        userMapper.add(user);
    }

    @Override
    public PageInfo<User> findUserLike(String keyword, Integer pageno, Integer pagesize) {
        PageHelper.startPage(pageno, pagesize);
        SqlSession sqlSession = sqlSessionFactory.openSession();
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        return new PageInfo<>(mapper.findUserLike(keyword));
    }

    @Override
    public List<Role> getAllReadyRoles(Integer id) {
        return userMapper.getAllReadyRoles(id);
    }

    @Override
    public List<Role> getUnHaveRoles(Integer id) {
        return userMapper.getUnHaveRoles(id);
    }

    @Override
    public void AssignRole(Map<String, Object> map) {
        userMapper.AssignRole(map);
    }

    @Override
    public void unAssignRole(Map<String, Object> map) {
        userMapper.UnassignRole(map);
    }
    @Override
    public boolean Register(User user) {
        try {
            //密码加密
            String Md5passsword = DigestUtils.md5DigestAsHex(user.getPassword().getBytes());//加密
            user.setPassword(Md5passsword);
            userMapper.add(user);
        } catch (Exception e) {
            e.printStackTrace();
            //失败的原因有,账号已经存在,邮箱已经存在
            return false;
        }
        return true;
    }

    @Override
    public boolean sendEmail(String email)  {
        boolean haveEmail = emailIsHave(email);
        if(haveEmail){
            //拿到用户根据email
            User user=userMapper.getUserByEmail(email);
            //向数据库中的user_token表中插入token
            String token = UUID.randomUUID().toString();
            //userMapper.savetoken(user,token);
            UserToken userToken = new UserToken();
            userToken.setUserId(user.getId());
            userToken.setTokenId(token);
            userTokenMapper.insert(userToken);
            //发送邮件(发送链接<a><a>带上token)
           try {
               String msg="<a  style='color:red;font-size:30;' href='http://localhost:8989/CrowdFounding/reSetPwd?token="+token+"'>点击找回密码</a> " +
                       "     此链接爱点不点,不点拉倒!";
               HtmlEmail HtmlEmail = new HtmlEmail();
               HtmlEmail.setHostName("127.0.0.1");
               HtmlEmail.setSmtpPort(25);
               HtmlEmail.setAuthentication("admin@atyukang.com", "123456");//邮件服务器验证：用户名/密码
               //从本机服务器发送
               HtmlEmail.setFrom("admin@atyukang.com");
               HtmlEmail.addTo(email);
               HtmlEmail.setMsg(msg);
               HtmlEmail.setSubject("国家安全局");
               HtmlEmail.setContent(msg,"text/html;charset=utf-8");
               HtmlEmail.send();
           }catch (Exception e){
               System.out.println(e);
               System.out.println("你的服务器邮箱服务未开启");
               return false;
           }
            return true;
        }
        return false;
    }

    @Override
    public boolean emailIsHave(String email) {
        User user = userMapper.emailIsHave(email);
        if(user==null){
            return false;
        }else{
            return true;
        }
    }

    @Override
    public boolean doSetPwd(String newpwd, String token) {
        User user =userMapper.getUserByTokenid(token);
        if(user!=null){
            user.setPassword(DigestUtils.md5DigestAsHex(newpwd.getBytes()));
            userMapper.updateUser(user);
            //清除token
            UserTokenExample example=new UserTokenExample();
            UserTokenExample.Criteria criteria = example.createCriteria();
            criteria.andTokenIdEqualTo(token);
            userTokenMapper.deleteByExample(example);
            return true;
        }
        return false;
    }

    @Override
    public void saveToken(Integer id, String s) {
        UserToken userToken = new UserToken();
        userToken.setUserId(id);
        userToken.setAutoLogin(s);
        userTokenMapper.insert(userToken);
    }

    @Override
    public User getUserByAutoLoginToken(String token) {
        UserTokenExample ex = new UserTokenExample();
        UserTokenExample.Criteria criteria = ex.createCriteria();
        criteria.andAutoLoginEqualTo(token);
        List<UserToken> userTokens = userTokenMapper.selectByExample(ex);
        Integer userId = userTokens.get(0).getUserId();
        User user =userMapper.getuserById(userId);
        return user;
    }


}
