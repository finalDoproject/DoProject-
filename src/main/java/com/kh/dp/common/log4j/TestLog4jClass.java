package com.kh.dp.common.log4j;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TestLog4jClass {
	
	// apache 에서 제공하는 로그 객체
	//private Logger logger = Logger.getLogger(TestLog4jClass.class);
	
	// slf4j 에서 제공하는 로그 객체
	private Logger logger = LoggerFactory.getLogger(TestLog4jClass.class);
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		new TestLog4jClass().test2();

	}
	
	public void test2() {
		logger.error("에러 로그 실행 확인");
		logger.warn("경고 로그 샐행 확인");
		logger.info("안내 로그 샐행 확인");
		logger.debug("대버그 로그 샐행 확인");
		logger.trace("디버그 전용 실행 문장 출력 내용 확인");
	}

}
