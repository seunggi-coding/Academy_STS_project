package com.cos.farm.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.farm.config.auth.PrincipalDetail;
import com.cos.farm.dto.ResponseDto;
import com.cos.farm.model.Notices;
import com.cos.farm.service.NoticeService;

@RestController
public class NoticeApiController {

   @Autowired
   private NoticeService noticeService;
   
   @PostMapping("/api/notice")
   public ResponseDto<Integer> Notice_save(@RequestBody Notices notice, @AuthenticationPrincipal PrincipalDetail principal) {
      noticeService.Notice_글쓰기(notice,principal.getUser());
      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
   }
   @DeleteMapping("/api/notice/{id}")
   public ResponseDto<Integer> Notice_deleteById(@PathVariable int id){
      noticeService.Notice_글삭제하기(id);
      return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
   }
   @PutMapping("/api/notice/{id}")
   public ResponseDto<Integer> Notice_update(@PathVariable int id, @RequestBody Notices notice){
      noticeService.Notice_글수정하기(id,notice);
      return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
   }
}