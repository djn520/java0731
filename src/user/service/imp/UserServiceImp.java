package user.service.imp;

import java.util.List;

import user.dao.UserDao;
import user.dao.imp.UserDaoImp;
import user.entity.User;
import user.service.UserService;

public class UserServiceImp implements UserService {
	
	UserDao userdao=new UserDaoImp();

	@Override
	public User loginByUser(String u_username, String u_password) {
		return userdao.loginByUser(u_username, u_password);
	}

	@Override
	public List<User> queryAllByUser(String value,int indexPage, int pageSize) {
		return userdao.queryAllByUser(value,indexPage,pageSize);
	}

	@Override
	public List<User> listByUser(int indexPage, int pageSize) {
		// TODO Auto-generated method stub
		return userdao.listByUser(indexPage, pageSize);
	}

	@Override
	public int getPage() {
		// TODO Auto-generated method stub
		return userdao.getPage();
	}

	@Override
	public boolean addByUser(User u) {
		// TODO Auto-generated method stub
		return userdao.addByUser(u);
	}

	@Override
	public boolean updateByUser(User u) {
		// TODO Auto-generated method stub
		return userdao.updateByUser(u);
	}

	@Override
	public boolean deleteByUser(String id) {
		// TODO Auto-generated method stub
		return userdao.deleteByUser(id);
	}

}
