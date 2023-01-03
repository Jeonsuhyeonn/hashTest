package fileUpload;

public class pwFileDTO {
	
	private int idx;
	private String plainText;
	private String algorithm;
	private String MessageDigest;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getPlainText() {
		return plainText;
	}
	public void setPlainText(String plainText) {
		this.plainText = plainText;
	}
	public String getAlgorithm() {
		return algorithm;
	}
	public void setAlgorithm(String algorithm) {
		this.algorithm = algorithm;
	}
	public String getMessageDigest() {
		return MessageDigest;
	}
	public void setMessageDigest(String messageDigest) {
		MessageDigest = messageDigest;
	}
}
	
	