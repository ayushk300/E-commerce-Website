package Project;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
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
import java.util.Vector;
import java.util.regex.PatternSyntaxException;

import javax.imageio.ImageIO;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.RowFilter;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.plaf.nimbus.NimbusLookAndFeel;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

public class UserHomePage extends JFrame implements ActionListener {

	private final JTable table;
	private Vector<String> column = new Vector<>();
	private Vector<Vector<String>> data = new Vector<>();
	private final UserModel uModel, uModel1;
	private final TableRowSorter sorter;
	private JButton searchBtn, logoutBtn;
	private JButton passwordChangeBtn;
	private JTextField filterTF;
	private JLabel filterLbl;
	private JLabel nameLbl,issueMessageLbl;
	ResultSet resultset = null;
	private final String query = "select * from books WHERE book_id IN (select book_id from borrowed WHERE user_id="
			+ userlogin.userid + " AND BORROW_STATUS='Yes' )";

	public UserHomePage() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated constructor stub
		this.setTitle("User Page");
		
		
		uModel1 = new UserModel();
		uModel = new UserModel(uModel1.getBorrowedBooksData(query),
				uModel1.getIssuedBooksColumns(query));
		
		sorter = new TableRowSorter<TableModel>(uModel);
		table = new JTable(uModel);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		table.setRowSorter(sorter);

		
		add(panelform(), BorderLayout.PAGE_START);
		if(userlogin.noBooksIssued){
			issueMessageLbl=new JLabel(userlogin.issuemessage);
			issueMessageLbl.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 26));
			issueMessageLbl.setForeground(Color.RED);
			add(issueMessageLbl);
			this.setBounds(500, 200, 100, 100);
			this.setResizable(false);
		}
		else{
			this.setBounds(500, 200, 600, 500);
			add(new JScrollPane(table), BorderLayout.CENTER);
		}
//		this.setVisible(true);
		RowFilter<UserModel, Object> rf = null;
		/*
		 * try { rf = RowFilter.regexFilter(filterTF.getText(), 0); } catch
		 * (PatternSyntaxException pse) { return; }
		 */
		// sorter.setRowFilter(rf);

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setSize(950, 600);
		setLocation(270, 80);
		setVisible(true);
	}

	public static void main(String[] main) throws ClassNotFoundException,
			SQLException {
		UserHomePage usr = new UserHomePage();

	}

	public JPanel panelform() {
		JPanel panel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
		filterTF = new JTextField(10);
		nameLbl = new JLabel("Welcome " + userlogin.fname + " "
				+ userlogin.lname + "  !");
		nameLbl.setFont(new Font("Arial", Font.BOLD, 20));
		nameLbl.setForeground(Color.BLUE);
		
		searchBtn = new JButton("Search Books");
		searchBtn.setForeground(Color.WHITE);
		searchBtn.setBackground(Color.blue);
		passwordChangeBtn = new JButton("Change Password");
		passwordChangeBtn.setForeground(Color.WHITE);
		passwordChangeBtn.setBackground(Color.blue);
		new JButton("Logout");
		searchBtn.addActionListener(this);
		passwordChangeBtn.addActionListener(this);
		logoutBtn=new JButton("Logout");
		logoutBtn.setForeground(Color.WHITE);
		logoutBtn.setBackground(Color.blue);
		logoutBtn.addActionListener(this);
		filterTF.getDocument().addDocumentListener(new DocumentListener() {
			@Override
			public void insertUpdate(DocumentEvent e) {
				String key = filterTF.getText();
				if (key.length() == 0) {
					sorter.setRowFilter(null);
				} else {
					sorter.setRowFilter(RowFilter.regexFilter(key, 1));
				}
			}

			@Override
			public void changedUpdate(DocumentEvent arg0) {
				// TODO Auto-generated method stub

			}

			@Override
			public void removeUpdate(DocumentEvent arg0) {
				// TODO Auto-generated method stub

			}

		});

		panel.add(searchBtn);
		panel.add(new JLabel(
				"                                                                                                                                           "));
		panel.add(passwordChangeBtn);
		panel.add(nameLbl);
		panel.add(logoutBtn);
		return panel;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if (e.getActionCommand().equalsIgnoreCase("Logout")) {
			userlogin.fname="";
			userlogin.lname="";
			this.dispose();
			new LoginFrame().setVisible(true);
		}
		if (e.getActionCommand().equalsIgnoreCase("Search Books")) {
			try {
				BookSearch bookSearch = new BookSearch("select * from books");
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		if (e.getActionCommand().equalsIgnoreCase("Change Password")) {
			String newPassword = JOptionPane.showInputDialog(null,
					"Enter Your New Password");
			if (newPassword.equalsIgnoreCase("") || newPassword==null) {
				Error error = new Error();
				error.showError(this, "Password can't be empty",
						"No password entered");
				return;
			} else {
				newPassword = MD5.getMD5(newPassword);
				try {
					Class.forName("com.mysql.jdbc.Driver");

					Connection con = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/lib", "root", "root");
					Statement statement = con.createStatement();
					int rows = statement
							.executeUpdate("update users SET password='"
									+ newPassword + "' WHERE USER_ID="
									+ userlogin.userid);
					if (rows == 1) {
						Error error = new Error();
						error.showError(
								this,
								"Password successfully updated ! Please login again ",
								"Password Updated");
						this.dispose();
						userlogin userlogin=new userlogin();
						return;
					}
					if (rows == 0) {
						Error error = new Error();
						error.showError(
								this,
								"Password can't be updated ! Please try again ",
								"Update Failed");
						return;
					}
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}
	}

	

}
