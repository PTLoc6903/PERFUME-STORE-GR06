package modelManager;

public class OrderDetail {
    private String perfume_id;
    private String img;
    private String name_perfume;
    private double unit_price;
    private int quantity;
    private double total_price;

    public OrderDetail(String perfume_id, String img, String name_perfume, double unit_price, int quantity, double total_price) {
        this.perfume_id = perfume_id;
        this.img = img;
        this.name_perfume = name_perfume;
        this.unit_price = unit_price;
        this.quantity = quantity;
        this.total_price = total_price;
    }

    public String getPerfume_id() {
        return perfume_id;
    }

    public void setPerfume_id(String perfume_id) {
        this.perfume_id = perfume_id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName_perfume() { // Đã sửa lại tên phương thức
        return name_perfume;
    }

    public void setName_perfume(String name_perfume) {
        this.name_perfume = name_perfume;
    }

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }
}
