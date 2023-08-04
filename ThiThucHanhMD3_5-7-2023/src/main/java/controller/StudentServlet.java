package controller;

import Dao.StudentDao;
import model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "StudentServlet", value = "/student")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private StudentDao studentDao;

    public void init() {
        studentDao = new StudentDao();
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
                   createStudent(request, response);
                    break;
                case "edit":
                   updateStudent(request, response);
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
                    showCreateStudent(request, response);
                    break;
                case "edit":
                    showUpdateStudent(request, response);
                    break;
                case "delete":
                    deleteStudent(request, response);
                    break;
                default:
                  listStudent(request, response);
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    private void listStudent(HttpServletRequest request , HttpServletResponse response)
            throws Exception{
        List<Student> studentList = studentDao.selectAllStudent();
        request.setAttribute("studentList",studentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/listStudent.jsp");
        requestDispatcher.forward(request,response);
    }

    private void createStudent(HttpServletRequest request, HttpServletResponse response)
            throws Exception{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birthDay = request.getParameter("birthDay");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String classRoom = request.getParameter("classRoom");
        Student student = new Student(name,email,birthDay,address,phoneNumber,classRoom);
        studentDao.insertStudent(student);
        response.sendRedirect("/student");
    }

    private void showCreateStudent(HttpServletRequest request, HttpServletResponse response)
            throws Exception{
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/createStudent.jsp");
        try {
            requestDispatcher.forward(request,response);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException{
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String birthDay = request.getParameter("birthDay");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String classRoom = request.getParameter("classRoom");
        Student student = new Student(id,name,email,birthDay,address,phoneNumber,classRoom);
        studentDao.updateStudent(student);
        response.sendRedirect("/student");
    }

    private void showUpdateStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException{
        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentDao.selectStudent(id);
        request.setAttribute("student",student);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/updateStudent.jsp");
        requestDispatcher.forward(request,response);
    }

    private  void deleteStudent(HttpServletRequest request , HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        studentDao.deleteStudent(id);
        List<Student> studentList = studentDao.selectAllStudent();
        request.setAttribute("studentList", studentList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/listStudent.jsp");
        requestDispatcher.forward(request,response);
    }

    private void searchByName(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("search");
        List<Student> studentList = studentDao.searchByName(name);
        request.setAttribute("studentList", studentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/listStudent.jsp");
        dispatcher.forward(request, response);
    }
}
