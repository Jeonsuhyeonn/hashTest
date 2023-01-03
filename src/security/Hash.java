package security;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.bouncycastle.pqc.math.linearalgebra.ByteUtils;

public class Hash {
	public String getHash(String plainText, String algorithm) throws NoSuchAlgorithmException {
		Charset charset = Charset.forName("utf-8");
		MessageDigest md = MessageDigest.getInstance(algorithm);
		md.update(plainText.getBytes(charset));
		byte [] hash = md.digest();
		return ByteUtils.toHexString(hash);
		// return hash.toString();
	}
	public static void main(String[] args) throws NoSuchAlgorithmException {
		Hash h = new Hash();
		System.out.println("Hash : " + h.getHash("Hello World", "SHA-1"));
	}

}
