package fileUpload;

import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;

public class MyFileDAO extends JDBConnect{
	
	public void insertFile(MyFileDTO dto) {
		try {
			String sql = "insert into st20224012(idx, name, title, cate, ofile, sfile)";
			sql += "values ((select nvl(max(idx), 0) + 1 from myfile), ? ,? ,? ,?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getCate());
			pstmt.setString(4, dto.getOfile());
			pstmt.setString(5, dto.getSfile());
			pstmt.executeUpdate();
			
			System.out.println("insertFile() is finished");
		} catch (Exception e) {
			System.out.println("Exception[insertFile] : " + e.getMessage());
		}
	}
	
	public List<MyFileDTO> myFileList() {
		
		List<MyFileDTO> myList = new ArrayList<MyFileDTO>();
		
		try {
			String sql = "select * from st20224012";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				
				myList.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Exception[listFile] : " + e.getMessage());
		}
		
		return myList;
	}
}