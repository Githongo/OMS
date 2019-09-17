/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hp
 */
public class login extends HttpServlet {
    public boolean auth;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            String uname = request.getParameter("u_name");
            String password = request.getParameter("p_word");
            
            if("Admin".equals(uname) && "Administrator".equals(password)){
               response.sendRedirect("Admin.jsp");
               session.setAttribute("uname", uname);
            }
            else{
            try{
                DBConnection db;
                db = new DBConnection();
                Connection conn;
                conn = db.getCon();
                
                String query1 = "SELECT * FROM `users` WHERE `UserName`=? AND `Password`=? AND `status` = 1";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                ps1.setString(1, uname);
                ps1.setString(2, password);
                ResultSet rs1 = ps1.executeQuery();
                
                if(rs1.next()){
                    auth = true;
                }
                else{
                    auth = false;
                }
                
                }
            catch(SQLException e){
                    out.print("<h3>Error, couldn't connect to DB<h3>"+e);
                }

                if(auth == true){
                   
                    session.setAttribute("uname", uname);
                    response.sendRedirect("user.jsp"); 

                }
                else{
                    response.sendRedirect("index.html");
                }
            
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
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
