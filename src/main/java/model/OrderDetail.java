/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class OrderDetail {

    private String id;
    private String PerfumeName;
    private int quantity;
    private double price;

    public OrderDetail(String id, String PerfumeName, int quantity, double price) {
        this.id = id;
        this.PerfumeName = PerfumeName;
        this.quantity = quantity;
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPerfumeName() {
        return PerfumeName;
    }

    public void setPerfumeName(String PerfumeName) {
        this.PerfumeName = PerfumeName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "OrderDetail{" + "id=" + id + ", PerfumeName=" + PerfumeName + ", quantity=" + quantity + ", price=" + price + '}';
    }

//            
//            ord_id varchar(10),
//	foo_id varchar(10) not null,
//	quantity int not null,
//	price decimal(10,2) not null,
}
