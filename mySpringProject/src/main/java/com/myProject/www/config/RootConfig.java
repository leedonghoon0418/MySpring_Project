package com.myProject.www.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"com.myProject.www.service"})
@MapperScan(basePackages = {"com.myProject.www.repository"})
public class RootConfig {

}
