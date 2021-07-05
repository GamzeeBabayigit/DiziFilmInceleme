package first;

 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class Database {
	private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;
 
	
	public void start() {
        this.jdbcURL = "jdbc:mysql://localhost:3306/first?useUnicode=yes&characterEncoding=UTF-8&useLegacyDatetimeCode=false&serverTimezone=Turkey";
        this.jdbcUsername = "root";
        this.jdbcPassword = "1234";
    } 
	
	 protected void connect() throws SQLException {
	        if (jdbcConnection == null || jdbcConnection.isClosed()) {
	            try {
	                Class.forName("com.mysql.jdbc.Driver");
	            } catch (ClassNotFoundException e) {
	                throw new SQLException(e);
	            }
	            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	        }
	    }
	     
	    protected void disconnect() throws SQLException {
	        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
	            jdbcConnection.close();
	        }
	    }
	 
 
	    
	    public boolean insertDuyuru(duyuru duyuru) throws SQLException {
	        
	        String sql = "INSERT INTO duyuru (id,Baslik, icerik, date) VALUES (?,?, ?, ?)";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, duyuru.getId());
	        statement.setString(2, duyuru.getBaslik());
	        statement.setString(3, duyuru.geticerik());
	        statement.setString(4, duyuru.getdate());
	        boolean rowInserted = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowInserted;	        
	    } 
	    
	    public boolean inserticerik(icerik iceriks) throws SQLException {
	        
	        String sql = "INSERT INTO icerik (id,Baslik, icerik, YapimYili, Oyuncular,Tur, Kategori, Gorsel, Yazar) VALUES (?,?, ?, ?, ?, ?, ?, ?, ?)";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, iceriks.getId());
	        statement.setString(2, iceriks.getBaslik());
	        statement.setString(3, iceriks.geticerik());
	        statement.setString(4, iceriks.getYapimYili());
	        statement.setString(5, iceriks.getOyuncular());
	        statement.setString(6, iceriks.getTur());
	        statement.setString(7, iceriks.getKategori());
	        statement.setString(8, iceriks.getGorsel());
	        statement.setString(9, iceriks.getYazar());
	        boolean rowInserted = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowInserted;	        
	    } 
	    
	    
		public boolean insertTur(tur tur) throws SQLException {
			        
			        String sql = "INSERT INTO tur(id,TurAdi) VALUES (?,?)";
			        connect();
			        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
			        statement.setInt(1, tur.getId());
			        statement.setString(2, tur.getTurAdi());
			        boolean rowInserted = statement.executeUpdate() > 0;
			        statement.close();
			        disconnect();
			        return rowInserted;
			    }
	    
		 public boolean insertKategori(kategori kategori) throws SQLException {
		        
		        String sql = "INSERT INTO kategori(id,KategoriAdi) VALUES (?,?)";
		        connect();
		        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
		        statement.setInt(1, kategori.getId());
		        statement.setString(2, kategori.getKategoriAdi());
		     
		        boolean rowInserted = statement.executeUpdate() > 0;
		        statement.close();
		        disconnect();
		        return rowInserted;
		  
		    }
		 
		 
	    public login getkayit(String email) throws SQLException {
	    	login user = null;
	        String sql = "SELECT * FROM login WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, email);
	       
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            String emaili = resultSet.getString("email");
	            String pas = resultSet.getString("pass");
	            String yetki = resultSet.getString("yetki");
	            int id = resultSet.getInt("id");
	          
	            user = new login(emaili,pas,yetki,id);
	        }
	    
	        resultSet.close();
	        statement.close();
	        return user;
	    }
	    
	    public login getkayit2(String email) throws SQLException {
	    	login user = null;
	        String sql = "SELECT * FROM login WHERE email = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, email);
	       
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            String emaili = resultSet.getString("email");
	            String pas = resultSet.getString("pass");
	            String yetki = resultSet.getString("yetki");
	            int id = resultSet.getInt("id");
	          
	            user = new login(emaili,pas,yetki,id);
	        }
	    
	        resultSet.close();
	        statement.close();
	        return user;
	    }
	    
	    public boolean kayit(login log) throws SQLException {
	        
	        String sql = "INSERT INTO login (email,pass,yetki) VALUES (?,?,?)";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1,log.getEmail());
	        statement.setString(2, log.getPass());
	        statement.setString(3,"0");
	        boolean rowInserted = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowInserted;
	        
	    }
	    public login getlogin(String email,String pass) throws SQLException {
	    	login user = null;
	        String sql = "SELECT * FROM login WHERE email = ? && pass=?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, email);
	        statement.setString(2, pass);
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            String emaili = resultSet.getString("email");
	            String pas = resultSet.getString("pass");
	            String yetki = resultSet.getString("yetki");
	            int id = resultSet.getInt("id");
	           
	          
	            user = new login(email,pas,yetki,id);
	        }
	    
	        resultSet.close();
	        statement.close();
	        return user;
	    }
	    
	    public login getmail(String email) throws SQLException {
	    	login user = null;
	        String sql = "SELECT * FROM login WHERE email = ?  ";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, email);
	        
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            String emaili = resultSet.getString("email");
	     
	            int id = resultSet.getInt("id");
	           
	          
	            user = new login(email,id);
	        }
	    
	        resultSet.close();
	        statement.close();
	        return user;
	    }
	    
 
	    
	    public List<login> loginara(String emaila) throws SQLException {
	        List<login> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM login WHERE email like ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, "%"+emaila+"%");
	       
	        ResultSet resultSet = statement.executeQuery();
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String email = resultSet.getString("email");
	            String pass = resultSet.getString("pass");
	     
	            login book = new login(id, email,pass);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    
	    public List<kategori> kategoriara (String emaila) throws SQLException {
	        List<kategori> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM kategori WHERE KategoriAdi like ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, "%"+emaila+"%");
	       
	        ResultSet resultSet = statement.executeQuery();
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String kategoriadi = resultSet.getString("KategoriAdi");
	     
	            kategori book = new kategori(id, kategoriadi);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    
	    public List<duyuru> duyuruara (String emaila) throws SQLException {
	        List<duyuru> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM duyuru WHERE Baslik like ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, "%"+emaila+"%");
	       
	        ResultSet resultSet = statement.executeQuery();
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String Baslik = resultSet.getString("Baslik");
	     
	            duyuru book = new duyuru(id, Baslik);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    
	    
	    public List<login> mailara(String emaila) throws SQLException {
	        List<login> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM login WHERE email like ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, "%"+emaila+"%");
	       
	        ResultSet resultSet = statement.executeQuery();
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String email = resultSet.getString("email");
	            String pass = resultSet.getString("pass");
 	            login book = new login(id, email, pass);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    
	    public List<icerik> icerikara(String searchin) throws SQLException{
	    	List<icerik> listBook = new ArrayList<>();
	    	String sql = "SELECT * FROM icerik WHERE Baslik like ?";
	    	connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, "%"+searchin+"%");
	        
	        ResultSet resultSet = statement.executeQuery();
	        while(resultSet.next()) {
	        	int id = resultSet.getInt("id");
	            String Baslik = resultSet.getString("Baslik");
	            String icerik = resultSet.getString("icerik");
	            String YapimYili = resultSet.getString("YapimYili");
	            String Oyuncular = resultSet.getString("Oyuncular");
	            String Kategori = resultSet.getString("Kategori");
	            String Tur = resultSet.getString("Tur");
	            String Gorsel = resultSet.getString("Gorsel");
	            String Yazar = resultSet.getString("Yazar");
	            icerik book = new icerik(id, Baslik, icerik, YapimYili,Oyuncular, Kategori, Tur, Gorsel, Yazar);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    
 
	 
	    public List<login> listAllLogin() throws SQLException {
	    	List<login> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM login";
	        connect();
	        Statement statement = jdbcConnection.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String email = resultSet.getString("email");
	            String pass = resultSet.getString("pass");
	          
	            login book = new login(id, email,pass);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    
	    public List<duyuru> listAllDuyurus() throws SQLException {
	    	List<duyuru> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM duyuru ORDER BY id DESC";
	        connect();
	        Statement statement = jdbcConnection.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String Baslik = resultSet.getString("Baslik");
	            String icerik = resultSet.getString("icerik");
	            String date = resultSet.getString("date");
	            
	            duyuru book = new duyuru(id, Baslik,icerik,date);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    public List<icerik> listAlliceriks() throws SQLException {
	    	List<icerik> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM icerik";
	        connect();
	        Statement statement = jdbcConnection.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String Baslik = resultSet.getString("Baslik");
	            String icerik = resultSet.getString("icerik");
	            String YapimYili = resultSet.getString("YapimYili");
	            String Oyuncular = resultSet.getString("Oyuncular");
	            String Tur = resultSet.getString("Tur");
	            String Kategori = resultSet.getString("Kategori");
	            String Gorsel = resultSet.getString("Gorsel");
	            String Yazar = resultSet.getString("Yazar");
	            icerik book = new icerik(id,Baslik,icerik,YapimYili, Oyuncular,Tur,Kategori,Gorsel,Yazar);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    public List<icerik> listAlliceriksFilm() throws SQLException {
	    	List<icerik> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM icerik WHERE Kategori='Film' ORDER BY id DESC";
	        connect();
	        Statement statement = jdbcConnection.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String Baslik = resultSet.getString("Baslik");
	            String icerik = resultSet.getString("icerik");
	            String YapimYili = resultSet.getString("YapimYili");
	            String Oyuncular = resultSet.getString("Oyuncular");
	            String Tur = resultSet.getString("Tur");
	            String Kategori = resultSet.getString("Kategori");
	            String Gorsel = resultSet.getString("Gorsel");
	            String Yazar = resultSet.getString("Yazar");
	            icerik book = new icerik(id,Baslik,icerik,YapimYili, Oyuncular,Tur,Kategori,Gorsel,Yazar);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    public List<icerik> listAlliceriksDizi() throws SQLException {
	    	List<icerik> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM icerik WHERE Kategori='Dizi' ORDER BY id DESC ";
	        connect();
	        Statement statement = jdbcConnection.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String Baslik = resultSet.getString("Baslik");
	            String icerik = resultSet.getString("icerik");
	            String YapimYili = resultSet.getString("YapimYili");
	            String Oyuncular = resultSet.getString("Oyuncular");
	            String Tur = resultSet.getString("Tur");
	            String Kategori = resultSet.getString("Kategori");
	            String Gorsel = resultSet.getString("Gorsel");
	            String Yazar = resultSet.getString("Yazar");
	            icerik book = new icerik(id,Baslik,icerik,YapimYili, Oyuncular,Tur,Kategori,Gorsel,Yazar);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    public List<tur> listAllTurs() throws SQLException {
	        List<tur> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM tur";
	        connect();
	        Statement statement = jdbcConnection.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String TurAdi = resultSet.getString("TurAdi");
	            
	            tur book = new tur(id, TurAdi);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    public List<kategori> listAllKategoris() throws SQLException {
	        List<kategori> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM kategori";
	        connect();
	        Statement statement = jdbcConnection.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	        while (resultSet.next()) {
	            int id = resultSet.getInt("id");
	            String KategoriAdi = resultSet.getString("KategoriAdi");
	            
	            kategori book = new kategori(id, KategoriAdi);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    
	    public boolean deleteUser(login user) throws SQLException {
	        String sql = "DELETE FROM login where id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, user.getId());
	        boolean rowDeleted = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowDeleted;     
	    }
	    public boolean deleteduyuru(duyuru duyuru) throws SQLException {
	        String sql = "DELETE FROM duyuru where id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, duyuru.getId());
	        boolean rowDeleted = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowDeleted;     
	    }
	    public boolean deleteicerik(icerik icerik) throws SQLException {
	        String sql = "DELETE FROM icerik where id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, icerik.getId());
	        boolean rowDeleted = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowDeleted;     
	    }
	    public boolean deleteTur(tur tur) throws SQLException {
	        String sql = "DELETE FROM tur where id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, tur.getId());
	        boolean rowDeleted = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowDeleted;     
	    }
	    public boolean deleteKategori(kategori kategori) throws SQLException {
	        String sql = "DELETE FROM kategori where id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, kategori.getId());
	        boolean rowDeleted = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowDeleted;     
	    }
	    
	    public boolean updateUser(login user) throws SQLException {
	        String sql = "UPDATE login SET email = ?, pass = ?";
	        sql += " WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, user.getEmail());
	        statement.setString(2, user.getPass());
	        statement.setInt(3, user.getId());
	        boolean rowUpdated = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowUpdated;     
	    }
	    
	    public boolean updateduyuru(duyuru duyuru) throws SQLException {
	        String sql = "UPDATE duyuru SET Baslik = ?, icerik = ?";
	        sql += " WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, duyuru.getBaslik());
	        statement.setString(2, duyuru.geticerik());
	        statement.setInt(3, duyuru.getId());
	        boolean rowUpdated = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowUpdated;     
	    }
	    public boolean updateTur(tur tur) throws SQLException {
	        String sql = "UPDATE tur SET TurAdi = ?";
	        sql += " WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, tur.getTurAdi());
	        statement.setInt(2, tur.getId());
	        boolean rowUpdated = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowUpdated;     
	    }
	    
	    public boolean updateicerik(icerik icerik) throws SQLException {
	        String sql = "UPDATE icerik SET Baslik = ?, icerik = ?, YapimYili = ?, Oyuncular = ?, Tur = ?, Kategori = ?, Gorsel = ?, Yazar = ?";
	        sql += " WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, icerik.getBaslik());
	        statement.setString(2, icerik.geticerik());
	        statement.setString(3, icerik.getYapimYili());
	        statement.setString(4, icerik.getOyuncular());
	        statement.setString(5, icerik.getTur());
	        statement.setString(6, icerik.getKategori());
	        statement.setString(7, icerik.getGorsel());
	        statement.setString(8, icerik.getYazar());
	        statement.setInt(9, icerik.getId());
	        boolean rowUpdated = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowUpdated;     
	    }
	    public boolean updateKategori(kategori kategori) throws SQLException {
	        String sql = "UPDATE kategori SET KategoriAdi = ?";
	        sql += " WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, kategori.getKategoriAdi());
	        statement.setInt(2, kategori.getId());
	        boolean rowUpdated = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowUpdated;     
	    }
	    
	    public login getUser(int id) throws SQLException {
	    	login user = null;
	        String sql = "SELECT * FROM login WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, id);
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            String email = resultSet.getString("email");
	            String pass = resultSet.getString("pass");
	         
	            user = new login(id,email, pass);
	        }
	        resultSet.close();
	        statement.close();
	        return user;
	    }
	    
	    
	    
	    public duyuru getduyuru(int id) throws SQLException {
	    	duyuru duyuru = null;
	        String sql = "SELECT * FROM duyuru WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, id);
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            String Baslik = resultSet.getString("Baslik");
	            String icerik = resultSet.getString("icerik");
	            duyuru = new duyuru(id,Baslik, icerik);
	        }
	        resultSet.close();
	        statement.close();
	        return duyuru;
	    }
	    public icerik geticerik(int id) throws SQLException {
	    	icerik iceriks = null;
	        String sql = "SELECT * FROM icerik WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, id);
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            String Baslik = resultSet.getString("Baslik");
	            String icerik = resultSet.getString("icerik");
	            String YapimYili = resultSet.getString("YapimYili");
	            String Oyuncular = resultSet.getString("Oyuncular");
	            String Tur = resultSet.getString("Tur");
	            String Kategori = resultSet.getString("Kategori");
	            String Gorsel = resultSet.getString("Gorsel");
	            String Yazar = resultSet.getString("Yazar");
	            iceriks = new icerik(id,Baslik,icerik,YapimYili, Oyuncular,Tur,Kategori,Gorsel,Yazar);
	        }
	        resultSet.close();
	        statement.close();
	        return iceriks;
	    }
	    
	    public tur getTur(int id) throws SQLException {
	    	tur tur = null;
	        String sql = "SELECT * FROM tur WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, id);
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            String TurAdi = resultSet.getString("TurAdi");
	        
	            tur = new tur(id, TurAdi);
	        }
	       

	        resultSet.close();
	        statement.close();
	        return tur;
	    }
	    
	    public kategori getKategori(int id) throws SQLException {
	    	kategori kategori = null;
	        String sql = "SELECT * FROM kategori WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setInt(1, id);
	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            String KategoriAdi = resultSet.getString("KategoriAdi");
	            kategori = new kategori(id, KategoriAdi);
	        }
	        resultSet.close();
	        statement.close();
	        return kategori;
	    }
	    

	    public List<login> sifredegistir(String emaila) throws SQLException {
	        List<login> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM login WHERE email=?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, emaila);
	       
	        ResultSet resultSet = statement.executeQuery();
	        while (resultSet.next()) {
	            
	         	String email = resultSet.getString("email");
	             String pas = resultSet.getString("pass");
	             String yetki = resultSet.getString("yetki");
	             int id = resultSet.getInt("id");
	            
	             login book = new first.login(email,pas,yetki,id);
	             listBook.add(book);
	         }
	         resultSet.close();
	         statement.close();
	         disconnect();
	         return listBook;
	    }
	    public boolean updatesifrek(login user) throws SQLException {
	        String sql = "UPDATE login SET pass=?";
	        sql += " WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, user.getPass());
	        statement.setInt(2, user.getId());
	        
	        boolean rowUpdated = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowUpdated;     
	    }
	    

	    public login yetkibak(String email) throws SQLException {
	   	 	login user = null;
	   	     String sql = "SELECT * FROM login WHERE email = ?";
	   	     connect();
	   	     PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	   	     statement.setString(1, email);
	   	    
	   	     ResultSet resultSet = statement.executeQuery();
	   	     if (resultSet.next()) {
	   	    		String emaili = resultSet.getString("email");
	   	            String pas = resultSet.getString("pass");
	   	            String yetki = resultSet.getString("yetki");
	   	            int id = resultSet.getInt("id");
	   	         user = new first.login(emaili,pas,yetki,id);
	   	     }
	   	 
	   	     resultSet.close();
	   	     statement.close();
	   	     return user;
	   	 }
	    public boolean yetkiupdate(login user) throws SQLException {
	   	 System.out.print(user.getId());
	        String sql = "UPDATE login SET yetki = ?";
	        sql += " WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, "1");
	        statement.setInt(2, user.getId());
	        boolean rowUpdated = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowUpdated;     
	    }
	    
	    public boolean yetkiupdate1(login user) throws SQLException {
	   	 System.out.print(user.getId());
	        String sql = "UPDATE login SET yetki = ?";
	        sql += " WHERE id = ?";
	        connect();
	        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
	        statement.setString(1, "0");
	        statement.setInt(2, user.getId());
	        boolean rowUpdated = statement.executeUpdate() > 0;
	        statement.close();
	        disconnect();
	        return rowUpdated;     
	    }
	    
	    public List<login> yetkilist() throws SQLException {
	        List<login> listBook = new ArrayList<>();
	        String sql = "SELECT * FROM login";
	        connect();
	        Statement statement = jdbcConnection.createStatement();
	        ResultSet resultSet = statement.executeQuery(sql);
	        while (resultSet.next()) {
	          
	        	String email = resultSet.getString("email");
	            String pas = resultSet.getString("pass");
	            String yetki = resultSet.getString("yetki");
	            int id = resultSet.getInt("id");
	           
	            login book = new first.login(email,pas,yetki,id);
	            listBook.add(book);
	        }
	        resultSet.close();
	        statement.close();
	        disconnect();
	        return listBook;
	    }
	    
}
