package Project;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

public class Error {
public void showError(JFrame frame,String errorMessage,String dialogTitle)
{
	JOptionPane.showMessageDialog(frame,errorMessage,dialogTitle,JOptionPane.WARNING_MESSAGE);
}

}
