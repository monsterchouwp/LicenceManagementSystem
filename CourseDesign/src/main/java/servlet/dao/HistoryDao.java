package servlet.dao;

import model.History;
import java.util.ArrayList;

public interface HistoryDao {
	public boolean updateHistory(History history);//添加历史记录
	public ArrayList<History> get_ListInfoByAdmin();//获取所有历史记录
	public ArrayList<History> get_ListUserInfo(String u_name);//获取某个用户的历史记录
}
