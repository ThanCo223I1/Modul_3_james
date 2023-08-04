package DAO;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class UserDao implements IUserDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/Account?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";
    private static final String INSERT_USERS_SQL = "INSERT INTO users(username,passsword) VALUE(?,?);";
    private static final String SELECT_USER_BY_ID = "select id,username,passsword from Users where id =?";
    private static final String SELECT_ALL_USERS = "select * from Users";

    public UserDao() {
    }

    protected Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
        } catch (Exception e) {
           e.printStackTrace();
        }
        return null;
    }


    @Override
    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USERS_SQL);
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1,user.getUserName());
            preparedStatement.setString(2,user.getPassWord());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }


    @Override
    public User selectUser(int id) {
       User user = null;
       try (Connection connection = getConnection();
       PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);){
           preparedStatement.setInt(1,id);
           System.out.println(preparedStatement);
           ResultSet resultSet = preparedStatement.executeQuery();
           while (resultSet.next()){
               String userName = resultSet.getString("userName");
               String passsWord = resultSet.getString("passsWord");
               user = new User(userName,passsWord);
           }
       }catch (SQLException e){
           e.printStackTrace();
       }
       return user;
    }

    @Override
    public List<User> selectAllUsers() {
       List<User> userList = new ArrayList<>();
       try(Connection connection = getConnection();
       PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
           System.out.println(preparedStatement);
           ResultSet resultSet = preparedStatement.executeQuery();
           while (resultSet.next()){
               String userName = resultSet.getString("userName");
               String passsWord = resultSet.getString("passsWord");
               userList.add(new User(userName,passsWord));
           }
           }catch (SQLException e){
           e.printStackTrace();
       }
       return userList;
    }
}
