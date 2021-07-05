package first;

public class kategori {
	 protected int id;
	 protected String KategoriAdi;
		public kategori() {
				 
			 }
	    public kategori(int id) {
	        this.id = id;
	    }
	 
	   public kategori(int id, String KategoriAdi) {
			// TODO Auto-generated constructor stub
		   this.id=id;
		   this.KategoriAdi=KategoriAdi;
		   
		   
		}
	public int getId() {
	        return id;
	    }
	 
	    public void setId(int id) {
	        this.id = id;
	    }
	    public String getKategoriAdi() {
	        return KategoriAdi;
	    }
	 
	    public void setKategoriAdi(String KategoriAdi) {
	        this.KategoriAdi = KategoriAdi;
	    }
	    
	
}
