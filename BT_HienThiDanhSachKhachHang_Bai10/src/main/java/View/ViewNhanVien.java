package View;

import Model.NhanVien;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ViewNhanVien {
    Scanner scanner = new Scanner(System.in);
    List<NhanVien> nhanViens = new ArrayList<>();

    public NhanVien createNhanVien() {
        System.out.println("Nhập Tên: ");
        String tenNV = scanner.nextLine();
        System.out.println("Nhập Ngày Sinh: ");
        String ngaySinh = scanner.nextLine();
        System.out.println("Nhập Địa Chỉ: ");
        String diaChi = scanner.nextLine();
        System.out.println("Nhập Địa Chỉ Hình Ảnh: ");
        String hinhAnh = scanner.nextLine();
        return new NhanVien(tenNV, ngaySinh, diaChi, hinhAnh);
    }

    public void AddNhanVien() {
        NhanVien nhanVien = createNhanVien();
        nhanViens.add(nhanVien);
    }

    public int findById(int id) {
        for (int i = 0; i < nhanViens.size(); i++) {
            if (nhanViens.get(i).getId() == id) {
                return nhanViens.get(i).getId();
            }
        }
        return -1;
    }

    public void delete() {
        System.out.println("Nhập Tên Nhân Viên Cần Xóa: ");
         String tenNhanVien = scanner.nextLine();
        if (!nhanViens.isEmpty()){
            int index = findById(Integer.parseInt(tenNhanVien));
            if (index != -1){
                nhanViens.remove(index);
            }
        }
    }

    public void EditNhanVien() {
        System.out.println("Nhập ID Nhân Viên Cần Sửa: ");
        int idNV = Integer.parseInt(scanner.nextLine());
        if (!nhanViens.isEmpty()) {
            int index = findById(idNV);
            if (index != -1) {
                NhanVien nhanVien = createNhanVien();
                nhanVien.setId(nhanViens.get(index).getId());
                nhanViens.set(index, nhanVien);
            }
        }
    }
}
