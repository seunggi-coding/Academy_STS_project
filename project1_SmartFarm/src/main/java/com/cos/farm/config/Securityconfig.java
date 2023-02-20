package com.cos.farm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.cos.farm.config.auth.PrincipalDetailService;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration // 빈등록(Ioc관리)
@EnableWebSecurity // 시큐리티 필터가 등록된다. (설정을 여기서)
@EnableGlobalMethodSecurity(prePostEnabled = true) // 특정 주소로 접근을 하면 권한 및 인증을 미리 체크하겠다는 의미
public class Securityconfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private PrincipalDetailService principalDetailService;

	public Securityconfig(AuthenticationFailureHandler customFailureHandler) {
		this.customFailureHandler = customFailureHandler;
	}

	@Bean // IoC가 된다.
	public BCryptPasswordEncoder encodePWD() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		System.out.println("로그인 패스워드 인코더 호출");
		auth.userDetailsService(principalDetailService).passwordEncoder(encodePWD());
	}
	//로그인 실패 핸들러 의존성 주입 !
	private final AuthenticationFailureHandler customFailureHandler;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable() // csrf토큰 비활성화
				.authorizeRequests()
				.antMatchers("/", "/auth/**", "/js/**", "/css/**", "/image/**", "/dummy/**", "/video/**").permitAll()
				.anyRequest()// 이게 아닌 다른 모든 요청은
				.authenticated()// 인증이 필요
				.and().formLogin().loginPage("/auth/loginForm").loginProcessingUrl("/auth/loginProc")
				.defaultSuccessUrl("/")
                .failureHandler(customFailureHandler);

		http.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/");

	}



	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
}
