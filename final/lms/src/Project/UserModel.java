/**
* UserModel.java
* @author Sajjad HTLO
*
* This class handles all requirement user methods on database.
*
*/

package Project;

import javax.swing.table.DefaultTableModel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class UserModel extends DefaultTableModel {

    private InitialDB initDB = new InitialDB();

    private Vector<String> column = new Vector<>();
    private Vector<Vector<String>> data = new Vector<>();
    private ResultSet rs = null;
    private final String usersQuery = "SELECT * FROM Users";
    private final String dbUrl = "jdbc:mysql://localhost/" + initDB.getDataBaseName();

    public UserModel() {
    }

    public UserModel(Vector<Vector<String>> data, Vector<String> column) {
        super(data, column);
    }

    public Vector<String> getColumn() {
        try (Connection con = DriverManager.getConnection(dbUrl, "root", initDB.getMysqlPassword());
                Statement st = con.createStatement();) {
            rs = st.executeQuery(usersQuery);
            int c = rs.getMetaData().getColumnCount();

            for (int i = 1; i <=4; i++) {
                column.add(rs.getMetaData().getColumnName(i));
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        return column;
    }

    public Vector<Vector<String>> getData() {
        try (Connection con = DriverManager.getConnection(dbUrl, "root", initDB.getMysqlPassword());
                Statement st = con.createStatement();) {
            rs = st.executeQuery(usersQuery);
            int c = rs.getMetaData().getColumnCount();

            while (rs.next()) {
                Vector<String> eachRow = new Vector<>(c);
                for (int i = 1; i <= c; i++) {
                    eachRow.add(rs.getString(i));
                }
                data.add(eachRow);
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        return data;
    }

    public boolean userID_Exists(int userId) {
        String query = "SELECT User_ID FROM users";
        try (Connection con = DriverManager.getConnection(dbUrl, "root", initDB.getMysqlPassword());
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();) {

            while (rs.next()) {
                if (userId == Integer.parseInt(rs.getString("User_ID"))) {
                    return true;
                }
            }
        } catch (SQLException sqle) {
            JOptionPane.showMessageDialog(null, "Error");
            sqle.printStackTrace();
        }
        return false;
    }

    public void deleteFromUserTable(int rowToModel) {
        Object rowId = this.getValueAt(rowToModel, 0);
        try (Connection con = DriverManager.getConnection(dbUrl, "root", initDB.getMysqlPassword());
                PreparedStatement ps = con.prepareStatement("DELETE FROM Users WHERE User_ID=?");) {

            ps.setObject(1, rowId);

            if (ps.executeUpdate() == 1) {
                super.removeRow(rowToModel);
            }
        } catch (SQLException sqle) {
            JOptionPane.showMessageDialog(null, "Error");
            sqle.printStackTrace();
        }
    }

    public String insertIntoUsersTableAndSetID(String fName, String lName,String password,
            String gender, String date) {
        String id = null;
        ResultSet rs = null;
        String query = "INSERT INTO Users(First_Name,Last_Name,Gender,Reg_Date,Password) "
                + " VALUES(?,?,?,?,?)";
        try (Connection con = DriverManager.getConnection(dbUrl, "root", initDB.getMysqlPassword());
                PreparedStatement ps = con.prepareStatement(query,
                        Statement.RETURN_GENERATED_KEYS);) {
            password=MD5.getMD5(password);
            ps.setString(1, fName);
            ps.setString(2, lName);
            ps.setString(3, gender);
            ps.setString(4, date);
            ps.setString(5, password);
            ps.execute();
            rs = ps.getGeneratedKeys();
            while (rs.next()) {
                id = String.valueOf(rs.getInt(1));
            }
        } catch (SQLException sqle) {
            JOptionPane.showMessageDialog(new UserDialog(), "There is an sql exception");
            sqle.printStackTrace();
        }
        return id;
    }

    public void updateUser(int modelRow, String fName, String lName, String gender,String password) {
        String query = "UPDATE Users SET First_Name=? , Last_Name=? , Gender=? ,password=? Where User_ID=?";
        String id = String.valueOf(this.getValueAt(modelRow, 0));

        try (Connection con = DriverManager.getConnection(dbUrl, "root", initDB.getMysqlPassword());
                PreparedStatement ps = con.prepareStatement(query);) {
        	password=MD5.getMD5(password);
            ps.setObject(1, fName);
            ps.setObject(2, lName);
            ps.setObject(3, gender);
            ps.setObject(4,password);
            ps.setObject(5, id);
            if (ps.executeUpdate() == 1) {
                super.setValueAt(fName, modelRow, 1);
                super.setValueAt(lName, modelRow, 2);
                super.setValueAt(gender, modelRow, 3);
                super.setValueAt(password, modelRow, 4);
            }
        } catch (SQLException sqle) {
            JOptionPane.showMessageDialog(null, "Error");
            sqle.printStackTrace();
        }
    }
    public Vector<String> getIssuedBooksColumns(String query) throws SQLException, ClassNotFoundException
	{
		try{
		
	    ResultSet rst=getConnection().executeQuery(query);
	    int c = rst.getMetaData().getColumnCount();

        for (int i = 1; i <=c; i++) {
            column.add(rst.getMetaData().getColumnName(i));
        }
    } catch (SQLException sqle) {
        sqle.printStackTrace();
    }
    return column;
	}
	public Vector<Vector<String>> getBorrowedBooksData(String query) throws ClassNotFoundException {
        try  {
            ResultSet resultset = getConnection().executeQuery(query);
            int c = resultset.getMetaData().getColumnCount();
            resultset.next();
            int rows=resultset.getRow();
            if(rows==0)
            {
            	userlogin.noBooksIssued=true;
            	userlogin.issuemessage="                             "+userlogin.fname+"! you have no books issued!";
            	return null;
            }
            resultset.beforeFirst();
            while (resultset.next()) {
            	userlogin.noBooksIssued=false;
                Vector<String> eachRow = new Vector<>(c);
                for (int i = 1; i <= c; i++) {
                    eachRow.add(resultset.getString(i));
                }
                data.add(eachRow);
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        return data;
    }
	public static Statement getConnection() throws ClassNotFoundException
	{
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/lib", "root", "root");
        
	    Statement statement=con.createStatement();
	    return statement;
		}
		catch(SQLException exception){
		}
		return null;
	}
	
	public Vector<Vector<String>> getSearchBookData(String query,JFrame frame) throws ClassNotFoundException {
        try  {
            ResultSet resultset = getConnection().executeQuery(query);
            if(resultset!=null)
            {
            	resultset.next();
            	int rows=resultset.getRow();
            	if(rows==0)
            	{
            		JOptionPane.showMessageDialog(frame,
            			    "Sorry no results found!!");
            		BookSearch.toBeDisposed=true;
              		BookSearch bs = new BookSearch("select * from books");
            	}
            	else{
            		resultset.beforeFirst();
            		
            	}
            }
            int c = resultset.getMetaData().getColumnCount();

            while (resultset.next()) {
                Vector<String> eachRow = new Vector<>(c);
                for (int i = 1; i <= c; i++) {
                    eachRow.add(resultset.getString(i));
                   }
                data.add(eachRow);
            }
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
        return data;
    }
	
	 public Vector<String> getSearchColumns(String query) throws SQLException, ClassNotFoundException
		{
			try{
			ResultSet rst=getConnection().executeQuery(query);
		    int c = rst.getMetaData().getColumnCount();

	        for (int i = 1; i <=c; i++) {
	            column.add(rst.getMetaData().getColumnName(i));
	        }
	    } catch (SQLException sqle) {
	        sqle.printStackTrace();
	    }
	    return column;
		}
	
	
	
	
}
