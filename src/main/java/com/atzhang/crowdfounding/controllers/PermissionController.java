package com.atzhang.crowdfounding.controllers;

import com.atzhang.crowdfounding.beans.Msg;
import com.atzhang.crowdfounding.beans.Permission;
import com.atzhang.crowdfounding.service.PermissionService;
import com.sun.org.apache.xml.internal.serialize.ElementState;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequestMapping("/permission")
@Controller
public class PermissionController {
    @Autowired
    private PermissionService permissionService=null;
    /**
     * 更新许可信息
     * @return
     */
    @ResponseBody
    @RequestMapping("/update")
    public Msg updatePermission(Permission permission){
        try {
            permissionService.updatePermission(permission);
        } catch (Exception e) {
            e.printStackTrace();
            return new Msg().fail();
        }
        return  new Msg().success();
    }
    /**
     * 去许可编辑页面
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/edit")
    public Msg editPermission(@RequestParam("id") Integer id,Map<String,Object> map){
        Permission permission = permissionService.findPermissionById(id);
        return  new Msg().success().add("permission",permission);
    }
    /**
     * 删除许可信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/delete")
    public Msg deletePermission(@RequestParam("id") Integer id){
        try {
            permissionService.deletePermission(id);
        } catch (Exception e) {
            e.printStackTrace();
            new Msg().fail();
        }
        return new Msg().success();
    }
    /**
     * 添加许可节点
     * @param permission
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/insert")
    public Msg insertPermission(Permission permission){
        try {
            permissionService.InsertPermission(permission);
        } catch (Exception e) {
            e.printStackTrace();
            return  new Msg().fail();
        }
        return new Msg().success();
    }
    /**
     * 去添加页面
     * @return
     */
    @RequestMapping(value = "/add")
    public String addPermission(){
        return "permission/add";
    }
    /**
     * 去许可管理首页
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(){
        return "permission/index";
    }

    /**
     * 角色添加权限时回显角色已经拥有的权限
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/loadAssignData")
    public List<Permission> loadAssignData(@RequestParam("roleid") Integer roleid){
        List<Permission> node=new ArrayList<>();
        //获取角色已经拥有的权限
        List<Integer> permissionids=permissionService.getPermissionByRoleId(roleid);
        //获取所有的权限
        List<Permission> permissions=permissionService.getAllPerission();
       //组装树
        Map<Integer,Permission> permissionMap=new HashMap<Integer, Permission>();
        for (Permission permission : permissions) {
            if(permissionids.contains(permission.getId())){
                permission.setChecked(true);
               if(permission.getParent()==0){
                   permission.setOpen(true);
               }
            }
            permissionMap.put(permission.getId(),permission);
        }
        //构建节点树
        BuildPermissionTree(node, permissions, permissionMap);

        return node;
    }
    /*
    public List<Permission>  getNodeForRole(List<Permission> parents,List<Integer> permissions){
        //拿到所有的根节点
        for (Permission parent : parents) {
            List<Permission> childNodes = permissionService.getChildNodes(parent.getId());
            parent.getChildren().addAll(childNodes);
            getNode(childNodes);
        }
        return parents;
    }*/
    /**
     * 加载节点树
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/loadData")
    public List<Permission> loadData(Map<String,Object> map){
        List<Permission> node=new ArrayList<>();
        //获取所有的权限
        List<Permission> permissions=permissionService.getAllPerission();
        //组装树
        Map<Integer,Permission> permissionMap=new HashMap<Integer, Permission>();
        for (Permission permission : permissions) {
            permissionMap.put(permission.getId(),permission);
        }
        BuildPermissionTree(node, permissions, permissionMap);
        return node;
    }

    /**
     * 构建节点树
     * @param node
     * @param permissions
     * @param permissionMap
     */
    private void BuildPermissionTree(List<Permission> node, List<Permission> permissions, Map<Integer, Permission> permissionMap) {
        for ( Permission p :permissions ) {
            Permission child = p;
            if ( child.getParent() == 0 ) {
                node.add(p);
            } else {
                Permission parent = permissionMap.get(child.getParent());
                parent.getChildren().add(child);
            }
        }
    }
    /**
     * 递归算法组装节点树:不建议一个使用,需要多次查询数据库,效率低下
     * @param parents
     * @return
     */
    public List<Permission> getNode(List<Permission> parents){
        //拿到所有的根节点
        for (Permission parent : parents) {
            //子节点
            List<Permission> childNodes = permissionService.getChildNodes(parent.getId());
            parent.getChildren().addAll(childNodes);
            getNode(childNodes);
        }
        return parents;
    }



}
