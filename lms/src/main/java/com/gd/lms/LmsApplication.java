package com.gd.lms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;


@ServletComponentScan // 서블릿에서 사용하는 webServlet listener filter같은 것들 사용할수있게해줌
@SpringBootApplication // 이거때문에 모든걸 다 쓸 수 있음 BUT, 기존에 웹 서블릿과 리스너를 쓸수있는건 들어있지않아서 추가해줘야함ServletComponentScan
public class LmsApplication {

	public static void main(String[] args) {
		SpringApplication.run(LmsApplication.class, args);
	}

}
