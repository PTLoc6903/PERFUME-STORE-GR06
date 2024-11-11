/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoGuestCustomer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Perfume;

/**
 *
 * @author Admin
 */
public class CartDAO extends DBContext {

    public void add(String phone, String perfumeId) {
        try {
            int quantity = getQuantity(phone, perfumeId);
            if (quantity == 0) {
                String sql = "insert into cart values(?,?,?) ";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, phone);
                ps.setString(2, perfumeId);
                ps.setInt(3, 1);
                ps.executeUpdate();
            } else {
                String sql = "update cart set quantity = ? where cus_phone=? and per_id=?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(2, phone);
                ps.setString(3, perfumeId);
                ps.setInt(1, quantity + 1);
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private int getQuantity(String phone, String perfumeId) throws SQLException {

        String sql = "select * from cart where cus_phone=? and per_id=?";
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, phone);
        ps.setString(2, perfumeId);
        ResultSet rs = ps.executeQuery();
        return rs.next() ? rs.getInt(3) : 0;

    }

    public void add(String phone, String perfumeId, int quantity) {
        try {
            int quantity2 = getQuantity(phone, perfumeId);
            if (quantity2 == 0) {
                String sql = "insert into cart values(?,?,?) ";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, phone);
                ps.setString(2, perfumeId);
                ps.setInt(3, quantity);
                ps.executeUpdate();
            } else {
                String sql = "update cart set quantity = ? where cus_phone=? and per_id=?";
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(2, phone);
                ps.setString(3, perfumeId);
                ps.setInt(1, quantity2 + quantity);
                ps.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Cart> searchByPhone(String phone) {
        List<Cart> carts = new ArrayList<>();
        try {
            String sql = "select * from cart where cus_phone = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PerfumeDAO f = new PerfumeDAO();
                Perfume perfume = f.searchByID(rs.getString(2));
                carts.add(new Cart(rs.getString(1), perfume, rs.getInt(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return carts;
    }

    public static void main(String[] args) {
        CartDAO c = new CartDAO();

//        List<Cart> carts = c.searchByPhone("0123456788");
//        for (int i = 0; i < carts.size(); i++) {
//            System.out.println(carts.get(i).toString());
//        }
        c.updateQuantity(10, "0123456788", "FOOD001");
    }

    public void updateQuantity(int quantity, String phone, String perfumeID) {
        try {
            String sql = "update cart set quantity = ? where cus_phone = ? and per_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setString(2, phone);
            ps.setString(3, perfumeID);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteCart(String phone, String perfumeID) {
        try {
            String sql = "delete from cart where cus_phone = ? and per_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, perfumeID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
     public void deleteAll(String phone) {
        try {
            String sql = "delete from cart where cus_phone = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, phone);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
