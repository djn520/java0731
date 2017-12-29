package user.dao.imp;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sun.org.apache.bcel.internal.generic.NEW;

import user.dao.UserDao;
import user.db.ConnectionDatabaseForMysqlUseJdbc;
import user.entity.User;

public class UserDaoImp implements UserDao{
	
	QueryRunner qr=new QueryRunner(ConnectionDatabaseForMysqlUseJdbc.getDataSourse());

	boolean falg = false ;
	
	@Override
	public User loginByUser(String u_username, String u_password) {
		String sql="select u_username , u_password from user where u_username=? and u_password=?";
		try {
			return qr.query(sql, new BeanHandler<User>(User.class),u_username,u_password);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return null;
	}

	@Override
	public List<User> queryAllByUser(String  value,int indexPage, int pageSize) {
		System.out.println(value);
		List<User> list= null;
		String sql = "";
		if(value!=null&&!"".equals(value)){
			sql = "SELECT * FROM `user` where "
					+ "   u_id like  '%"+value+"%'"
					+" or u_username like '%"+value+"%'"
					+" or u_sex like '%"+value+"%'"
					
					+" or u_address like '%"+value+"%'"
					+"limit "+(indexPage - 1 ) * pageSize +","+ pageSize;
		}else{
			sql="SELECT * FROM `user` limit "+(indexPage - 1 ) * pageSize +","+ pageSize;
		}
		
		try {
			 list = qr.query(sql, new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<User> listByUser(int indexPage, int pageSize) {
		List<User> list = new ArrayList<User>();
		String sql="select * from user limit "+(indexPage - 1 ) * pageSize +","+ pageSize;
		try {
			list = qr.query(sql, new BeanListHandler<User>(User.class) );
			System.out.println("***dao              "+list.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getPage() {
		int i = 0;
		
		String sql = "select count(*) from user ";
		
		try {
			
			Number query = (Number) qr.query(sql, new ScalarHandler());
			
			i = query.intValue();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return i;
	}

	@Override
	public boolean addByUser(User u) {
		
		String sql= "insert into user values (0,?,?,?,?,?,?)";
		
		Object[] param = {u.getU_id(),u.getU_username(),u.getu_password(),u.getU_age(),u.getU_sex(),u.getU_address() };
		
		try {
			int a = qr.update(sql, param);
			if(a == 1){
				falg = true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return falg;
	}

	@Override
	public boolean updateByUser(User u) {
		
		String sql = "update user set u_username=? ,u_password=? ,u_age=? ,u_sex=? ,u_address =? where u_id=? ";
		Object[] param={u.getU_username(),u.getu_password(),u.getU_age(),u.getU_sex(),u.getU_address(),u.getU_id() };
		try {
			int a = qr.update(sql, param);
			if(a == 1){
				falg = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return falg;
	}

	@Override
	public boolean deleteByUser(String id) {
		String sql = "delete from user where u_id=?";
		try {
			int a = qr.update(sql, id);
			if(a == 1){
				falg = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return falg;
	}

	
	
}
