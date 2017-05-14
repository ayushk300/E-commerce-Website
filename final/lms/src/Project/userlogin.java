package Project;

import java.awt.Color;
import java.awt.Component;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.LayoutManager;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class userlogin extends JFrame implements ActionListener{
	
	JLabel useridLbl;
	JLabel password;
	JTextField useridTf;
	JPasswordField passTf;
	JButton submitBtn,cancelBtn;
	static int userid;
	static String fname;
	static String lname;
	static String issuemessage;
	static boolean noBooksIssued=true;
	
	public userlogin() {
		// TODO Auto-generated constructor stub
		
		setTitle("User Login");
		useridLbl=new JLabel();
		useridLbl.setText("Enter UserId");
		password=new JLabel();
		password.setText("Enter password");
		useridTf=new JTextField();
		passTf=new JPasswordField();
		submitBtn=new JButton("Login");
		submitBtn.addActionListener(this);
		submitBtn.setForeground(Color.WHITE);
		submitBtn.setBackground(Color.blue);
		cancelBtn=new JButton("Cancel");
		cancelBtn.addActionListener(this);
		cancelBtn.setForeground(Color.WHITE);
		cancelBtn.setBackground(Color.blue);
		setLayout(new GridLayout(3, 1));
		JPanel userpanel=new JPanel();userpanel.setLayout(new GridLayout(2,3));
		JPanel passpanel=new JPanel();passpanel.setLayout(new GridLayout(2,3));
		JPanel submitpanel=new JPanel();submitpanel.setLayout(new GridLayout(2,3));
		userpanel.add(new JLabel());userpanel.add(useridLbl);userpanel.add(new JLabel());userpanel.add(new JLabel());userpanel.add(useridTf);
		passpanel.add(new JLabel());passpanel.add(password);passpanel.add(new JLabel());passpanel.add(new JLabel());passpanel.add(passTf);
		submitpanel.add(new JLabel());submitpanel.add(new JLabel());submitpanel.add(new JLabel());
		submitpanel.add(submitBtn);submitpanel.add(new JLabel());submitpanel.add(cancelBtn);
		add(userpanel);
		add(passpanel);
		add(submitpanel);
	this.setBackground(new Color(152, 100,100));
		this.setBounds(400, 300, 300,200);
		this.setVisible(true);
	}
	public static void main(String[] args)
	{
		userlogin u=new userlogin();
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getActionCommand().equalsIgnoreCase("cancel"))
		{
			this.dispose();
			new LoginFrame().setVisible(true); // OK
			return;
		}
		String tempuserid=useridTf.getText();
		
		String password=passTf.getText();
		if(tempuserid.equalsIgnoreCase("") || password.equalsIgnoreCase(""))
		{
			Error error=new Error();
			error.showError(this, "Please fill all the details", "Fill Details");
			return;
		}
		
		try{
		userid=Integer.parseInt(tempuserid);
		}
		catch(Exception exception)
		{
			Error error=new Error();
			error.showError(this, "Please correct userid !", "Invalid UserID");
			return;
		}
		
		password=MD5.getMD5(password);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/lib", "root", "root");
			Statement statement=con.createStatement();
			ResultSet resultSet=statement.executeQuery("select * from users WHERE USER_ID="+userid+" AND password='"+password+"'");
			if(resultSet!=null)
			{
				resultSet.next();
				int rows=resultSet.getRow();
				if(rows>0)
				{
					this.dispose();
					fname=resultSet.getString("FIRST_NAME");
					lname=resultSet.getString("LAST_NAME");
					UserHomePage userHomePage=new UserHomePage();
					
				}
				else{
					Error error=new Error();
					error.showError(this, "Username and password do not match !", "Login Failed");
				}
				
			}
			else{
				Error error=new Error();
				error.showError(this, "There was an error connecting to database", "Error");
			}
		}
		catch(Exception sqlException)
		{
			sqlException.printStackTrace();
		}
	}
	public void setPic(JFrame jframe) {
        try {
            File f = new File("C:\\Users\\Amit\\Documents\\workspace\\lms\\src\\Project\\pics\\lms3.jpg");
            BufferedImage img = ImageIO.read(f);
            jframe.setContentPane(new SetMyImage(img,40,40));
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
    }

}
