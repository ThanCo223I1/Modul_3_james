package Dao;

import model.Staff;

import java.sql.SQLException;
import java.util.List;

public interface IStaffDao {
    public void insertStaff(Staff staff) throws SQLException;
    public Staff selectStaff(int id);
    public List<Staff> selectAllStaff();
    public  boolean deleteStaff(int id) throws SQLException;
    public boolean updateStaff(Staff staff) throws  SQLException;

}