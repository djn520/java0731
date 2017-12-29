package user.dao;

import java.util.List;

import user.entity.User;

public interface UserDao {
	
	//�û���¼
	public User loginByUser(String u_username,String u_password);
	
	//ģ����ѯȫ���û���Ϣ
	public List<User> queryAllByUser(String value,int indexPage, int pageSize);
	
	//��ҳ��ѯ
	public List<User> listByUser(int indexPage,int pageSize) ;
	public int getPage();
	
	//�û����
	public boolean addByUser(User u);
	
	//�û��޸�
	public boolean updateByUser(User u);
	
	//�û�ɾ��
	public boolean deleteByUser(String id);
	
	
}
