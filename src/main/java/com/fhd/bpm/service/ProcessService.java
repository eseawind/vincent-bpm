package com.fhd.bpm.service;

import com.fhd.bpm.webservice.soap.response.dto.TaskDto;
import org.activiti.engine.FormService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProcessService {

	// 定义流程定义的缓存变量
	protected static Map<String, ProcessDefinition> PROCESS_DEFINITION_CACHE = new HashMap<String, ProcessDefinition>();
		
	@Autowired
	protected RepositoryService repositoryService;
	
	@Autowired
	protected RuntimeService runtimeService;
	
	@Autowired
	protected FormService formService; // 表单服务

	@Autowired
	protected TaskService taskService; // 任务服务
	
	/**
	 * 查询待办列表
	 * @param userId		用户id
	 * @return
	 */
	public List<TaskDto> findUserTaskList(String userId) {
		List<TaskDto> resultList = new ArrayList<TaskDto>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		// 已经签收的任务
		List<Task> todoList = taskService.createTaskQuery().taskAssignee(userId).active().list();
		for (Task task : todoList) {
			String processDefinitionId = task.getProcessDefinitionId();// 流程定义id
			ProcessDefinition processDefinition = getProcessDefinition(processDefinitionId);

			String processInstanceId = task.getProcessInstanceId(); // 流程实例id
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).active().singleResult();
			String businessId = processInstance.getBusinessKey();
			String executionId = task.getExecutionId(); // 执行id
			String form = formService.getTaskFormData(task.getId()).getFormKey();// 表单引用

			// 封装
			TaskDto taskDto = new TaskDto();
			taskDto.setTaskId(task.getId());
			taskDto.setExecutionId(executionId);
			taskDto.setInstanceId(processInstanceId);
			taskDto.setBusinessId(businessId);
			taskDto.setProcessName(processDefinition.getName());
			taskDto.setActivityName(task.getName());
			taskDto.setCreateDate(sdf.format(task.getCreateTime()));
			taskDto.setForm(form);
			taskDto.setActivityName(task.getAssignee());
			resultList.add(taskDto);
		}

		// 等待签收的任务
		List<Task> toClaimList = taskService.createTaskQuery().taskCandidateUser(userId).active().list();
		for (Task task : toClaimList) {
			String processDefinitionId = task.getProcessDefinitionId();
			ProcessDefinition processDefinition = getProcessDefinition(processDefinitionId);

			String processInstanceId = task.getProcessInstanceId(); // 流程实例id
			ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).active().singleResult();
			String businessId = processInstance.getBusinessKey();
			String executionId = task.getExecutionId(); // 执行id
			String form = formService.getTaskFormData(task.getId()).getFormKey();// 表单引用

			// 封装
			TaskDto taskDto = new TaskDto();
			taskDto.setTaskId(task.getId());
			taskDto.setExecutionId(executionId);
			taskDto.setInstanceId(processInstanceId);
			taskDto.setBusinessId(businessId);
			taskDto.setProcessName(processDefinition.getName());
			taskDto.setActivityName(task.getName());
			taskDto.setCreateDate(sdf.format(task.getCreateTime()));
			taskDto.setForm(form);
			taskDto.setActivityName(task.getAssignee());
			resultList.add(taskDto);
		}

		return resultList;
	}

	/**
	 * 开启一个流程实例
	 * @param deployId	流程定义id
	 * @param processVars	流程变量
	 */
	public String startProcessInstance(String deployId,
			Map<String, Object> processVars) {
		ProcessInstance processInstance = runtimeService.startProcessInstanceById(deployId, processVars);
		return processInstance.getId();
	}

	/**
	 * 执行流程任务
	 * @param taskId		任务id
	 * @param processVars	流程变量
	 */
	public void doProcessInstance(String taskId, Map<String, Object> processVars) {
		taskService.complete(taskId, processVars);
	}
	
	/**
	 * 根据流程定义id,得到流程定义
	 * 
	 * @param processDefinitionId 流程定义ID
	 * @return ProcessDefinition
	 */
	private ProcessDefinition getProcessDefinition(String processDefinitionId) {
		ProcessDefinition processDefinition = PROCESS_DEFINITION_CACHE.get(processDefinitionId);
		if (processDefinition == null) {
			processDefinition = repositoryService.createProcessDefinitionQuery().processDefinitionId(processDefinitionId).singleResult();
			PROCESS_DEFINITION_CACHE.put(processDefinitionId, processDefinition);
		}
		return processDefinition;
	}

    public List<ProcessDefinition> findProcessDefinitionList() {
        return repositoryService.createProcessDefinitionQuery().list();
    }

}
