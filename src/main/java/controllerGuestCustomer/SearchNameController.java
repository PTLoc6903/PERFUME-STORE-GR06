/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllerGuestCustomer;

import daoGuestCustomer.PerfumeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Perfume;

/**
 *
 * @author Admin
 */
public class SearchNameController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GuestSearch</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuestSearch at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PerfumeDAO f = new PerfumeDAO();
        String name = request.getParameter("txt");
        List<Perfume> perfumes = f.searchByName(name);
        PrintWriter out = response.getWriter();
        if (!perfumes.isEmpty()) {
            for (Perfume perfume : perfumes) {
                String x = "";
                String b = "";
                if(perfume.getName().length()>15){
                    perfume.setName(perfume.getName().substring(0,14)+"...");
                }
                if (perfume.getSale() > 0) {
                    b = "<p class=\"original-price\">" + perfume.getPrice() + "</p>\n"
                            + "<p class=\"discounted-price\">" + perfume.getRealPrice() + "</p>\n";

                } else {
                    b = "<p class=\"discounted-price\">" + perfume.getPrice() + "</p>\n";
                }
                if (perfume.getStatus().equals("Sold Out")) {
                    x = " <button style=\"background-color: grey\">Sold Out</button>\n";
                } else {
                    x = " <button  onclick=\"addToCart('" + perfume.getId() + "')\"><ion-icon style=\"font-size: 22px;\" name=\"cart\"></ion-icon></button>";
                }
                out.println("   <div class=\"col-md-3\">\n" +
"                            <div class=\"best-seller\">"
                        + "\n"
                        + "                            <a href=\"#\">\n"
                        + "                                <img src=\"" + perfume.getImg() + "\" alt=\"\">\n"
                        + "                                <div class=\"name-perfume\">\n"
                        + "                                    <p>" + perfume.getName() + "</p>\n"
                        + "\n"
                        + "                                </div>\n"
                        + "                            </a>\n"
                        + "                            <div class=\"perfume-info\">\n"
                        + "                                <div class=\"price-section\">\n"
                        + "                                    <p>Price:</p>\n"
                        + b
                        + "                                </div><p>Units Sold: (15+)</p>\n"
                        + "\n"
                        + "                            </div>\n"
                        + "                            <div class=\"perfume-btn\">\n"
                        + x
                        + "                              <button onclick=\"viewPerfume('" + perfume.getId() + "')\">View</button>\n"
                        + "                            </div>\n"
                        + "\n"
                        + "                        </div></div>"
                );
            }
        } else {
            out.println("<style>.centered-text {\n"
                    + "  display: flex;\n"
                    + "  justify-content: center;\n"
                    + "  align-items: center; \n"
                    + "  height: 48vh;\n"
                    + "text-align:center"
                    + "} </style>"
                    + "<h1 class=\"centered-text col-12\">No perfume is found<h1>");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
