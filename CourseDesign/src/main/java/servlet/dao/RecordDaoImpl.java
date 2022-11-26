package servlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.Entity;
import model.Record;
import utility.DBUtilImpl;

public class RecordDaoImpl implements RecordDao {
	private Connection conn=null;
	private PreparedStatement pst=null;
	private ResultSet rs=null;
	
	
	@Override
	public ArrayList<Record> get_ListInfo() {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*
	 * 用户级别的获取申请信息
	 */
	
	@Override
	public ArrayList<Record> get_ListInfoByUser(String userName) {
		ArrayList<Record> records = new ArrayList<Record>();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		String sql = "select * from record where u_name = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, userName);
			rs = pst.executeQuery();
			while (rs.next()) {
				Record tag = new Record();
				tag.setEid(rs.getInt("eid"));
				tag.setU_name(rs.getString("u_name"));
				tag.setE_name(rs.getString("e_name"));
				tag.setPhone(rs.getString("phone"));
				tag.setBegintime(rs.getString("begintime"));
				tag.setPriority(rs.getInt("priority"));
				records.add(tag);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return records;
	}
	
	/*
	 * 管理员级别的获取申请信息
	 */
	@Override
	public ArrayList<Record> get_ListInfoByAdmin() {
		ArrayList<Record> records = new ArrayList<Record>();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		String sql = "select * from record";
		try {
			pst = conn.prepareStatement(sql);
			
			rs = pst.executeQuery();
			while (rs.next()) {
				Record tag = new Record();
				tag.setEid(rs.getInt("eid"));
				tag.setU_name(rs.getString("u_name"));
				tag.setE_name(rs.getString("e_name"));
				tag.setPhone(rs.getString("phone"));
				tag.setBegintime(rs.getString("begintime"));
				tag.setPriority(rs.getInt("priority"));
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
	public Record getRecordInfo(int eid) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
