package com.fhd.bpm.webservice.soap.response.base;

import javax.xml.bind.annotation.XmlType;

import com.fhd.bpm.webservice.soap.WsConstants;

/**
 * 创建某个对象返回的 通用IdResult.
 * 
 * @author vincent
 */
@XmlType(name = "IdResult", namespace = WsConstants.NS)
public class IdResult extends WSResult {
	private String id;

	public IdResult() {
	}

	public IdResult(String id) {
		super();
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
