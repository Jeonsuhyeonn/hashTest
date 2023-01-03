package fileUpload;

import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class pwFileDAO extends JDBConnect{
	
	public void insertFile(pwFileDTO dto) {
		try {
			String sql = "insert into pw(plainText, algorithm, MessageDigest)";
			sql += "values ((select nvl(max(idx), 0) + 1 from pw), ? ,? ,? ,?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPlainText());
			pstmt.setString(2, dto.getAlgorithm());
			pstmt.setString(3, dto.getMessageDigest());
			
			System.out.println("insertFile() is finished");
		} catch (Exception e) {
			System.out.println("Exception[insertFile] : " + e.getMessage());
		}
	}
	
	public List<pwFileDTO> pwList() {
		
		List<pwFileDTO> myList = new ArrayList<pwFileDTO>();
		
		try {
			String sql = "select * from pw";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pwFileDTO dto = new pwFileDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setPlainText(rs.getString("PlainText"));
				dto.setAlgorithm(rs.getString("Algorithm"));
				dto.setMessageDigest(rs.getString("MessageDigest"));
				
				myList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception[listFile] : " + e.getMessage());
		}
		
		return myList;
	}
}