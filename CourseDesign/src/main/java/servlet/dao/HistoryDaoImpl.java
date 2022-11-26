package servlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.History;

import utility.DBUtilImpl;

public class HistoryDaoImpl implements HistoryDao {
	private Connection conn=null;
	private PreparedStatement pst=null;
	private ResultSet rs=null;
	
	String sql_insert = "insert into history(realName,idNum,u_name,eid,e_name,phone,begintime) values(?,?,?,?,?,?,?)";
	String sql_query_user = "select * from history where u_name = ?";
	String sql_query = "select * from history";
	
	public boolean updateHistory(History history) {
		
		boolean flag = false;
				
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if (conn == null) {return false;}

		try {
			pst = conn.prepareStatement(sql_insert);
			pst.setString(1, history.getRealName());
			pst.setString(2, history.getIdNum());
			pst.setString(3, history.getU_name());
			pst.setInt(4, history.getEid());
			pst.setString(5, history.getE_name());
			pst.setString(6, history.getPhone());
			pst.setString(7, history.getBegintime());//申请时间
					
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
	 * 获取所有历史记录信息
	 */
	public ArrayList<History> get_ListInfoByAdmin() {
		ArrayList<History> history = new ArrayList<History>();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		
		try {
			pst = conn.prepareStatement(sql_query);
			
			rs = pst.executeQuery();
			while (rs.next()) {
				History tag = new History();
				tag.setRealName(rs.getString("realName"));
				tag.setIdNum(rs.getString("idNum"));
				tag.setU_name(rs.getString("u_name"));
				tag.setEid(rs.getInt("eid"));
				tag.setE_name(rs.getString("e_name"));
				tag.setPhone(rs.getString("phone"));
				tag.setBegintime(rs.getString("begintime"));
				history.add(tag);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return history;
	}
	/*
	 * 获取所有历史记录信息
	 */
	public ArrayList<History> get_ListUserInfo(String u_name) {
		ArrayList<History> history = new ArrayList<History>();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		
		try {
			pst = conn.prepareStatement(sql_query_user);
			pst.setString(1, u_name);
			rs = pst.executeQuery();
			while (rs.next()) {
				History tag = new History();
				tag.setRealName(rs.getString("realName"));
				tag.setIdNum(rs.getString("idNum"));
				tag.setU_name(rs.getString("u_name"));
				tag.setEid(rs.getInt("eid"));
				tag.setE_name(rs.getString("e_name"));
				tag.setPhone(rs.getString("phone"));
				tag.setBegintime(rs.getString("begintime"));
				history.add(tag);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return history;
	}
}
