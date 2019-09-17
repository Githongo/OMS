
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;  
import java.util.regex.Matcher; 




/**
 *
 * @author Hp
 */
public class DBConnection {

        Connection con;
        public Connection getCon() throws SQLException{
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/oms","root", "");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            return con;
        }
        
        public String inputCleaner(String dirty){
            String[] array = new String[] { "shit", "fuck", "bitch", "cunt", "ass", "boob" };
            String blocked = String.join("|", array);
            
            Pattern pattern = Pattern.compile(blocked);
                        
            Matcher matcher = pattern.matcher(dirty.toLowerCase());
            String clean = "";
            boolean found = false;
            while (matcher.find()) {    
                clean = matcher.replaceAll("*");
                found = true;    
            }    
            if(!found){    
                return dirty;    
            }
            
            return clean;
        }
}
