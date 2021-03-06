package com.panda.controller;

import com.panda.common.response.RespCode;
import com.panda.common.response.ResponseEntity;
import com.panda.mapper.OrderMapper;
import com.panda.mapper.OverviewMapper;
import com.panda.mapper.UserMapper;
import com.panda.service.AmountUtils.AmoutUtils;
import com.panda.service.time.TimeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class surveyForCMS {
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    TimeUtil timeUtil;
    @Autowired
    OverviewMapper overviewMapper;
    @Autowired
    AmoutUtils amoutUtils;
    @Transactional
    @RequestMapping(value = "/CMS/survey")
    public ResponseEntity survey(String storeid) throws Exception {
        Map<String,String> result =new HashMap();
        String todaydate=timeUtil.getYearToDay();
        result.put("newOrder",String.valueOf(orderMapper.countOrderOfToday(Integer.parseInt(storeid),todaydate)));
        result.put("allOrder",String.valueOf(orderMapper.countAllOrder(Integer.parseInt(storeid))));
        result.put("newUser",String.valueOf(userMapper.countNewUserOfToday(Integer.parseInt(storeid),todaydate)));
        System.out.println(overviewMapper.selectTurnover(todaydate));
        Integer turnover=overviewMapper.selectTurnover(todaydate);
        if(turnover==null){
            result.put("turnover","0");
            overviewMapper.insertOverview(Integer.parseInt(storeid),todaydate,0,timeUtil.getNowTime());
        }
        else
            result.put("turnover",amoutUtils.changeF2Y(turnover));
        return new ResponseEntity(RespCode.SUCCESS,result);

    }
}
