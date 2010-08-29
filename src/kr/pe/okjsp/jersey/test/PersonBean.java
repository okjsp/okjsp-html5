package kr.pe.okjsp.jersey.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import kr.pe.okjsp.BbsInfoBean;
import kr.pe.okjsp.ListHandler;


import com.sun.jersey.spi.resource.Singleton;

@Singleton
@Path("/person")
public class PersonBean {
	@GET
	@Path("/json")
	@Produces("application/json")
	public Person getPersonMessageJson() {
		return getPerson();
	}

	@GET
	@Path("/xml")
	@Produces("text/xml")
	public Person getPersonMessageXml() {
		return getPerson();
	}

	@GET
	@Path("/xmls")
	@Produces("text/xml")
	public List<Person> getPersonsMessageXml() {
		return getPersons();
	}
	
	@GET
	@Path("/text")
	@Produces("text/plain")
	public Person getPersonMessageTxt() {
		return getPerson();
	}


	private Person getPerson() {
		Person person = new Person();
		person.setId("123");
		person.setName("TEST");

		Family family = new Family();
		family.setName("ttt");
		family.setRelation("형");
		List<Family> familyList = new ArrayList<Family>();
		familyList.add(family);
		person.setFamilyList(familyList);

		return person;
	}
	
	private List<Person> getPersons() {
		
		List<Person> persons = new ArrayList<Person>();
		
		Person person = new Person();
		Family family = null;
		
		
		person = new Person();
		person.setId("123");
		person.setName("TEST");

		family = new Family();
		family.setName("ttt");
		family.setRelation("형");
		List<Family> familyList = new ArrayList<Family>();
		familyList.add(family);
		person.setFamilyList(familyList);
		
		persons.add(person);
		
		person = new Person();
		person.setId("1234");
		person.setName("TEST1");

		family = new Family();
		family.setName("ttt1");
		family.setRelation("동생");
		familyList = new ArrayList<Family>();
		familyList.add(family);
		person.setFamilyList(familyList);
		
		persons.add(person);
		
		return persons;
	}
	

}
