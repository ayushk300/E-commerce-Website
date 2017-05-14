
/**
* SetMyImage.java
* @author Sajjad HTLO
*
* This is a utility class for displaying an image on a JPanel.
*
*/

package Project;

import java.awt.BorderLayout;
import java.awt.Graphics;
import java.awt.Image;
import javax.swing.JPanel;

public class SetMyImage extends JPanel {

    private final Image img;
    private final int x;
    private final int y;

    public SetMyImage(Image img,int x,int y) {
        this.img = img;
        this.x=x;
        this.y=y;
        this.setLayout(new BorderLayout());
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.drawImage(img,this.x,this.y,null);
    }
}
