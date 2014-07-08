package com.fhd.bpm.web;

import com.fhd.bpm.service.ProcessService;
import com.fhd.bpm.service.ShiroDbRealm;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by vincent on 2014/6/11.
 */
@Controller
@RequestMapping("/process/processDefinition")
public class ProcessDeploymentControl {

    @Autowired
    private ProcessService processService;

    @RequestMapping("/list")
    public String list(Model model) {
        model.addAttribute("processDefinitionList",processService.findProcessDefinitionList());
        return "process/definition-list";
    }

    @RequestMapping("/startProcess/{definitionId}")
    public String startProcess(@PathVariable("definitionId") String definitionId,RedirectAttributes redirectAttributes) {
        ShiroDbRealm.ShiroUser shiroUser =  (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        Map<String,Object> variables = new HashMap<String, Object>();
        variables.put("user",shiroUser.getUserId());
        String processInstanceId = processService.startProcessInstance(definitionId, variables);
        redirectAttributes.addFlashAttribute("message","启动成功，流程实例id=" + processInstanceId);
        return "redirect:/process/processDefinition/list";
    }

}
