package servlet.dao;

import java.util.ArrayList;

import model.Record;


public interface RecordDao {//记录牌照申请的数据库
	public ArrayList<Record> get_ListInfo();
	
	public ArrayList<Record> get_ListInfoByAdmin();
	public ArrayList<Record> get_ListInfoByUser(String userName);
	
	public Record getRecordInfo(int eid);
	
	
}
