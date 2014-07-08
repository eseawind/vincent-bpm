package com.fhd.bpm.service;

import com.fhd.bpm.entity.SysUser;
import com.fhd.bpm.repository.jpa.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by vincent on 2014/5/29.
 */
@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public SysUser login(String username){
        return userDao.findByUsername(username);
    }

    public SysUser getUser(String id) {
        return userDao.findOne(id);
    }

}
