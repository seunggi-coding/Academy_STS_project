package com.cos.blog.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//ORAM -> 언어들의 Object를 테이블로 매핑해주는 기술

@Table(name="users")
@SequenceGenerator(
		name = "USER_SEQ_GENERATOR"
	    , sequenceName = "USER_SEQ"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder //빌더 패턴
@Entity //Users 클래스가 자동으로 DB에 테이블이 생성이 된다.
//@DynamicInsert //insert시에 null인 필드 제외
public class Users {
	@Id //primary key
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="USER_SEQ_GENERATOR")
	//프로젝트에 연결된 DB의 넘버링 전략을 사용
	private int id;//시퀀스
	
	@Column(nullable=false, length=30,unique = true)
	private String username;//아이디

	@Column(nullable=false, length=100)//해쉬로 변경하여 암호화 length 크게
	private String password; 
	
	@Column(nullable=false, length=50)
	private String email;
	
	//@ColumnDefault("'user'")
	@Enumerated(EnumType.STRING)
	private RoleType roles; //Enum을 쓰는게 좋다. //도메인 사용해야해서. 
	//예) admin, user, manager (권한) 셋 중 하나만 
	@CreationTimestamp //시간이 자동으로 입력
	private Timestamp createDate;
}
