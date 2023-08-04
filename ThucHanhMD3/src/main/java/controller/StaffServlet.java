package controller;

import Dao.StaffDao;
import model.Staff;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

//Tạo 1 web app quản lý nhân viên staff có đầy đủ chức năng hiển thị danh sách, thêm, sửa, xoá (không phải quản lý phòng ban department)
//        Staff có các trường sau
//        Name,email, address, salary, department
//        Trong đó department lấy từ bảng department
//        1/ khi vào trang chủ hiển thị danh sách staff
//        2) trang chủ có nút thêm, ấn vào dẫn tới trang thêm nhân viên
//        Sau khi thêm nhân viên xong tự động chuyển về trang chủ
//        3) trang chủ có nút sửa, ấn vào đi tới trang sửa
//        Đồng thời hiện thông tin đầy đủ của nhân viên đang sửa
//        Sau khi sửa xong ấn xác nhận tự động quay về trang chủ
//        4) trang chủ có nút xoá, phải có thông báo xác nhận trc khi xoá
//        5) trang chủ có ô tìm kiếm, tìm kiếm theo tên và tìm kiếm tương đối
@WebServlet(name = "staffServlet", value = "/staff")
public class StaffServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private StaffDao staffDao;

    public void init() {
        staffDao = new StaffDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    createStaff(request,response);
                    break;
                case "edit":
                    updateStaff(request,response);
                    break;
                case "search":
                    searchByName(request, response);
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateStaff(request,response);
                    break;
                case "edit":
                    showUpdateStaff(request,response);
                    break;
                case "delete":
                    deleteStaff(request,response);
                    break;
                default:
                    listStaff(request,response);
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void listStaff(HttpServletRequest request , HttpServletResponse response)
        throws Exception{
        List<Staff> staffList = staffDao.selectAllStaff();
        request.setAttribute("staffList1",staffList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/listStaff.jsp");
        requestDispatcher.forward(request,response);
    }

    private void createStaff(HttpServletRequest request, HttpServletResponse response)
                            throws Exception{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        float salary = Float.parseFloat(request.getParameter("salary"));
        String department = request.getParameter("department");
        Staff newStaff = new Staff(name,email,address,salary,department);
        staffDao.insertStaff(newStaff);
        response.sendRedirect("/staff");
    }

    private void showCreateStaff(HttpServletRequest request, HttpServletResponse response)
                                 throws Exception{
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/createStaff.jsp");
        try {
            requestDispatcher.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException{
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        float salary = Float.parseFloat(request.getParameter("salary"));
        String department = request.getParameter("department");
        Staff staff = new Staff(id,name,email,address,salary,department);
        staffDao.updateStaff(staff);
        response.sendRedirect("/staff");
    }
    private void showUpdateStaff(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException{
        int id = Integer.parseInt(request.getParameter("id"));
        Staff staff = staffDao.selectStaff(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/updateStaff.jsp");
        request.setAttribute("staff",staff);
        requestDispatcher.forward(request,response);
    }

    private  void deleteStaff(HttpServletRequest request , HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        staffDao.deleteStaff(id);
        List<Staff> staffList = staffDao.selectAllStaff();
        request.setAttribute("staffList", staffList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/listStaff.jsp");
        requestDispatcher.forward(request,response);
    }

    private void searchByName(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("search");
        List<Staff> staffList = staffDao.searchByName(name);
        request.setAttribute("staffList", staffList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/listStaff.jsp");
        dispatcher.forward(request, response);
    }
}
