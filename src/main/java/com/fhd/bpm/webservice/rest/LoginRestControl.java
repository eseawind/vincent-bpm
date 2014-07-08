package com.fhd.bpm.webservice.rest;

import com.fhd.bpm.entity.SysUser;
import com.fhd.bpm.modules.mapper.BeanMapper;
import com.fhd.bpm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by vincent on 2014/6/10.
 */
@RestController
@RequestMapping(value = { "/api/v1", "/api/secure/v1" })
public class LoginRestControl {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
    public UserDTO getUser(@PathVariable("id") String id) {

        SysUser user = userService.getUser(id);

        if (user == null) {
            String message = "用户不存在(id:" + id + ")";
            throw new RestException(HttpStatus.NOT_FOUND, message);
        }

        // 使用Dozer转换DTO类，并补充Dozer不能自动绑定的属性
        UserDTO dto = BeanMapper.map(user, UserDTO.class);

        return dto;

    }

}
