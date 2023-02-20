package com.cos.farm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.farm.model.Inquirys;
import com.cos.farm.model.Notices;
import com.cos.farm.service.InquiryService;
import com.cos.farm.service.NoticeService;

@Controller
public class BoardController {
   @Autowired
   private InquiryService inquiryService;

   @GetMapping("/")
   public String board_index(Model model,
         @PageableDefault(size = 5, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
      model.addAttribute("inquirys", inquiryService.글목록(pageable));
      model.addAttribute("notices", noticeService.Notice_글목록(pageable));
      return "index";
   }

   /* FAQs 게시판 */

   @GetMapping({ "/auth/inquiry" })
   public String inquiry_index(Model model,
         @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
      model.addAttribute("inquirys", inquiryService.글목록(pageable));
      return "board/inquiry_board";
   }

   @GetMapping("/inquiry/{id}/inquiry_board_updateForm")
   public String updateForm(@PathVariable int id, Model model) {
      model.addAttribute("inquirys", inquiryService.글상세보기(id));
      return "board/inquiry_board_updateForm";
   }

   @GetMapping("/inquiry/{id}")
   public String findById(@PathVariable int id, Model model) {
      model.addAttribute("inquirys", inquiryService.글상세보기(id));
      inquiryService.updateCount(id);
      model.addAttribute("reply", inquiryService.댓글(id));
      return "board/inquiry_board_detail";
   }

   @GetMapping({ "/inquiry_board_saveForm" })
   public String saveForm() {
      return "board/inquiry_board_saveForm";
   }

   @GetMapping("/auth/inquiry/search")
   public String search(@RequestParam(value = "keyword") String keyword, Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {

      Page<Inquirys> inquiryDtoList = inquiryService.searchPosts(keyword, pageable);
      model.addAttribute("keyword", keyword);
      model.addAttribute("inquiryList", inquiryDtoList);
      return "board/inquiry_board_search";
   }

   /* 공지사항 게시판 */
   @Autowired
   private NoticeService noticeService;

   @GetMapping({ "/auth/notice" })
   public String notice_index(Model model,
         @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
      model.addAttribute("notices", noticeService.Notice_글목록(pageable));
      return "board/notice_board";
   }

   @GetMapping("/notice/{id}/notice_board_updateForm")
   public String notice_updateForm(@PathVariable int id, Model model) {
      model.addAttribute("notices", noticeService.Notice_글상세보기(id));
      return "board/notice_board_updateForm";
   }

   @GetMapping("/notice/{id}")
   public String notice_findById(@PathVariable int id, Model model) {
      model.addAttribute("notices", noticeService.Notice_글상세보기(id));
      noticeService.updateCount(id);
      return "board/notice_board_detail";
   }

   @GetMapping({ "/notice_board_saveForm" })
   public String notice_saveForm() {
      return "board/notice_board_saveForm";
   }

   @GetMapping("/auth/notice/search")
   public String notice_search(@RequestParam(value = "keyword") String keyword, Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {
      
      Page<Notices> noticeDtoList = noticeService.searchPosts(keyword, pageable);
      
      model.addAttribute("keyword", keyword);
      model.addAttribute("noticeList", noticeDtoList);
      return "board/notice_board_search";

   }

   //crop_info
   @GetMapping("/crop")
   public String crop() {
      return "board/crop_info";
   }

   @GetMapping("/crop_detail")
   public String crop_detail() {
      return "board/crop_info_detail";
   }

   @GetMapping("/device")
   public String device() {
      return "layout/device";
   }

}