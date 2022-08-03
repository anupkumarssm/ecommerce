package com.learn.edu.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder; 
import org.springframework.security.crypto.password.PasswordEncoder; 

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
 
	@Autowired
	private DataSource dataSource;
	  @Autowired
	    PasswordEncoder passwordEncoder;
	 
	    @Override
	    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
	        auth.jdbcAuthentication()
            .dataSource(dataSource)
            .passwordEncoder(passwordEncoder())
            .authoritiesByUsernameQuery("SELECT username,role as authority FROM user_role where username=?")
            .usersByUsernameQuery("SELECT username,password,enabled FROM users where username=?");
	    }
	 
	    @Bean
	    public PasswordEncoder passwordEncoder() {
	        return new BCryptPasswordEncoder();
	    }
	 
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	        http.authorizeRequests()
	        .antMatchers("/","/products","/subproducts","/home","/add-new-user","/allUsers","/get-sub-category","/get-question-answer-by-sub-category","/check-answer","/get-answer","/validateUserName","/challenge","/challengecount","/challengetime").permitAll()
	        .antMatchers("/login")
	            .permitAll()
	        .antMatchers("/**")
	          .hasAnyRole("ADMIN", "USER") 
	        .and()
	            .formLogin()
	            .loginPage("/login")
	            .defaultSuccessUrl("/home")
	            .failureUrl("/login?error=true")
	            .permitAll()
	        .and()
	            .logout()
	            .logoutSuccessUrl("/home?logout=true")
	            .invalidateHttpSession(true)
	            .permitAll()
	        .and()
	            .csrf()
	            .disable();
	    }
	    
	    
	    
	    
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
}
