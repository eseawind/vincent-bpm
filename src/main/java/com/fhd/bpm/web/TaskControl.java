package com.fhd.bpm.web;

/**
 * Created by vincent on 2014/5/29.
 */

import com.fhd.bpm.service.ProcessService;
import com.fhd.bpm.service.ShiroDbRealm.ShiroUser;
import com.fhd.bpm.webservice.soap.response.dto.TaskDto;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;


@Controller
@RequestMapping("/task")
public class TaskControl {

    @Autowired
    private ProcessService processService;

    @RequestMapping("list")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView("task/list");
        ShiroUser shiroUser =  (ShiroUser)SecurityUtils.getSubject().getPrincipal();
        List<TaskDto> tasks = processService.findUserTaskList(shiroUser.getUserId());
        mav.addObject("list",tasks);
        return mav;
    }

}
