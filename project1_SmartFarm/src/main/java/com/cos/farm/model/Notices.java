package com.cos.farm.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name = "notices")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(name = "USER_SEQ_GENERATOR4", sequenceName = "USER_SEQ4", initialValue = 1, allocationSize = 1)

public class Notices {
   @Id
   @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "USER_SEQ_GENERATOR4")
   private int id;

   @Column(nullable = false, length = 100)
   private String title;

   @Lob
   private String content;

   private int count;

   @ManyToOne(fetch = FetchType.EAGER)
   @JoinColumn(name = "userid")
   private Users users;

   @CreationTimestamp
   private Timestamp createDate;
}