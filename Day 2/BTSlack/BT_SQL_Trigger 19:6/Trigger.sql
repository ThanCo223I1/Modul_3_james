-- Trigger sau khi thêm dữ liệu vào bảng KhachHang
CREATE 
    TRIGGER  after_insert_KhachHang
 AFTER INSERT ON KhachHang FOR EACH ROW 
    BEGIN END;

-- Trigger sau khi cập nhật dữ liệu trên bảng KhachHang
CREATE TRIGGER after_update_KhachHang
AFTER UPDATE ON KhachHang
FOR EACH ROW
BEGIN
    -- Thực hiện các hành động sau khi cập nhật dữ liệu trên bảng KhachHang
    -- ...

END;

-- Trigger sau khi xóa dữ liệu trên bảng KhachHang
CREATE TRIGGER after_delete_KhachHang
AFTER DELETE ON KhachHang
FOR EACH ROW
BEGIN
    -- Thực hiện các hành động sau khi xóa dữ liệu trên bảng KhachHang
    -- ...

END;