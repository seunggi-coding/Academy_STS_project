package com.cos.farm.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "reply")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@SequenceGenerator(
      name = "USER_SEQ_GENERATOR3",
      sequenceName = "USER_SEQ3",
      initialValue = 1,
      allocationSize = 1
   )
@Entity

public class Reply {
   @Id
   @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "USER_SEQ_GENERATOR3")
   private int id;
   
   @Column(nullable = false, length = 200)
   private String content;
   
   @ManyToOne
   @JoinColumn(name = "inquirysId")
   private Inquirys inquirys;
   
   @ManyToOne(fetch = FetchType.EAGER)
   @JoinColumn(name = "userid")
   private Users users;
   
   @CreationTimestamp
   private Timestamp createDate;
}