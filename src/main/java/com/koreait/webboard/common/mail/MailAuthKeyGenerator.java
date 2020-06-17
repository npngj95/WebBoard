package com.koreait.webboard.common.mail;

import java.util.Random;

public class MailAuthKeyGenerator {
	private final int keyCodeLength = 6;
	private final char[] charArray = {
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
			'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 
			'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
			};
	
	public String executeGenerate() {
		Random random = new Random();
		StringBuffer keyCodeBuffer = new StringBuffer();
		
		for(int i=0; i<keyCodeLength; i++) {
			keyCodeBuffer.append(charArray[random.nextInt(charArray.length)]);
		}
		
		return keyCodeBuffer.toString();
	}
	
}
