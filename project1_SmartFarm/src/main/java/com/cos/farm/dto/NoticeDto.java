package com.cos.farm.dto;

import java.sql.Timestamp;

import com.cos.farm.model.Notices;
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
public class NoticeDto {
    private int id;
    private int count;
    private Users users;
    private String title;
    private String content;
   private Timestamp createDate;
    public Notices toEntity(){
        Notices build = Notices.builder()
                .id(id)
                .users(users)
                .title(title)
                .content(content)
                .count(count)
                .build();
        return build;
    }
    @Builder
    public NoticeDto(int id, String title, String content, Users users, Timestamp createDate, int count){
        this.id = id;
        this.users = users;
        this.title = title;
        this.content = content;
        this.count = count;
        this.createDate = createDate;
    }
}