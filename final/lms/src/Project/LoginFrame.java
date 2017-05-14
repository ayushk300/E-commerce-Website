/**
 * LoginFrame.java
 * @author Sajjad HTLO
 *
 * This is log-in window that determines two mode of entry, `admin` mode and `user` mode.
 *
 */
package Project;

import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.plaf.nimbus.NimbusLookAndFeel;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.*;

public class LoginFrame extends javax.swing.JFrame implements ActionListener {

	private InitialDB initDB = new InitialDB();
	private String dbUrl = "jdbc:mysql://localhost/";
	private char[] Password;
	private JButton userLoginBtn, ExitBtn, LoginBtn;
	private JLabel ErrorLbl;
	private JLabel lbl1;
	private JLabel lbl2;
	private JLabel lbl3;
	private String[] enterUserInf = new String[4];
	private JPasswordField passwordField;
	private JTextField usernameTF;
	private int adminPassword = 0;
	private AdminModel adminModel = null;
	static String mysqlPassword = null;

	public LoginFrame() { // For first run
		setLookAndFeel();
		setPic(this);
		initDB = new InitialDB();
		initDB.createDataBase(mysqlPassword);// Create and Connect to Database
		initDB.createTables();// Creates tables
		adminModel = new AdminModel();
		initComponents();
		this.getRootPane().setDefaultButton(LoginBtn);
		this.setTitle("Library Management System Login");
		this.setLocation(300, 50);
		this.setResizable(false);
		ErrorLbl.setText("");
	}

	public static void main(String args[]) throws IOException {
		mysqlPassword = JOptionPane.showInputDialog(null,
				"Enter Your MYSQL Password");
		new LoginFrame().setVisible(true); // OK
	}

