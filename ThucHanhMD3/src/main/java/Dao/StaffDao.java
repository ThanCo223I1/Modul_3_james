package Dao;

import model.Staff;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StaffDao implements IStaffDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/managerStaff?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456";
    private static final String INSERT_STAFF_SQL = "INSERT INTO Staff(staff_name,staff_email,staff_address,staff_salary,department_id)VALUE(?,?,?,?,?);";
    private static final String SELECT_STAFF_BY_ID = "select * from Staff where staff_id = ?;";
    private static final String SELECT_ALL_STAFF = "select * from Staff";
    private static final String UPDATE_STAFF_SQL = "update Staff set staff_name = ?,staff_email = ?,staff_address = ?,staff_salary = ?,department_id = ? where staff_id = ?;";
    private static final String DELETE_STAFF_SQL = "delete from Staff where staff_id = ?;";
    private static final String SEARCH_STAFF_BY_STAFF_NAME = "select staff_id,staff_name,staff_email,staff_address,staff_salary,department_id from Staff where staff_name like ?;";

    public StaffDao() {
    }

    protected Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertStaff(Staff staff) throws SQLException {
        System.out.println(INSERT_STAFF_SQL);
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_STAFF_SQL)) {
            preparedStatement.setString(1, staff.getName());
            preparedStatement.setString(2, staff.getEmail());
            preparedStatement.setString(3, staff.getAddress());
            preparedStatement.setFloat(4, staff.getSalary());
            preparedStatement.setString(5, staff.getDepartment());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Staff selectStaff(int id) {
        Staff staff = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STAFF_BY_ID);) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("staff_name");
                String email = resultSet.getString("staff_email");
                String address = resultSet.getString("staff_address");
                float salary = Float.parseFloat(resultSet.getString("staff_salary"));
                String department = resultSet.getString("department_id");
                staff = new Staff(id, name, email, address, salary, department);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return staff;
    }

    public List<Staff> selectAllStaff() {
        List<Staff> staffList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STAFF);) {
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("staff_id");
                String name = resultSet.getString("staff_name");
                String email = resultSet.getString("staff_email");
                String address = resultSet.getString("staff_address");
                Float salary = resultSet.getFloat("staff_salary");
                String department = resultSet.getString("department_id");
                staffList.add(new Staff(id, name, email, address, salary, department));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return staffList;
    }

    public boolean updateStaff(Staff staff) throws SQLException {
        boolean rowUpdate;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_STAFF_SQL);) {
            preparedStatement.setString(1, staff.getName());
            preparedStatement.setString(2, staff.getEmail());
            preparedStatement.setString(3, staff.getAddress());
            preparedStatement.setFloat(4, staff.getSalary());
            preparedStatement.setString(5, staff.getDepartment());
            preparedStatement.setInt(6, staff.getId());
            rowUpdate = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdate;

    }

    public boolean deleteStaff(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_STAFF_SQL);) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        }
        return rowDeleted;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
//    public List<Staff> search(String name){
//        String search = "%" + name + "%";
//        List<Staff> staffList = new ArrayList<>();
//        try (Connection connection = getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_STAFF_BY_STAFF_NAME);) {
//            preparedStatement.setString(1, search);
//            System.out.println(preparedStatement);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                int id = rs.getInt("id");
//                String email = rs.getString("email");
//                String address = rs.getString("address");
//                float salary = rs.getFloat("salary");
//                String department = rs.getString("department");
//                staffList.add(new Staff(id, name, email, address,salary,department));
//            }
//        } catch (SQLException e) {
//            printSQLException(e);
//        }
//        return staffList;
//    }

    public List<Staff> searchByName(String name) {
        String search = "%" + name + "%";

        List<Staff> staffList = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_STAFF_BY_STAFF_NAME);) {
            preparedStatement.setString(1, search);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("staff_id");
                String email = rs.getString("staff_email");
                String address = rs.getString("staff_address");
                float salary = rs.getFloat("staff_salary");
                String department = rs.getString("department_id");
                staffList.add(new Staff(id, name, email, address, salary, department));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return staffList;
    }
}
