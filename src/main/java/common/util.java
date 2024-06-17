/**
 * 팀 별빛, Software License, Version 1.0
 *
 * Copyright (c) 팀 별빛, All rights reserved.
 */
package common;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * Description : 클래스에 대한 설명을 입력해주세요.
 * Date : 2024. 6. 17.
 * History :
 *  - 작성자 : Jin, 날짜 : 2024. 6. 17., 설명 : 최초작성
 *
 * @author : Jin 
 * @version 1.0 
 */
public class util {
	
    /** 
     * @Method Name  : 패스워드 암호화 
     * @date : 2024. 6. 17. 
     * @author : Jin 
     * @version : 
     * @Method info : 암호화.
     * @param password input
     * @return 암호화된 password.
     * @throws Exception 
     */ 
	public static String getSHA512(String input){
		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%064x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toReturn;
	}
}
