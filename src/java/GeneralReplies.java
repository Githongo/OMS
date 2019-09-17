/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hp
 */
public class GeneralReplies extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String uncensoredContent = request.getParameter("reply");
            String QID = request.getParameter("QID");
            int qid = Integer.parseInt(QID);
            HttpSession session = request.getSession();
            String uname = session.getAttribute("uname").toString();
            
            
            
            try{
                DBConnection db = new DBConnection();
                Connection conn = db.getCon();
                String Content = db.inputCleaner(uncensoredContent);
                int RID = (int) ((Math.random() * ((1000000 - 1000) + 1)) + 1000);
                String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
                
                String sql = "INSERT INTO `generalreplies`(`RID`, `PostTime`, `Reply`, `QID`, `UserName`) VALUES"
                        + " (?,?,?,?,?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, RID );
                ps.setString(2, timeStamp);
                ps.setString(3, Content);
                ps.setInt(4, qid);
                ps.setString(5, uname);
                ps.execute();
                
                String sql2 = "DELETE FROM `generalreplies` WHERE QID = ? AND UserName = '' ";
                PreparedStatement ps2 = conn.prepareStatement(sql2);
                ps2.setInt(1, qid );
                ps2.execute();
               
                
                
            }
            catch(SQLException se){
                out.print("Error: "+se);
            }
            
            response.sendRedirect("user.jsp");
            
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
        processRequest(request, response);
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
