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
import com.cos.farm.model.Inquirys;
import com.cos.farm.model.Reply;
import com.cos.farm.service.InquiryService;

@RestController
public class InquiryApiController {
   
   @Autowired
   private InquiryService inquiryService;
   
   @PostMapping("/api/inquiry")
   public ResponseDto<Integer> save(@RequestBody Inquirys inquiry, @AuthenticationPrincipal PrincipalDetail principal) {
      inquiryService.글쓰기(inquiry,principal.getUser());
      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
   }
   @DeleteMapping("/api/inquiry/{id}")
   public ResponseDto<Integer> deleteById(@PathVariable int id){
      inquiryService.글삭제하기(id);
      return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
   }
   @PutMapping("/api/inquiry/{id}")
   public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Inquirys inquiry){
      inquiryService.글수정하기(id,inquiry);
      return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
   }
   
   @PostMapping("/api/inquiry/reply/{id}")
   public ResponseDto<Integer> reply_save(@PathVariable int id,@AuthenticationPrincipal PrincipalDetail principal, @RequestBody Reply reply) {
      inquiryService.댓글쓰기(id,principal.getUser(), reply);
      return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
   }
}