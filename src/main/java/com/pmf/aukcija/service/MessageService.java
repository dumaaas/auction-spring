package com.pmf.aukcija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pmf.aukcija.model.Message;
import com.pmf.aukcija.repository.MessageRepository;

@Service
public class MessageService {
	
	@Autowired 
	MessageRepository mr;
	
	public List<Message> getAllMessages() {
		return mr.findAll();
	}
	
	public void save(Message m) {
		mr.save(m);
	}
}
