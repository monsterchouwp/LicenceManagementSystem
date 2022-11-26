package servlet.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;

import model.User;
import utility.DBUtilImpl;
import model.Entity;
import model.History;

public class UserDaoImpl implements UserDao {
	private Connection conn=null;
	private PreparedStatement pst=null;
	private ResultSet rs=null;
	
	String sql_query_users = "select * from admin where priority != 0";
	
	@Override
	public ArrayList<User> get_ListInfoUser() {
		ArrayList<User> users = new ArrayList<User>();
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		
		ArrayList<String> names = new ArrayList<String>();
		try {
			pst = conn.prepareStatement(sql_query_users);
			rs = pst.executeQuery();
			while (rs.next()) {
				String name = rs.getString("name");
				names.add(name);
			}
			
			for (int i = 0; i < names.size(); ++i) {
				users.add(this.getUserWholeInfo(names.get(i), " "));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return users;
	}

	@Override
	public boolean login(String userName, String password) {//登录
		boolean flag=false;
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if(conn==null) return false;

		String sql="SELECT * FROM admin WHERE name=? and password=?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setString(1, userName);
			pst.setString(2, password);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				System.out.println("查询成功");
				flag=true;
			} else {
				flag=false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return flag;
	}
	
	@Override
	public boolean register(String userName, String password, String phone) {//注册
		boolean flag=false;
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if(conn==null) return false;

		String sql="insert into admin(name,password,phone,priority) values(?,?,?,?)";
		try {
			pst= conn.prepareStatement(sql);
			pst.setString(1, userName);
			pst.setString(2, password);
			pst.setString(3, phone);
			pst.setInt(4, 1);
			pst.executeUpdate();
			
			System.out.println("插入成功");
			flag=true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return flag;
	}
	/*
	 * 根据传入的账号，密码，来查找对应的读者信息，返回一个User类型，
	 */
	@Override
	public User getUserInfo(String userName, String password) {
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if(conn==null) return null;
		User user = new User(userName, password);
		String sql="SELECT * FROM admin WHERE name= ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setString(1, userName);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				user.setPhone(rs.getString("phone"));
				user.setPriority(rs.getInt("priority"));
				System.out.println("查询成功");
			} else {
				System.out.println("查询失败");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return user;
	}
	/*
	 * 根据传入的账号，密码，来查找对应的读者信息，返回一个User类型，
	 */
	@Override
	public User getUserWholeInfo(String userName, String password) {
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if(conn==null) return null;
		User user = new User(userName, password);
		String sql="SELECT * FROM admin WHERE name= ?";
		try {
			pst= conn.prepareStatement(sql);
			pst.setString(1, userName);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setPriority(rs.getInt("priority"));
				user.setNum(rs.getInt("num"));
				user.setAddress(rs.getString("address"));
				/*
				 * 获取对应号码的牌照集
				 */
				Entity entities[] = new Entity[4];
				int eid_1 = rs.getInt("eid_1");
				int eid_2 = rs.getInt("eid_2");
				int eid_3 = rs.getInt("eid_3");
				int eid_4 = rs.getInt("eid_4");
				EntityDao edao = new EntityDaoImpl();
				entities[0] = edao.getEntityInfo(eid_1);
				entities[1] = edao.getEntityInfo(eid_2);
				entities[2] = edao.getEntityInfo(eid_3);
				entities[3] = edao.getEntityInfo(eid_4);
				user.setEntities(entities);
				
				user.setRealName(rs.getString("realName"));
				user.setIdentifyNum(rs.getString("idNum"));
				user.setMessage(rs.getString("message"));
				
				
				System.out.println("查询成功");
			} else {
				System.out.println("查询失败");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return user;
	}
	
	
	
	/*
	 * 更改用户信息：用户的修改个人资料处
	 */
	@Override
	public boolean updateUserInfo(User user) {
		boolean flag = false;
		
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if(conn==null) return false;

		String sql="UPDATE admin t SET t.address = ?, t.phone = ?  WHERE t.name LIKE ? ESCAPE '#'";
		try {
			pst= conn.prepareStatement(sql);
			pst.setString(1, user.getAddress());
			pst.setString(2, user.getPhone());
			pst.setString(3, user.getName());
			pst.executeUpdate();
			
			System.out.println("修改成功");
			flag=true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		
		
		return flag;
	}
	
	/*
	 * 更改用户全部信息：面向管理员
	 */
	@Override
	public boolean updateUserWholeInfo(User user) {
		boolean flag = false;
		
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if(conn==null) return false;

		String sql="UPDATE admin t SET t.address = ?, t.phone = ? , t.password = ? , t.priority = ?, t.num = ? ,"
				+ "t.idNum = ?, t.realName = ? , t.message = ? WHERE t.name LIKE ? ESCAPE '#'";
		try {
			pst= conn.prepareStatement(sql);
			pst.setString(1, user.getAddress());
			pst.setString(2, user.getPhone());
			pst.setString(3, user.getPassword());
			pst.setInt(4, user.getPriority());
			pst.setInt(5, user.getNum());
			
			
			
			
			pst.setString(6, user.getIdentifyNum());
			pst.setString(7, user.getRealName());
			pst.setString(8, user.getMessage());
			
			pst.setString(9, user.getName());
			
			
			
			
			
			pst.executeUpdate();
			
			System.out.println("updateWholeInfo:修改成功");
			flag=true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		
		
		return flag;
	}
	
	/*
	 * 实名申请
	 */
	public int updateUserAutonym(String userName, String realname, String idNum) {
		
		//生成日期功能
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		int day = c.get(Calendar.DATE);
		//生成申请时间
		String begintime = ""+ year +"-"+month +"-"+day;
		User user = this.getUserWholeInfo(userName, "");
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if (user.getIdentifyNum() != null) {//如果已经已实名
			return -1;
		}
		String sql_check = "select * from admin where idNum = ?";
		String sql_check_2 = "select * from recordID where name = ?";
		try {
			pst = conn.prepareStatement(sql_check);
			pst.setString(1, idNum);
			rs = pst.executeQuery();
			if (rs.next()) {//如果存在重复身份证号
				System.out.println(rs.getString("idNum"));
				return -2;
			}
			
			pst = conn.prepareStatement(sql_check_2);
			pst.setString(1, userName);
			rs = pst.executeQuery();
			if (rs.next()) {//如果重复申请
				System.out.println(rs.getString("idNum"));
				return -3;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
		String sql = "insert into recordID(realName,idNum,name,phone,begintime) values(?,?,?,?,?)";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, realname);
			pst.setString(2, idNum);
			pst.setString(3, user.getName());
			pst.setString(4, user.getPhone());//电话号码
			pst.setString(5, begintime);//申请时间
			
			pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		return 1;
	}
	
	/*
	 * 更改用户密码
	 */
	public boolean updatePassword(String userName, String oldPwd, String newPwd) {
		boolean flag = true;
		
		
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if(conn==null) return false;

		String sql_check="SELECT * FROM admin WHERE name= ?";
		String sql_update="UPDATE admin t SET t.password = ?  WHERE t.name LIKE ? ESCAPE '#'";
		try {
			pst= conn.prepareStatement(sql_check);
			pst.setString(1, userName);
			rs = pst.executeQuery();
			if (rs.next()) {//检查密码是否正确
				String temp = rs.getString("password");
				if (!temp.equals(oldPwd)) {//密码不一样，不允许修改
					return false;
				}
			}
			
			pst = conn.prepareStatement(sql_update);
			
			pst.setString(1, newPwd);
			pst.setString(2, userName);
			pst.executeUpdate();
			
			System.out.println("修改成功");
			flag=true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbutil.close(conn, pst, rs);
		}
		
		return flag;
	}
	/*
	 * 添加数据到recordID
	 */
	
	
	/*
	 * 更新用户牌照信息，用户牌照申请通过
	 */
	public boolean updateUserEntity(User user, int eid) {
		user = this.getUserWholeInfo(user.getName(), user.getPassword());
		boolean flag = false;
		if (user.getNum() >= 4) {//牌照数量大于等于4，不允许再申请
			return false;
		} 
		int num = user.getNum() + 1;//牌照数量加一
		
		DBUtilImpl dbutil=new DBUtilImpl();//新建连接池
		conn = dbutil.getConnection();//通过连接池链接数据库
		if(conn==null) return false;
		
		String sql_del = "DELETE FROM record WHERE eid = ?";
		
		
		
		
		
		
		String sql_update="UPDATE admin t SET t.num = ?, t.eid_" + Integer.toString(num) + " = ?  WHERE t.name LIKE ? ESCAPE '#'";
		try {
			
			pst = conn.prepareStatement(sql_update);
			
			pst.setInt(1, num);
			pst.setInt(2, eid);
			pst.setString(3, user.getName());
			pst.executeUpdate();
			
			System.out.println("updateUserEntity:修改成功");
			
			pst = conn.prepareStatement(sql_del);
			pst.setInt(1, eid);
			pst.executeUpdate();
			System.out.println("updateUserEntity:删除成功");
			
			//添加信息到记录History
			//生成日期功能
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int day = c.get(Calendar.DATE);
			int month = c.get(Calendar.MONTH)+1;
			//生成申请时间
			String begintime = ""+ year +"-"+month +"-"+day;
			History history = new History();
			EntityDao entdao = new EntityDaoImpl();
			Entity entity = entdao.getEntityInfo(eid);
			history.setBegintime(begintime);history.setE_name(entity.getName());
			history.setEid(eid);history.setIdNum(user.getIdentifyNum());
			history.setPhone(user.getPhone());history.setRealName(user.getRealName());
			history.setU_name(user.getName());
			HistoryDao hd = new HistoryDaoImpl();
			hd.updateHistory(history);
			
			flag=true;

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		
		
		finally {
			dbutil.close(conn, pst, rs);
		}
		
		
		return flag;
	}
	/*
	 * 接受实名申请
	 */
	@Override
	public boolean acceptAutonymApplay(User user, String idNum, String realName) {
		if (user.getIdentifyNum() != null || user.getRealName() != null) {
			return false;//已有实名
		}
		
		user.setIdentifyNum(idNum);
		user.setRealName(realName);
		this.updateUserWholeInfo(user);
		
		RecordIDDao rid = new RecordIDDaoImpl();
		rid.withdrawAutonym(user.getName());
		
		return true;
	}
}
