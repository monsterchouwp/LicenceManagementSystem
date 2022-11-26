package servlet.dao;

import java.util.ArrayList;

import model.RecordID;

public interface RecordIDDao {//记录实名申请的数据库
	
	public ArrayList<RecordID> get_ListInfoByAdmin();
	
	public boolean withdrawAutonym(String name); 
	
	public ArrayList<RecordID> get_ListInfoUser(String name);
	
}
