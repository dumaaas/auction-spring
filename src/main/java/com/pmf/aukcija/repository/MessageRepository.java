package com.pmf.aukcija.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pmf.aukcija.model.Message;

public interface MessageRepository extends JpaRepository<Message, Integer> {

}
