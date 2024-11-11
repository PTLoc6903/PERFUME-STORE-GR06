/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package daoManager;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelManager.Perfume;


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
        // List<Perfume> perfumes = f.searchByName("b");
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
            String sql = "update Perfume set cat_id = ?, \n"
                    + "per_name = ?, \n"
                    + "per_price = ? , \n"
                    + "per_sale = ? , \n"
                    + "per_description =?, \n"
                    + "per_status = ?, \n"
                    + "per_img =? \n"
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

    public Perfume getPerfumeDetails(String id) {
        try {
            String sql = "SELECT f.per_id, f.per_name, f.per_price, f.per_sale, f.per_description, f.per_status, f.per_img, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered, c.cat_name, c.cat_id\n"
                    + "FROM Perfume f\n"
                    + "LEFT JOIN OrderDetail od ON f.per_id = od.per_id\n"
                    + "LEFT JOIN Category c ON f.cat_id = c.cat_id\n"
                    + "where f.per_id = ?\n"
                    + "GROUP BY f.per_id, f.per_name, f.per_price, f.per_sale, f.per_description, f.per_status, f.per_img, c.cat_name, c.cat_id";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

   public String getIDForNewPerfume() {
    try {
        String maxID;
        String sql = "select max(per_id) from Perfume";
        PreparedStatement ps = connection.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next() && rs.getString(1) != null) {
            maxID = rs.getString(1);
            String prefix = maxID.substring(0, 3); // "PER"
            String numberPart = maxID.substring(3); // "010"
            int number = Integer.parseInt(numberPart); // 10
            number++;
            String newID = prefix + String.format("%03d", number); // "PER011"
            return newID;
        } else {
            // Nếu không có giá trị ID nào trong bảng, khởi tạo ID đầu tiên
            return "PER001";
        }
    } catch (Exception e) {
        System.out.println(e);
    }
    return null;
}


    public List<Perfume> getListBestSeller() {
        try {
            List<Perfume> listBestSeller = new ArrayList<>();
            String sql = "SELECT TOP 8 f.per_id, f.per_name, f.per_img, f.per_price, f.per_sale, f.per_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Perfume f\n"
                    + "LEFT JOIN OrderDetail od ON f.per_id = od.per_id\n"
                    + "WHERE f.per_status != 'Deleted'\n"
                    + "GROUP BY f.per_id, f.per_name, f.per_price, f.per_sale, f.per_img, f.per_status\n"
                    + "ORDER BY total_quantity_ordered DESC;";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listBestSeller.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
            return listBestSeller;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Perfume> getListMenu() {
        try {
            List<Perfume> listMenu = new ArrayList<>();
            String sql = "SELECT f.per_id, f.per_name, f.per_img, f.per_price, f.per_sale, f.cat_id, f.per_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Perfume f\n"
                    + "LEFT JOIN OrderDetail od ON f.per_id = od.per_id\n"
                    + "WHERE f.per_status != 'Deleted'\n"
                    + "GROUP BY f.per_id, f.per_name, f.per_img, f.per_price, f.per_sale, f.cat_id, f.per_status";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                listMenu.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)
                ));
            }
            return listMenu;
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return null;
    }

    public List<Perfume> getListSuggest(String cateId) {
        List<Perfume> list = new ArrayList<>();
        try {
            String sql = "SELECT top(4) f.per_id, f.per_name, f.per_img, f.per_price, f.per_sale, f.per_status, COALESCE(SUM(od.quantity), 0) AS total_quantity_ordered\n"
                    + "FROM Perfume f\n"
                    + "LEFT JOIN OrderDetail od ON f.per_id = od.per_id\n"
                    + "WHERE f.cat_id = ? AND f.per_status != 'Deleted'\n"
                    + "GROUP BY f.per_id, f.per_name, f.per_price, f.per_sale, f.per_img, f.per_status\n"
                    + "order by(total_quantity_ordered) desc";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cateId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getDouble(5),
                        rs.getString(6),
                        rs.getInt(7)
                ));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deletePerfume(String perfumeId) {
        try {
            String sql = "update Perfume set per_status = 'Deleted' where per_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, perfumeId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Perfume getPerfumeUpdate(String id) {
        try {
            String sql = "select a.per_id, a.per_name, a.per_price, a.per_sale, a.per_description, a.per_status, a.per_img, b.cat_name, b.cat_id from Perfume a\n"
                    + "join Category b on a.cat_id=b.cat_id\n"
                    + "where per_id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Perfume(rs.getString(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updatePerfume(Perfume perfume) {
        try {
            String sql = "UPDATE Perfume "
                    + "SET cat_id = ?, "
                    + "    per_name = ?, "
                    + "    per_price = ?, "
                    + "    per_sale = ?,  "
                    + "    per_description = ?, "
                    + "    per_status = ?, "
                    + "    per_img = ? "
                    + "WHERE per_id = ?";
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
}
