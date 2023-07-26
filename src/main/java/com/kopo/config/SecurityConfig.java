//package com.kopo.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//    	http
//        .authorizeRequests()
//            .antMatchers("/login").permitAll()
//            .antMatchers("/webtoons/list").hasAuthority("ADMIN")
//            .anyRequest().permitAll()
//            .and()
//        .formLogin()
//            .loginPage("/login")
//            .defaultSuccessUrl("/list")
//            .permitAll()
//            .and()
//        .logout()
//            .logoutUrl("/logout")
//            .logoutSuccessUrl("/list")
//            .permitAll();
//    }
//    
//    // UserDetailsService, PasswordEncoder 등의 설정도 추가할 수 있습니다.
//    // ... 다른 설정 옵션들 ...
//}

