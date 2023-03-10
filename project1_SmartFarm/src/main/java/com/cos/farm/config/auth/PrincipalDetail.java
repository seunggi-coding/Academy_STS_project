package com.cos.farm.config.auth;


import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.cos.farm.model.Users;

import lombok.Getter;
@Getter
public class PrincipalDetail implements UserDetails{
   private Users user;

   public String getUserName(){ return  user.getUsername();}
   public String getEmail(){
      return user.getEmail();
   }
   public int getId(){
      return user.getId();
   }
   public String getPhonenumber(){
      return user.getPhonenumber();
   }

   public PrincipalDetail(Users user) {
      this.user=user;
   }
   //계정이 갖고있는 권한목록 리턴(권한이 여러개면 루프를 돌려야함)
   @Override
   public Collection<? extends GrantedAuthority> getAuthorities() {
      Collection<GrantedAuthority> collectors = new ArrayList<>();
      collectors.add(()->{return "ROLE_"+user.getRoles();});
      return collectors;
   }

   @Override
   public String getPassword() {
      return user.getPassword();
   }

   @Override
   public String getUsername() {
      return user.getUsername();
   }
   
   //계정이 잠겨있지 않았는지 리턴(true 잠기지 않음)
   @Override
   public boolean isAccountNonLocked() {
      return true;
   }
   
   //비밀번호가 만료되지 않았는지 리턴(true 만료안됨)
   @Override
   public boolean isCredentialsNonExpired() {
      return true;
   }

   //계정이 활성화 되어있는지 리턴(true 활성화)
   @Override
   public boolean isEnabled() {
      return true;
   }

   //계정이 만료되지 않았는지 리턴(true 만료안됨)
   @Override
   public boolean isAccountNonExpired() {
      return true;
   }

}