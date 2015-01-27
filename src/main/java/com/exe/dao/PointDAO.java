package com.exe.dao;

import java.util.List;

import com.exe.dto.PointDTO;
import org.mybatis.spring.SqlSessionTemplate;

public class PointDAO {

    private SqlSessionTemplate sessionTemplate;


    public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
        this.sessionTemplate = sessionTemplate;
    }

    public int ptMaxNum(){
        int result=0;

      result = sessionTemplate.selectOne("point.ptMaxNum");

        return result;
    }

    public void ptInsert(PointDTO dto){
        sessionTemplate.insert("point.ptInsert", dto);
    }

    public List<PointDTO> ptGetAll(String mbId){
        List<PointDTO> lists = sessionTemplate.selectList("point.ptGetAll",mbId);
        return lists;
    }

    public int ptGetSum(String mbId){
        return sessionTemplate.selectOne("point.ptMaxNum",mbId);
    }

}
