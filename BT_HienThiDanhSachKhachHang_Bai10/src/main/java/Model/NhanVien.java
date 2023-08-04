package Model;

public class NhanVien {
    private int id;
    public static int count;
    private String name;
    private String date;
    private String address;
    private String img;

    public NhanVien( String name, String date, String address, String img) {
        this.id = count++;
        this.name = name;
        this.date = date;
        this.address = address;
        this.img = img;
    }

    public NhanVien() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public static int getCount() {
        return count;
    }

    public static void setCount(int count) {
        NhanVien.count = count;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
