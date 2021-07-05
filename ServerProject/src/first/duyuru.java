package first;

public class duyuru {

	protected int id;
    protected String Baslik;
    protected String icerik;
    protected String date;
 
	public duyuru() {
		
	}
	 public duyuru(int id) {
	        this.id = id;
	    }
	  
	    public duyuru(int id,String Baslik, String icerik) {
	    	 
	    	this.id = id;
	        this.Baslik = Baslik;
	        this.icerik = icerik;
	    }
	    public duyuru(int id, String Baslik) {
	    	
	    	this.id = id;
	    	this.Baslik = Baslik;
	    }
	    public duyuru(int id,String Baslik, String icerik, String date) {
	    	this.id = id;
	        this.Baslik = Baslik;
	        this.icerik = icerik;
	        this.date = date;
	       
	    }
	 
	    public int getId() {
	        return id;
	    }
	 
	    public void setId(int id) {
	        this.id = id;
	    }
	    
	    public String getBaslik() {
	        return Baslik;
	    }
	 
	    public void setBaslik(String Baslik) {
	        this.Baslik = Baslik;
	    }
	    public String geticerik() {
	        return icerik;
	    }
	 
	    public void seticerik(String icerik) {
	        this.icerik = icerik;
	    }
	    public String getdate() {
	        return date;
	    }
	 
	    public void setdate(String date) {
	        this.date = date;
	    }
}
