package com.atzhang.crowdfounding.dao;

import com.atzhang.crowdfounding.beans.Role;
import com.atzhang.crowdfounding.beans.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface UserMapper {
    /**
     * 添加用户
     * @param user
     */

    void add(User user);
    /**
     * 用户的账号和密码是否匹配
     * @param user
     * @return
     */
    @Select(value = "select * from user where loginId=#{loginId} and password=#{password}")
    User QueryForLogin(User user);
    /**
     * 是否存在该账号对应的用户
     * @param loginId
     * @return
     */
    @Select(value = "select * from user where loginId=#{loginId}")
    User isHaveUser(String loginId);

    /**
     *获取所有的用户
     * @return
     */
    @Select(value = "select * from user")
    List<User> getList();

    /**
     * 根据id删除用户
     * @param i
     */
    @Select(value = "delete from user where id=#{i}")
    void deleteUser(int i);

    /**
     * 批量删除
     * @param ids
     */
    void batchDelete(List<Integer> ids);

    /**
     * 根据id查询用户信息
     * @param id
     * @return
     */
    @Select(value = "select * from user where id=#{id}")
    User findUserById(Integer id);

    /**
     * 用户更新
     * @param user
     */
    void updateUser(User user);

    /**
     * 根据账号模糊插叙
     * @param keyword
     * @return
     */
    List<User> findUserLike(String keyword);

    List<Role> getAllReadyRoles(Integer id);

    List<Role> getUnHaveRoles(Integer id);

    void AssignRole(Map<String, Object> map);

    void UnassignRole(Map<String, Object> map);

    @Select("select * from user where email=#{email}")
    User emailIsHave(String email);

    @Insert("insert into user_token(user_id,token_id) values(#{user.id},#{token})")
    void savetoken(@Param("user") User user, @Param("token") String token);

    @Select(value = "select * from user where email=#{email}")
    User getUserByEmail(String email);

    @Select(value = "select * from user where id=(select user_id from user_token where token_id=#{token})")
    User getUserByTokenid(String token);

    @Delete(value = "delete from user_token where token_id=#{token}")
    void cleanToken(String token);

    @Select(value = "select * from user where id=#{userId}")
    User getuserById(Integer userId);
}
