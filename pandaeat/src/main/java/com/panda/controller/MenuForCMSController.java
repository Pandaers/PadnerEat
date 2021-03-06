package com.panda.controller;

import com.github.pagehelper.PageHelper;
import com.panda.common.response.RespCode;
import com.panda.common.response.ResponseEntity;
import com.panda.mapper.CatMapper;
import com.panda.mapper.FoodMapper;
import com.panda.model.Cat;
import com.panda.model.Food;
import com.panda.model.FoodForCMS;
import com.panda.model.RequestOrder;
import com.panda.service.getCatMap.GetCatMap;
import com.panda.service.time.TimeUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
public class MenuForCMSController {

    @Autowired
    FoodMapper foodMapper;
    @Autowired
    CatMapper catMapper;
    @Autowired
    GetCatMap getCatMap;
    @Autowired
    TimeUtil timeUtil;
    Integer storeid;
    Integer id;
    Integer currentPage;
    /*
    * 返回该饭店所有菜品
    * */
    @RequestMapping(value = "/CMS/MenuList")
    public ResponseEntity selectMenuList(Integer storeid){
        List<FoodForCMS> result =foodMapper.selectFoodCMSList(storeid);
        //得到菜品名int转string对应map
        Map<Integer, String> catmap = getCatMap.getCatMap(storeid);
        if(result.size()==0){
            return new ResponseEntity(RespCode.SUCCESS,null);
        }
        for(FoodForCMS i:result){
            i.setCatname(catmap.get(i.getCatid()));
        }
        return new ResponseEntity(RespCode.SUCCESS,result);
    }
    /*
     * 返回所选的菜品详情
     * */
    @RequestMapping(value = "/CMS/SingleMenu")
    public ResponseEntity selectSingleMenu(@Param("storeid") Integer storeid, @Param("id") Integer id){
        //得到菜品名int转string对应map
        Map<Integer, String> catmap = getCatMap.getCatMap(storeid);

        Food result = foodMapper.selectSingleFood(storeid,id);
        if (result==null){
            return new ResponseEntity(RespCode.WRONG);
        }
        result.setCatname(catmap.get(result.getCatid()));
        return new ResponseEntity(RespCode.SUCCESS,result);
    }
    /*
    * ajax返回类别表（CatList）
    * */
    @RequestMapping(value = "/CMS/allCatName")
    public ResponseEntity allCatName(Cat data){
        List<Cat> result=catMapper.selectAllCatData(storeid);
        return new ResponseEntity(RespCode.SUCCESS,result);
    }
    /*
    * 添加菜品
    * */
    @Transactional
    @RequestMapping(value = "/CMS/AddMenu")
    public ResponseEntity selectSingleMenu(Food food){
        try{
            food.setAddtime(timeUtil.getNowTime());
            foodMapper.insertFood(food);
            return new ResponseEntity(RespCode.SUCCESS);
        }catch (RuntimeException e){
            return new ResponseEntity(RespCode.WARN);
        }

    }
    /*
    * 更新菜品
    * */
    @Transactional
    @RequestMapping(value = "/CMS/updateFood")
    public ResponseEntity updateFood(Food food){
        try{
            foodMapper.updateFood(food);
            return new ResponseEntity(RespCode.SUCCESS);
        }catch (RuntimeException e){
            return new ResponseEntity(RespCode.WARN);
        }

    }
    /*
    * 通过name/detail模糊查找菜品
    * */
    @RequestMapping(value = "/CMS/searchFood")
    public ResponseEntity updateFood(Integer storeid,String searchString,Integer currentPage){
        if(currentPage==0||currentPage==null){
            currentPage=1;
        }
        PageHelper.startPage(currentPage, 20);
        List<FoodForCMS> result =foodMapper.selectFoodCMSListLikeString(storeid,searchString);

        //得到菜品名int转string对应map
        Map<Integer, String> catmap = getCatMap.getCatMap(storeid);
        if(result.size()==0){
            return new ResponseEntity(RespCode.SUCCESS,null);
        }
        for(FoodForCMS i:result){
            i.setCatname(catmap.get(i.getCatid()));
        }

        return new ResponseEntity(RespCode.SUCCESS,result);
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getStoreid() {
        return storeid;
    }

    public void setStoreid(Integer storeid) {
        this.storeid = storeid;
    }
}
