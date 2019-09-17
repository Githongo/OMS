/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static com.oracle.wls.shaded.org.apache.xalan.lib.ExsltDatetime.time;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
public class PostQuestion extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();
            String uname = session.getAttribute("uname").toString();
            String topic = session.getAttribute("Topic").toString();
           
            String uncensoredcontent = request.getParameter("question");
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PostQuestion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostQuestion at " + uname +" "+ topic+ " " + uncensoredcontent + "</h1>");
            out.println("</body>");
            out.println("</html>");
      
            
            
            try{
                DBConnection db = new DBConnection();
                Connection con = db.getCon();
                
                String content = db.inputCleaner(uncensoredcontent);
                int QID = (int) ((Math.random() * ((1000000 - 1000) + 1)) + 1000);
                int RID = (int) ((Math.random() * ((1000000 - 1000) + 1)) + 1000);
                String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
                
                String insertQuery = "INSERT INTO `academicquestions`(`QID`, `Questions`, `PostTime`, `RepliesNo`, `UserName`)"
                        + " VALUES (?,?,?,?,?)";
                PreparedStatement ps1 = con.prepareStatement(insertQuery);
                ps1.setInt(1, QID);
                ps1.setString(2, content);
                ps1.setString(3, timeStamp);
                ps1.setInt(4, 0);
                ps1.setString(5, uname);
                ps1.execute();
                
                String sql = "INSERT INTO `replies`(`RID`, `PostTime`, `Reply`, `QID`, `UserName`) VALUES"
                        + " (?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, RID );
                ps.setString(2, timeStamp);
                ps.setString(3, "no replies yet");
                ps.setInt(4, QID);
                ps.setString(5, "");
                ps.execute();
                
            }
            catch(SQLException e){
                out.print("Error:"+ e);
            }
            response.sendRedirect("academics.jsp");
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
