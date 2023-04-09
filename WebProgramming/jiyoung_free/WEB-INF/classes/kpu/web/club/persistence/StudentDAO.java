package kpu.web.club.persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import kpu.web.club.domain.StudentVO;

public class StudentDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jspdb?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
	String message;
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "jspbook", "passwd");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public boolean add(StudentVO vo) {
		connect();
		String sql = "insert into reservation values (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getDate());
			pstmt.setString(4, vo.getTime());
			pstmt.setString(5, vo.getRoom());
			
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}
	
	public boolean login(StudentVO vo) {
		connect();
		String sql = "select * from kpuStudent where id=? and passwd=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPasswd());
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				if(vo.getId().equals(rs.getString("id")) && vo.getPasswd().equals(rs.getString("passwd"))) {
					return true;
				} 
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return false;
		
	}
	
	public ArrayList<StudentVO> getStudentList(){
		connect();
		ArrayList<StudentVO> studentlist = new ArrayList<StudentVO>();
		String sql = "select * from reservation";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				StudentVO vo = new StudentVO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("rname"));
				vo.setDate(rs.getString("rdate"));
				vo.setTime(rs.getString("rtime"));
				vo.setRoom(rs.getString("room"));
				studentlist.add(vo);
			}
			rs.close();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return studentlist;
	}

	public boolean update(StudentVO vo) {
		connect();
		String sql = "update reservation set rname=?, rtime=?, room=? where id=? and rdate=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getTime());
			pstmt.setString(3, vo.getRoom());
			pstmt.setString(4, vo.getId());
			pstmt.setString(5, vo.getDate());
			
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	public StudentVO read(String userID) {
		connect();
		StudentVO student = null;
		try {
			
			String sql = "select * from reservation where id='"+userID+"'";
			pstmt = conn.prepareStatement(sql);
			ResultSet nrs = pstmt.executeQuery();
			while(nrs.next()) {
				student = new StudentVO();
				student.setId(nrs.getString("id"));
				student.setName(nrs.getString("rname"));
				student.setDate(nrs.getString("rdate"));
				student.setTime(nrs.getString("rtime"));
				student.setRoom(nrs.getString("room"));
			}
			
			nrs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return student;
		
	}
	public StudentVO readUser(String userID) {
		connect();
		StudentVO student = null;
		try {
			
			String sql = "select * from kpuStudent where id='"+userID+"'";
			pstmt = conn.prepareStatement(sql);
			ResultSet nrs = pstmt.executeQuery();
			while(nrs.next()) {
				student = new StudentVO();
				student.setId(nrs.getString("id"));
				student.setName(nrs.getString("kpuName"));
			}
			
			nrs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return student;
		
	}
	public StudentVO readReser(String userID, String userDate) {
		connect();
		StudentVO student = null;
		try {
			
			String sql = "select * from reservation where id='"+userID+"'and rdate='"+userDate+"'";
			pstmt = conn.prepareStatement(sql);
			ResultSet nrs = pstmt.executeQuery();
			while(nrs.next()) {
				student = new StudentVO();
				student.setId(nrs.getString("id"));
				student.setName(nrs.getString("rname"));
				student.setDate(nrs.getString("rdate"));
				student.setTime(nrs.getString("rtime"));
				student.setRoom(nrs.getString("room"));
			}
			
			nrs.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return student;
		
	}
	public boolean delete(StudentVO vo) {
		connect();
		
		String sql = "delete from reservation where id=? and rdate=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getDate());
			
			System.out.println(pstmt);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

}
