package Model;

import java.util.ArrayList;
import java.util.List;

public class ManagerNhanVien {
    public static List<NhanVien> nhanViens = new ArrayList<>();
    static {
        nhanViens.add(new NhanVien("Mai Văn Hoàng","1983-08-20","Hà Nội","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzt-l3n3Jy2Noh1P21Ao6-oOFzTEC7heXypQ&usqp=CAU"));
        nhanViens.add(new NhanVien("Nguyễn Văn Nam","1983-08-21","Bắc Giang","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPqRG9Ermx_W9UqP8b3wIx_cyl4zGZwgOxU_oWT1W1tabV3nMfxcYHskJ--iVxKNbWizk&usqp=CAU"));
        nhanViens.add(new NhanVien("Nguyễn Thái Hòa","1983-08-22","Nam Định","https://i.vietgiaitri.com/2018/11/8/hot-boy-nganh-bao-hiem-so-huu-ngoai-hinh-dien-trai-nhu-idol-ea079a.jpg"));
        nhanViens.add(new NhanVien("Trần Đăng Khoa","1983-08-17","Hà Tây","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTR_VT2Zd01y26l4OCcud3iL1JWM9pOuAe8rY3d9ZcO6klNtFuL4S1_bAgv0K_69W8yPp0&usqp=CAU"));
        nhanViens.add(new NhanVien(" Nguyễn Đình Thi","1983-08-18","Hà Nội","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmJN4dqE8nZF7skclz7yVfQC3U1O6zsIi9tQ&usqp=CAU"));
    }
}
