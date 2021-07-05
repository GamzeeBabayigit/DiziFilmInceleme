package first;

public class tur {
	 protected int id;
	 protected String TurAdi;
	
	 public tur() {
		 
	 }
	    public tur(int id) {
	        this.id = id;
	    }
	 
	   public tur(int id, String TurAdi) {
			// TODO Auto-generated constructor stub
		   this.id=id;
		   this.TurAdi=TurAdi;
		   
		}
	public int getId() {
	        return id;
	    }
	 
	    public void setId(int id) {
	        this.id = id;
	    }
	    public String getTurAdi() {
	        return TurAdi;
	    }
	 
	    public void setTurAdi(String TurAdi) {
	        this.TurAdi = TurAdi;
	    }
	    
}
