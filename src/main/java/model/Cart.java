/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Cart {

    String phone;
    Perfume Perfume;
    int quantity;

    public Cart(String phone, Perfume Perfume, int quantity) {
        this.phone = phone;
        this.Perfume = Perfume;
        this.quantity = quantity;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Perfume getPerfume() {
        return Perfume;
    }

    public void setPerfume(Perfume Perfume) {
        this.Perfume = Perfume;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Cart{" + "phone=" + phone + ", Perfume=" + Perfume + ", quantity=" + quantity + '}';
    }
    
    
}
