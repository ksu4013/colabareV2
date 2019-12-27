package cot.colabare.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberTests {

	@Setter(onMethod_=@Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_=@Autowired)
	private javax.sql.DataSource ds;
	
	@Test
	public void testInsertMember(){
		
		String sql="insert into user_tbl (userid,userpw,employee_no,enabled) values(?,?,?,?)";
		Connection con=null;
		PreparedStatement pstmt=null;
		
		try {
			con=ds.getConnection();
			pstmt=con.prepareStatement(sql);
			
			
			pstmt.setString(1, "mgs");
			pstmt.setInt(3, 0);
			pstmt.setString(4, "1");
			pstmt.setString(2, pwencoder.encode("1234"));
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(pstmt!=null){
			try {
				pstmt.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
	
}
