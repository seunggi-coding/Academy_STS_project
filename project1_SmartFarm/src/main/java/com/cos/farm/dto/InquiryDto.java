package com.cos.farm.dto;

import java.sql.Timestamp;

import com.cos.farm.model.Inquirys;
import com.cos.farm.model.Users;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class InquiryDto {
    private int id;
    private int count;
    private Users users;
    private String title;
    private String content;
   private Timestamp createDate;
    public Inquirys toEntity(){
        Inquirys build = Inquirys.builder()
                .id(id)
                .users(users)
                .title(title)
                .content(content)
                .count(count)
                .build();
        return build;
    }
    @Builder
    public InquiryDto(int id, String title, String content, Users users, Timestamp createDate, int count){
        this.id = id;
        this.users = users;
        this.title = title;
        this.content = content;
        this.count = count;
        this.createDate = createDate;
    }
}