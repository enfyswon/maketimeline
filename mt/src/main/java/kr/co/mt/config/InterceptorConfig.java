package kr.co.mt.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import kr.co.mt.login.LoginCheckInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginCheckInterceptor())
		.addPathPatterns("/category*")
		.addPathPatterns("/category/*")
		.addPathPatterns("/plan*")
		.addPathPatterns("/plan/*")
		.addPathPatterns("/timeline*")
		.addPathPatterns("/timeline/*")
		.addPathPatterns("/memo/*")
		.addPathPatterns("/mypage/*")
		.excludePathPatterns("/timeline/search*");
	}
}
