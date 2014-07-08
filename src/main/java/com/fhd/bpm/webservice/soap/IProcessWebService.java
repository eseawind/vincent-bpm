package com.fhd.bpm.webservice.soap;

import java.util.List;
import java.util.Map;

import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

import com.fhd.bpm.webservice.soap.response.dto.TaskDto;

/**
 * 工作流对外接口
 * @author zhengjunxiang
 *
 */
@WebService
@SOAPBinding(style = Style.RPC)
public interface IProcessWebService {

	/**
	 * 获取待办列表
	 * @param taskDto
	 * @return
	 */
	public List<TaskDto> findUserTaskList(String userId);
	
	/**
	 * 开启一个流程实例
	 * @param processKey	流程定义id
	 * @param processVars	流程变量
	 * @return 				流程实例id
	 */
	public String startProcessInstance(String processKey,Map<String,Object> processVars);

	/**
	 * 执行流程任务
	 * @param taskId		任务id
	 * @param processVars	流程变量
	 */
	public void doProcessInstance(String taskId,Map<String,Object> processVars);
}
