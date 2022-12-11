package com.gdu.sporters.users.util;

import java.security.MessageDigest;
import java.security.SecureRandom;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Component;

@Component
public class SecurityUtil {

	// 크로스 사이트 스크립팅 방지
	public String preventXSS(String str) {
		str = str.replace("<", "&lt;");
		str = str.replace(">", "&gt;");
		str = str.replace("\"","&quot;");
		str = str.replace("\'", "&#x27;");
		return str;
	}
	
	// SHA-256 암호화
	public String sha256(String str) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(str.getBytes());
		} catch (Exception e) {
			e.printStackTrace();
		}
		byte[] b = md.digest();
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < b.length; i++) {
			sb.append(String.format("%2X", b[i]));
		}
		return sb.toString();
	}
	
	private SecureRandom secureRandom = new SecureRandom();
	
	public String getAuthCode(int length) {
		StringBuilder sb = new StringBuilder();
		for(int cnt = 0; cnt < length; cnt++) {
			if(secureRandom.nextDouble() < 0.5) {
				sb.append((char)(secureRandom.nextInt(10) + '0'));
			} else {
				sb.append((char)(secureRandom.nextInt(26) + 'A'));
			}
		}
		return sb.toString();
	}
	
	public static String generateRandomString(int length) {
		boolean useLetter = true;
		boolean useNumbers = true;
		return RandomStringUtils.random(length, useLetter, useNumbers);
	}
	
	public static String encodeBase64(String str) {
		return new String(Base64.encodeBase64(str.getBytes()));
	}
	
	public static String decodeBase64(String str) {
		return new String(Base64.decodeBase64(str.getBytes()));
	}
	
	
}
