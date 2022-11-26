package servlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import model.Entity;
import model.User;
import utility.DBUtilImpl;


public class EntityDaoImpl implements EntityDao {
	private Connection conn=null;
	private PreparedStatement pst=null;
	private ResultSet rs=null;
	/*
	 * 获取所有的实体信息，返回的是ArrayList数组形式
	 */
	public ArrayList<Entity> get_ListInfo(){
		ArrayList<Entity> entities = new ArrayList<Entity>();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		String sql = "select * from entity";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Entity tag = new Entity();
				tag.setEid(rs.getInt("eid"));
				tag.setName(rs.getString("name"));
				tag.setNum(rs.getInt("num"));
				tag.setMessage(rs.getString("message"));
				entities.add(tag);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return entities;
	}
	/*
	 * 获取实体信息的函数，根据传进来的eid，获取实体信息
	 */
	
	public Entity getEntityInfo(int eid) {
		Entity entity = new Entity();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		String sql = "select * from entity where eid = ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, eid);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				entity.setEid(rs.getInt("eid"));
				entity.setName(rs.getString("name"));
				entity.setNum(rs.getInt("num"));
				entity.setMessage(rs.getString("message"));
				System.out.println("查询成功");
			} else {
				System.out.println("查询失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return entity;
	}
	/*
	 * 获取实体信息的函数，根据传进来的eName，获取实体信息
	 */
	
	public Entity getEntityInfo(String name) {
		Entity entity = new Entity();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		String sql = "select * from entity where name = ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setString(1, name);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				entity.setEid(rs.getInt("eid"));
				entity.setName(rs.getString("name"));
				entity.setNum(rs.getInt("num"));
				entity.setMessage(rs.getString("message"));
				System.out.println("查询成功");
			} else {
				System.out.println("查询失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return entity;
	}
	
	/*
	 * 申请函数，根据传入eid，user当前登录用户的信息，在申请记录数据表中新插入一条记录
	 *
	 */
	public boolean applyEntity(int eid, User user) {
		boolean flag = false;
		Entity entity = this.getEntityInfo(eid);
		if (user.getNum() >= 4) {//拥有超过4个
			return false;
		}
		//生成日期功能
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		int day = c.get(Calendar.DATE);
		//生成申请时间
		String begintime = ""+ year +"-"+month +"-"+day;
		if (entity.getNum() == 0) {
			return false;
		}
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		
		String sql = "insert into record(u_name,eid,e_name,phone,begintime,priority) values(?,?,?,?,?,?)";
		String sql_alt="UPDATE entity t SET t.num = 0 WHERE t.eid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getName());//用户名
			pst.setInt(2, entity.getEid());//牌照序号
			pst.setString(3, entity.getName());//牌照名
			pst.setString(4, user.getPhone());//电话号码
			pst.setString(5, begintime);//申请时间
			pst.setInt(6, 1);//优先级
			
			pst.executeUpdate();
			//更新实体牌照表格
			pst = conn.prepareStatement(sql_alt);
			pst.setInt(1, entity.getEid());
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
	 * 撤销函数
	 */
	public boolean withDrawEntity(int eid) {
		boolean flag = false;
		Entity entity = this.getEntityInfo(eid);
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		
		String sql = "DELETE FROM record WHERE eid = ?";
		String sql_alt="UPDATE entity t SET t.num = 1 WHERE t.eid = ?";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, entity.getEid());
			pst.executeUpdate();
			//更新实体牌照表格
			pst = conn.prepareStatement(sql_alt);
			pst.setInt(1, entity.getEid());
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
	 * 更新牌照
	 */
	public boolean updateEntity(Entity entity, int o_eid) {
		boolean flag = false;
		
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		
		
//		if (this.getEntityInfo(entity.getEid()) != null) {//重复的序号
//			return false;
//		}
//		if (this.getEntityInfo(entity.getName()) != null) {//重复的名字
//			return false;
//		}
		
		
		String sql="UPDATE entity t SET t.eid = ?, t.name=?, t.num=?, t.message=? WHERE t.eid = ?";
		
		try {
			//更新实体牌照表格
			pst = conn.prepareStatement(sql);
			pst.setInt(1, entity.getEid());
			pst.setString(2, entity.getName());
			pst.setInt(3, entity.getNum());
			pst.setString(4, entity.getMessage());
			pst.setInt(5, o_eid);
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
	 * 查找车牌函数
	 */
	public ArrayList<Entity> search(String name) {
		ArrayList<Entity> entities = new ArrayList<Entity>();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		String sql = "select * from entity where name = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			rs = pst.executeQuery();
			while (rs.next()) {
				Entity tag = new Entity();
				tag.setEid(rs.getInt("eid"));
				tag.setName(rs.getString("name"));
				tag.setNum(rs.getInt("num"));
				tag.setMessage(rs.getString("message"));
				entities.add(tag);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return entities;
	}
	/*
	 * 添加牌照函数
	 */
	public boolean addEntity(Entity entity) {
		boolean flag = false;
		
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if(conn==null) return false;

		String sql="insert into entity(eid,name,num,message) values(?,?,?,?)";
		try {
			pst= conn.prepareStatement(sql);
			pst.setInt(1, entity.getEid());
			pst.setString(2, entity.getName());
			pst.setInt(3, entity.getNum());
			pst.setString(4, entity.getMessage());
			pst.executeUpdate();
			
			System.out.println("addEntity:插入成功");
			flag=true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		
		return flag;
	}
}
