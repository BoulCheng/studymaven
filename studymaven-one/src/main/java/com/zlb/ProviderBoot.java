package com.zlb;

import org.apache.log4j.Logger;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ProviderBoot {

	private final Logger logger =  Logger.getLogger(getClass());

	@SuppressWarnings("resource")
	public void serverBoot() {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(new String[] {"spring/spring-config.xml"});
		context.start();
		logger.info("rental-service-meal ProviderBoot startup.");
		System.out.println("rental-service-meal ProviderBoot startup.");
		while(true){
			try {
				Thread.sleep(300000);
			} catch (InterruptedException e) {
			}
		}
	}

	public static void main(String[] args) {
		new ProviderBoot().serverBoot();
	}
	
}
