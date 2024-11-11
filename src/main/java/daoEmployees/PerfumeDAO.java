/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoEmployees;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelEmployees.Perfume;

/**
 *
 * @author Admin
 */
public class PerfumeDAO extends DBContext {

    /**
     * Test function
     *
     * @param args
     */
    public static void main(String[] args) {
        PerfumeDAO f = new PerfumeDAO();
        List<Perfume> perfumes = f.searchByName("f");
        for (int i = 0; i < perfumes.size(); i++) {
            System.out.println(perfumes.get(i).toString());
        }
    }

    /**
     * check perfume is existed in perfume table before
     *
     * @param id
     * @return
     */
    public boolean isExisted(String id) {
        try {
            String sql = "select * from perfume  "
                    + "where per_id  = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * add perfume to perfume table
     *
     * @param perfume
     */
    public void add(Perfume perfume) {
        try {
            String sql = "insert into Perfume values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, perfume.getId());
            ps.setString(2, perfume.getCategoryId());
            ps.setString(3, perfume.getName());
            ps.setDouble(4, perfume.getPrice());
            ps.setDouble(5, perfume.getSale());
            ps.setString(6, perfume.getDescription());
            ps.setString(7, perfume.getStatus());
            ps.setString(8, perfume.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * update perfume which has before from perfume table
     *
     * @param perfume
     */
    public void update(Perfume perfume) {
        try {
            String sql = "update Perfume set cat_id = ?, "
                    + "per_name = ?, "
                    + "per_price = ? , "
                    + "per_sale = ? , "
                    + "per_desription =?, "
                    + "per_status = ?, "
                    + "per_img =? "
                    + "where per_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(8, perfume.getId());
            ps.setString(1, perfume.getCategoryId());
            ps.setString(2, perfume.getName());
            ps.setDouble(3, perfume.getPrice());
            ps.setDouble(4, perfume.getSale());
            ps.setString(5, perfume.getDescription());
            ps.setString(6, perfume.getStatus());
            ps.setString(7, perfume.getImg());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    /**
     * update perfume status by id in perfume table
     *
     * @param id
     * @param status
     */
    public void updateStatus(String id, String status) {
        try {
            String sql = "update Perfume set"
                    + "per_status = ?, "
                    + "where per_id =?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setString(1, id);

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    /**
     * remove perfume which has before from perfume table
     *
     * @param id
     */
    public void remove(String id) {
        try {
            String sql = "delete Employee where per_id  = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    /**
     * get all perfume from perfume table
     *
     * @return
     */
    public List<Perfume> getAll() {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "select * from Perfume";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * search perfume by name from perfume table
     *
     * @param name
     * @return
     */
    public List<Perfume> searchByName(String name) {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "select * from Perfume  where per_name LIKE ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    /**
     * search by cateID from perfume table
     *
     * @param cateID
     * @return
     */
    public List<Perfume> searchByCateID(String cateID) {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "select * from Perfume  where cat_id = ?  ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                ));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
