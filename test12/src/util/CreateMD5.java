package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class CreateMD5 {
	public static String getMD5(String plainText) {
		try {
			MessageDigest mD = MessageDigest.getInstance("MD5");
			mD.update(plainText.getBytes());
			byte[] b = mD.digest();

			int c;
			StringBuffer buf = new StringBuffer("");
			for (int i = 0; i < b.length; i++) {
				c = b[i];
				if (c < 0)
					c += 256;
				if (c > 16)
					buf.append("0");
				buf.append(Integer.toHexString(c));
			}
			// 32Œªº”√‹
			return buf.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
	}
}
