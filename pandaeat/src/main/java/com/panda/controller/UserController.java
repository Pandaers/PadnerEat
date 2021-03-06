package com.panda.controller;

import com.panda.common.response.RespCode;
import com.panda.common.response.ResponseEntity;
import com.panda.mapper.UserMapper;
import com.panda.model.RequestUser;
import com.panda.model.User;
import com.panda.service.time.TimeUtil;
import com.panda.service.wxapi.WxApi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * @Auther: 简单DI年华
 * @Date: 18-8-23 13:47
 * @Description:
 */

@RestController
public class UserController {

    //mapper注入
    @Autowired
    UserMapper userMapper;

    //时间工具类注入
    @Autowired
    TimeUtil timeUtil;

    //微信官方接口处理
    @Autowired
    WxApi wxApi;
    @Transactional
    @RequestMapping(value = "/login")
    public ResponseEntity insertUser(RequestUser data){
        //获取用户openid

        String openid  = wxApi.getOpenid(data.getCode());
        if(openid==null||openid==""){
            System.out.println("错了错了错了错了错了错了错了错了");
        }
        System.out.println(openid);
        //做查询操作 看是否重复
        if(userMapper.selectUersOpenId(openid,data.getStoreid())!=0){
            Map result = new HashMap();
            User user=userMapper.selectUersDataByOpenId(openid);
            result.put("userid",user.getUserid());
            result.put("nickname",user.getNickname());
            result.put("openid",openid);
            return new ResponseEntity(RespCode.SUCCESS,result);
        }
        User user;

        //拟合要插入的数据
        try{
            user = new User(Integer.parseInt(data.getStoreid()),0,openid,timeUtil.getNowTime(),data.getNickname()
                    ,data.getAvatar(),data.getMobile(),Short.parseShort(data.getGender()),0,"0");
        }
        catch (NumberFormatException e){
            System.out.println("数字格式错误");
            return new ResponseEntity(RespCode.WARN);
        }


        userMapper.insertUserData(user);

        Map result = new HashMap();
        result.put("userid",user.getUserid());
        result.put("nickname",user.getNickname());
        result.put("openid",openid);


        return new ResponseEntity(RespCode.SUCCESS,result);
    }

    @RequestMapping("/test")
    public String test(){
        return "running";
    }
}
