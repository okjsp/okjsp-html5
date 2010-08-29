package kr.pe.okjsp.jersey.test;

import java.util.List;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "person")
public class Person {
    private String id = "";
    private String name = "";
    private List<Family> familyList = null;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Family> getFamilyList() {
		return familyList;
	}
	public void setFamilyList(List<Family> familyList) {
		this.familyList = familyList;
	}

    
    
}