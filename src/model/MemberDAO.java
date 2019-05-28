package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberDAO {
	
	String userId = "root";
	String userPwd = "111111";
	/* in the recent version of tomcat server, we need to put ?serverTimezone=UTC to url */
	String url="jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC";
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	
	public void getConnection() {
		try {
			/* Declare using mysql database "com.mysql.jdbc.Driver"
			Declare for using oracle database "oracle.jdbc.driver.OracleDriver" */
			Class.forName("com.mysql.jdbc.Driver");
			
			/* Access the DB*/
			con = DriverManager.getConnection(url, userId, userPwd);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertMember(MemberBean mbean) {
		try {
			getConnection();
			
			// preparing sql and setting for using query.
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			
			// in order
			ps.setString(1, mbean.getId());
			ps.setString(2, mbean.getPwd());
			ps.setString(3, mbean.getEmail());
			ps.setString(4, mbean.getTel());
			ps.setString(5, mbean.getHobby());
			ps.setString(6, mbean.getJob());
			ps.setString(7, mbean.getAge());
			ps.setString(8, mbean.getComment());
			
			// when insert, update, delete, we use this executeUpdate()
			ps.executeUpdate(); 
			
			// close the db, if not, we can not avoid waste of memory. 
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Vector<MemberBean> selectAllMember() {
		//가변길이의 자료를 가져오기 때문에 벡터 사용. 
		Vector<MemberBean> v = new Vector<>();
		
		// we need to use always try catch for I/O, database, thread, network
		try {
			getConnection();
			String sql = "select * from member";
			ps = con.prepareStatement(sql);

			// the result after query need to be saved
			rs = ps.executeQuery();
			
			// Using loop, we need to extract all the data;
			while(rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString(1));
				bean.setPwd(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setComment(rs.getString(8));
				
				v.add(bean);
			}
			
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return v;
	}
	
	public MemberBean selectOneMember(String id) {

		MemberBean bean = new MemberBean();
		
		try {
			getConnection();
			String sql = "select * from member where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,id);
			
			// the result after query need to be saved
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bean.setId(rs.getString(1));
				bean.setPwd(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
				bean.setHobby(rs.getString(5));
				bean.setJob(rs.getString(6));
				bean.setAge(rs.getString(7));
				bean.setComment(rs.getString(8));
			}
			
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	
	public String getPwd(String id) {
		String pwd = "";
		
		try {
			getConnection();
			String sql = "select pwd from member where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				pwd = rs.getString(1);
			}
			
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return pwd;
		
	}
	
	public void updateMember(MemberBean mbean) {
		try {
			getConnection();
			
			String sql = "update member set email=?, tel=? where id=?";
			ps = con.prepareStatement(sql);
			
			// in order
			ps.setString(1, mbean.getEmail());
			ps.setString(2, mbean.getTel());
			ps.setString(3, mbean.getId());
			
			
			// when insert, update, delete, we use this executeUpdate()
			ps.executeUpdate(); 
			
			// close the db, if not, we can not avoid waste of memory. 
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteMember(String id) {
		try {
			getConnection();
			String sql = "delete from member where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			
			ps.executeUpdate();
			
			con.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	
	
	

}
