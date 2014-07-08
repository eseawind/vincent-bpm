package com.fhd.bpm.web;

import com.fhd.bpm.service.ShiroDbRealm.ShiroUser;
import org.activiti.engine.TaskService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by vincent on 2014/6/28.
 */
@Controller
@RequestMapping("/dashboard")
public class DashboardControl {

    @Autowired
    private TaskService taskService;

    @ResponseBody
    @RequestMapping("/tasksSum")
    public Long tasksSum() {
        ShiroUser shiroUser =  (ShiroUser) SecurityUtils.getSubject().getPrincipal();
        Long sum = taskService.createTaskQuery().taskAssignee(shiroUser.getUserId()).count();
        return sum;
    }

}