	private void initComponents() {

		lbl1 = new javax.swing.JLabel();
		lbl2 = new javax.swing.JLabel();
		lbl3 = new javax.swing.JLabel();
		usernameTF = new javax.swing.JTextField("Administration");
		usernameTF.setEditable(false);
		LoginBtn = new javax.swing.JButton();
		userLoginBtn = new javax.swing.JButton();
		ExitBtn = new javax.swing.JButton();
		ErrorLbl = new javax.swing.JLabel();
		passwordField = new javax.swing.JPasswordField();

		setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
		Font font = new Font("Serif", Font.BOLD, 24);
		lbl1.setForeground(new java.awt.Color(0, 51, 102));
		lbl1.setText("Enter Username And Password");
		lbl1.setFont(font);
		lbl2.setText("Username :");
		lbl2.setFont(font);
		lbl3.setText("Password :");
		lbl3.setFont(font);
		LoginBtn.setText("Login");
		font = new Font("Serif", Font.BOLD, 12);
		LoginBtn.setFont(font);
		LoginBtn.setBackground(new Color(0, 0, 255));
		LoginBtn.setForeground(new Color(255, 255, 255));
		LoginBtn.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent evt) {
				LoginButtonActionPerformed(evt);
			}
		});

		userLoginBtn.setText("User Login");
		userLoginBtn.setFont(font);
		userLoginBtn.setBackground(new Color(0, 0, 255));
		userLoginBtn.setForeground(new Color(255, 255, 255));
		userLoginBtn.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent evt) {
				userLoginButtonActionPerformed(evt);
			}
		});

		ExitBtn.setText("Exit");
		ExitBtn.setFont(font);
		ExitBtn.setBackground(new Color(0, 0, 255));
		ExitBtn.setForeground(new Color(255, 255, 255));

		ExitBtn.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent evt) {
				ExitButtonActionPerformed(evt);
			}
		});

		ErrorLbl.setText("                ");

		javax.swing.GroupLayout layout = new javax.swing.GroupLayout(
				getContentPane());
		getContentPane().setLayout(layout);
		layout.setHorizontalGroup(layout
				.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
				.addGroup(
						javax.swing.GroupLayout.Alignment.TRAILING,
						layout.createSequentialGroup()
								.addGap(19, 19, 19)
								.addComponent(ErrorLbl,
										javax.swing.GroupLayout.PREFERRED_SIZE,
										130,
										javax.swing.GroupLayout.PREFERRED_SIZE)
								.addPreferredGap(
										javax.swing.LayoutStyle.ComponentPlacement.RELATED,
										118, Short.MAX_VALUE)
								.addGroup(
										layout.createParallelGroup(
												javax.swing.GroupLayout.Alignment.LEADING)
												.addGroup(
														layout.createSequentialGroup()
																.addComponent(
																		lbl2)
																.addGap(4, 4, 4)
																.addComponent(
																		usernameTF,
																		javax.swing.GroupLayout.PREFERRED_SIZE,
																		130,
																		javax.swing.GroupLayout.PREFERRED_SIZE))
												.addGroup(
														layout.createSequentialGroup()
																.addGap(23, 23,
																		23)
																.addComponent(
																		lbl1))
												.addGroup(
														layout.createSequentialGroup()
																.addGap(2, 2, 2)
																.addComponent(
																		lbl3)
																.addGap(4, 4, 4)
																.addGroup(
																		layout.createParallelGroup(
																				javax.swing.GroupLayout.Alignment.LEADING)
																				.addComponent(
																						passwordField,
																						javax.swing.GroupLayout.PREFERRED_SIZE,
																						130,
																						javax.swing.GroupLayout.PREFERRED_SIZE))))
								.addGap(55, 55, 55))
				.addGroup(
						javax.swing.GroupLayout.Alignment.TRAILING,
						layout.createSequentialGroup()
								.addContainerGap(
										javax.swing.GroupLayout.DEFAULT_SIZE,
										Short.MAX_VALUE)
								.addComponent(userLoginBtn,
										javax.swing.GroupLayout.PREFERRED_SIZE,
										64,
										javax.swing.GroupLayout.PREFERRED_SIZE)
								.addGap(10, 10, 10)
								.addComponent(LoginBtn,
										javax.swing.GroupLayout.PREFERRED_SIZE,
										65,
										javax.swing.GroupLayout.PREFERRED_SIZE)
								.addGap(10, 10, 10)
								.addComponent(ExitBtn,
										javax.swing.GroupLayout.PREFERRED_SIZE,
										65,
										javax.swing.GroupLayout.PREFERRED_SIZE)
								.addGap(42, 42, 42)));
		layout.setVerticalGroup(layout
				.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
				.addGroup(
						layout.createSequentialGroup()
								.addGap(21, 21, 21)
								.addComponent(lbl1)
								.addGap(54, 54, 54)
								.addGroup(
										layout.createParallelGroup(
												javax.swing.GroupLayout.Alignment.LEADING)
												.addGroup(
														layout.createSequentialGroup()
																.addGap(3, 3, 3)
																.addComponent(
																		lbl2))
												.addComponent(
														usernameTF,
														javax.swing.GroupLayout.PREFERRED_SIZE,
														javax.swing.GroupLayout.DEFAULT_SIZE,
														javax.swing.GroupLayout.PREFERRED_SIZE))
								.addGap(12, 12, 12)
								.addGroup(
										layout.createParallelGroup(
												javax.swing.GroupLayout.Alignment.LEADING)
												.addGroup(
														layout.createSequentialGroup()
																.addGap(3, 3, 3)
																.addComponent(
																		lbl3))
												.addComponent(
														passwordField,
														javax.swing.GroupLayout.PREFERRED_SIZE,
														javax.swing.GroupLayout.DEFAULT_SIZE,
														javax.swing.GroupLayout.PREFERRED_SIZE))
								.addGap(35, 35, 35)
								.addGroup(
										layout.createParallelGroup(
												javax.swing.GroupLayout.Alignment.BASELINE)
												.addComponent(
														ErrorLbl,
														javax.swing.GroupLayout.PREFERRED_SIZE,
														14,
														javax.swing.GroupLayout.PREFERRED_SIZE))
								.addGap(29, 29, 29)
								.addGroup(
										layout.createParallelGroup(
												javax.swing.GroupLayout.Alignment.LEADING)
												.addComponent(ExitBtn)
												.addComponent(LoginBtn)
												.addComponent(userLoginBtn))
								.addContainerGap(89, Short.MAX_VALUE)));

		pack();
	}

	private void LoginButtonActionPerformed(java.awt.event.ActionEvent evt) {
		Font font = new Font("Serif", Font.BOLD, 18);
		try {
			Password = passwordField.getPassword();

			if (!passwordControl()) {
				return;
			}

			if (initDB.adminLoginIsEmpty()) { // Empty admin Login password
				adminPassword = Integer.parseInt(JOptionPane.showInputDialog(
						null,

						"Admin,Select You Password(just Numbers)",
						"Initialize Admin Password",
						JOptionPane.WARNING_MESSAGE));
				adminModel.insertIntoAdminLogin(adminPassword);
				JOptionPane.showMessageDialog(null,
						"Password saved successfully", "First Admin Password",
						JOptionPane.INFORMATION_MESSAGE);
			}
			if (adminModel.adminEnterCondition(Password)) {
				this.setVisible(false);
				new MainFrame().setVisible(true);
			} else {
				new Error().showError(this, "Entered wrong password !",
						"Password error");
				passwordField.setText("");
			}
		} catch (Exception e) {
			new Error().showError(this, "Entered wrong input !", "Input error");
			usernameTF.setText("");
			passwordField.setText("");
			e.printStackTrace();
		}
	}

	private void ExitButtonActionPerformed(java.awt.event.ActionEvent evt) {
		System.exit(0);
	}

	private void userLoginButtonActionPerformed(java.awt.event.ActionEvent evt) {
		userlogin userlogin = new userlogin();
		this.dispose();
	}

	public boolean passwordControl() {
		Password = passwordField.getPassword();
		if (String.valueOf(Password).trim().isEmpty()) {
			new Error().showError(this, "Password can't be empty !",
					"Enter password");
			return false;
		}
		return true;
	}

	public boolean userEnterCondition(char[] pass) {
		ResultSet rs;
		String selectDBQuery = "USE " + initDB.getDataBaseName();
		String selectUsersQuery = "Select * from Users";
		String password = null;
		PreparedStatement ps = null;
		Statement selectDBst = null;

		try (Connection con = DriverManager.getConnection(
				dbUrl + initDB.getDataBaseName(), "root",
				initDB.getMysqlPassword());) {
			Class.forName("com.mysql.jdbc.Driver");
			selectDBst = con.createStatement();
			selectDBst.execute(selectDBQuery);
			ps = con.prepareStatement(selectUsersQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				password = rs.getString("User_ID");
				if (password.equalsIgnoreCase(String.valueOf(pass))) {
					// fetch user more information
					enterUserInf = getUserInfo(String.valueOf(pass));
					return true;
				}
			}
		} catch (SQLException sqle) {
			JOptionPane.showMessageDialog(this, "There is an sql exception");
			sqle.printStackTrace();
			return false;
		} catch (ClassNotFoundException cnfe) {
			JOptionPane.showMessageDialog(this, "Can not find JDBC Class");
			cnfe.printStackTrace();
		}
		new Error()
				.showError(this, "Enter correct user id !", "Invalid userId");
		return false;
	}

	public String[] getUserInfo(String userID) {
		String[] userInfo = new String[4];
		ResultSet rs;
		String query = "Select * from users where User_ID = ?";
		try (Connection con = DriverManager.getConnection(
				dbUrl + initDB.getDataBaseName(), "root",
				initDB.getMysqlPassword());
				PreparedStatement ps = con.prepareStatement(query);) {
			ps.setString(1, userID);
			rs = ps.executeQuery();
			while (rs.next()) {
				userInfo[0] = rs.getString("User_ID");
				userInfo[1] = rs.getString("First_Name");
				userInfo[2] = rs.getString("Last_Name");
				userInfo[3] = rs.getString("Gender");
			}
		} catch (SQLException sqle) {
		}
		return userInfo;
	}

	@Override
	public void actionPerformed(ActionEvent e) {

	}

	private void setLookAndFeel() {
		try {
			UIManager.setLookAndFeel(new NimbusLookAndFeel());
		} catch (UnsupportedLookAndFeelException lfe) {
		}
	}

	public static void setPic(JFrame jframe) {
		try {
			File f = new File(
					"C:\\Users\\Amit\\Documents\\workspace\\lms\\src\\Project\\pics\\lms4.jpg");
			BufferedImage img = ImageIO.read(f);
			jframe.setContentPane(new SetMyImage(img, 10, 70));
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
}
