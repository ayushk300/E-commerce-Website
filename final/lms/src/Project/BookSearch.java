package Project;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.GridLayout;
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

import javax.imageio.ImageIO;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.ListSelectionModel;
import javax.swing.RowFilter;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.table.TableModel;
import javax.swing.table.TableRowSorter;

public class BookSearch extends JFrame implements ActionListener {

	private final JTable table;
	private Vector<String> column = new Vector<>();
	private Vector<Vector<String>> data = new Vector<>();
	private UserModel uModel;
	private UserModel uModel1;
	private final TableRowSorter sorter;
	private JTextField filterTF;
	private JLabel filterLbl;
	JTextField searchTf;
	JButton searchBtn;
	JLabel message;
	static String toBeSearched = "";
	String fixedQuery = "select * from books WHERE BOOK_NAME LIKE '";
	String Squery = "";
	static boolean toBeDisposed;

	public BookSearch(String query) throws ClassNotFoundException, SQLException {
		uModel1 = new UserModel();
		uModel = new UserModel(uModel1.getSearchBookData(query, this),
				uModel1.getSearchColumns(query));
		sorter = new TableRowSorter<TableModel>(uModel);
		table = new JTable(uModel);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		table.setRowSorter(sorter);
		searchTf = new JTextField(10);
		message = new JLabel("this is message");
		add(new JScrollPane(table), BorderLayout.CENTER);
		add(panelform(), BorderLayout.PAGE_START);
		// add(message);

		this.setTitle("Search A Book");
		searchBtn.addActionListener(this);
		this.setVisible(true);
		this.setBounds(200, 100, 600, 500);
	}

	public static void main(String[] args) throws ClassNotFoundException,
			SQLException {
		BookSearch bs = new BookSearch("select * from books");
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		try {

			toBeSearched = searchTf.getText().toString();
			Squery = fixedQuery + toBeSearched + "%'";
			this.dispose();
			this.finalize();
			BookSearch bs = new BookSearch(Squery);
			if (toBeDisposed) {
				this.dispose();
				this.finalize();
				toBeDisposed = false;
			}

		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Throwable e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}

	public JPanel panelform() {
		JPanel panel = new JPanel(new FlowLayout(FlowLayout.LEFT));
		filterTF = new JTextField(10);
		filterLbl = new JLabel("(Search for Books)");

		searchBtn = new JButton();
		searchBtn.setText("Search");
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

		panel.add(searchTf);
		panel.add(searchBtn);
		return panel;
	}
}
