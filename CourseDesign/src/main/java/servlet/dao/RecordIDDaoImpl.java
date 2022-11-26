package servlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Entity;
import model.RecordID;
import utility.DBUtilImpl;

public class RecordIDDaoImpl implements RecordIDDao {
	
	private Connection conn=null;
	private PreparedStatement pst=null;
	private ResultSet rs=null;
	
	String sql_query_user = "select * from recordID where name = ?";

	@Override
	public ArrayList<RecordID> get_ListInfoByAdmin() {
		ArrayList<RecordID> records = new ArrayList<RecordID>();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		String sql = "select * from recordID";
		try {
			pst = conn.prepareStatement(sql);
			
			rs = pst.executeQuery();
			while (rs.next()) {
				RecordID tag = new RecordID();
				tag.setRealName(rs.getString("realName"));
				tag.setIdNum(rs.getString("idNum"));
				tag.setName(rs.getString("name"));
				tag.setPhone(rs.getString("phone"));
				tag.setBegintime(rs.getString("begintime"));
				records.add(tag);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return records;
	}

	@Override
	public boolean withdrawAutonym(String name) {
		boolean flag = false;
		
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		
		String sql = "DELETE FROM recordID WHERE name = ?";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		
		return flag;
	}
	/*
	 * 查询某个用户名的实名申请
	 */
	public ArrayList<RecordID> get_ListInfoUser(String name) {
		ArrayList<RecordID> records = new ArrayList<RecordID>();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		
		try {
			pst = conn.prepareStatement(sql_query_user);
			pst.setString(1, name);
			rs = pst.executeQuery();
			while (rs.next()) {
				RecordID tag = new RecordID();
				tag.setRealName(rs.getString("realName"));
				tag.setIdNum(rs.getString("idNum"));
				tag.setName(rs.getString("name"));
				tag.setPhone(rs.getString("phone"));
				tag.setBegintime(rs.getString("begintime"));
				records.add(tag);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return records;
	}
}
