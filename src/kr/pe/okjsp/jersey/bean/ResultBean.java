/*
 * 
 *
 */
package kr.pe.okjsp.jersey.bean;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author  kenu
 */
@XmlRootElement(name = "resultbean")
public class ResultBean {

	private String result = "false";

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	

}
