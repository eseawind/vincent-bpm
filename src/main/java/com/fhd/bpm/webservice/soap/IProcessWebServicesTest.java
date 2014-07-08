package com.fhd.bpm.webservice.soap;

import java.util.ArrayList;
import java.util.List;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import com.fhd.bpm.webservice.soap.response.dto.TaskDto;

public class IProcessWebServicesTest {
	public static void main(String[] args) {
		JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
		factory.setServiceClass(IProcessWebService.class);
		factory.setAddress("http://127.0.0.1:8888/cxfservices/iprocesswebservice");
		IProcessWebService service = (IProcessWebService) factory.create();
		List<TaskDto> list = new ArrayList<TaskDto>();
		list = service.findUserTaskList("admin");
		System.out.println(list.toString());
	}
}
