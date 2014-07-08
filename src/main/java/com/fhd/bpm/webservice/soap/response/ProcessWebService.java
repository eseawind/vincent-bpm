package com.fhd.bpm.webservice.soap.response;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import com.fhd.bpm.service.ProcessService;
import com.fhd.bpm.webservice.soap.IProcessWebService;
import com.fhd.bpm.webservice.soap.response.dto.TaskDto;

public class ProcessWebService implements IProcessWebService {
	@Autowired
	protected ProcessService processService; // 流程服务
	
	@Override
	public List<TaskDto> findUserTaskList(String userId) {
		return processService.findUserTaskList(userId);
	}

	@Override
	public String startProcessInstance(String processKey,Map<String, Object> processVars) {
		return processService.startProcessInstance(processKey, processVars);
	}

	@Override
	public void doProcessInstance(String taskId, Map<String, Object> processVars) {
		processService.doProcessInstance(taskId, processVars);
	}
}
