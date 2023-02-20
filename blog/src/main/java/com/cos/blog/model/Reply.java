package com.cos.blog.model;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name = "USER_SEQ_GENERATOR3"
	    , sequenceName = "USER_SEQ3"
	    , initialValue = 1
	    , allocationSize = 1
	)

//답변 테이블
public class Reply {
	@Id//기본키
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="USER_SEQ_GENERATOR3")
	private int id;
	@Column(nullable=false, length=200)
	private String content;
	@ManyToOne //여러개의 답변은 하나의 게시글에 존재
	@JoinColumn(name="boardsId")
	private Boards boards;
	@ManyToOne
	@JoinColumn(name="userId")
	private Users users;
	@CreationTimestamp 
	private Timestamp createDate;
}
