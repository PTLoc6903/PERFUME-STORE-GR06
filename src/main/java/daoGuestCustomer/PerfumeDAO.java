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
import model.Category;
import model.Perfume;

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
//        PerfumeDAO f = new PerfumeDAO();
//        List<Perfume> perfumes = f.searchByCateID("b");
//        for (int i = 0; i < perfumes.size(); i++) {
//            System.out.println(perfumes.get(i).toString());
//        }
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
            ps.setString(2, perfume.getCategory().getId());
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

    public List<Perfume> getTopFourSeller() {
        List<Perfume> perfumes = new ArrayList<>();
        try {
            String sql = "SELECT top(4) f.per_id, COALESCE(SUM(od.quantity), 0) AS so_lan_dat\n"
                    + "FROM perfume f\n"
                    + "LEFT JOIN orderdetail od ON f.per_id = od.per_id\n"
                    + "where f.per_status <> 'Deleted'\n"
                    + "GROUP BY f.per_id\n"
                    + "order by so_lan_dat desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                perfumes.add(searchByID(rs.getString(1)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return perfumes;
    }

    public List<Perfume> getTopFourLastest() {
        List<Perfume> perfumes = new ArrayList<>();
        try {
            String sql = "Select top(4) per_id from Perfume\n"
                    + "where per_status<>'Deleted'\n"
                    + "order by per_id desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                perfumes.add(searchByID(rs.getString(1)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return perfumes;
    }

    public Category getCategory(String categoryID) {
        try {
            String sql = "select * from category  where cat_id= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, categoryID);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return new Category(rs.getString(1), rs.getString(2), rs.getString(3));
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Perfume searchByID(String id) {
        try {
            String sql = "select * from Perfume  where per_id = ? and per_status<>'Deleted' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Perfume(rs.getString(1),
                        getCategory(rs.getString(2)),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Perfume> getAll() {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "select * from Perfume where per_status<>'Deleted'";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        getCategory(rs.getString(2)),
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

    public List<Perfume> searchByName(String name) {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "select * from Perfume  where per_name LIKE ? and per_status<>'Deleted' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        getCategory(rs.getString(2)),
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

    public List<Perfume> searchByCateID(String cateID) {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "select * from Perfume  where cat_id = ? and per_status<>'Deleted' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        getCategory(rs.getString(2)),
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
