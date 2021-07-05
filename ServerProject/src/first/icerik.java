package first;

public class icerik {

	protected int id;
	protected String Baslik;
	protected String icerik;
	protected String YapimYili;
	protected String Oyuncular;
	protected String Kategori;
	protected String Tur;
	protected String Gorsel;
	protected String Yazar;
	 
	
	public icerik() {
		
	}
	   public icerik(int id, String Baslik, String icerik, String YapimYili, String Oyuncular, String Kategori, String Tur, String Gorsel, String Yazar) {
			// TODO Auto-generated constructor stub
		   this.id=id;
		   this.Baslik=Baslik;
		   this.YapimYili=YapimYili;
		   this.icerik=icerik;
		   this.Oyuncular=Oyuncular;
		   this.Tur=Tur;
		   this.Kategori=Kategori;
		   this.Gorsel=Gorsel;
		   this.Yazar=Yazar;
		   
		}
    public icerik(int id) {
        this.id = id;
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
    
    public String getYapimYili() {
        return YapimYili;
    }
 
    public void setYapimYili(String YapimYili) {
        this.YapimYili = YapimYili;
    }
    
    public String getOyuncular() {
        return YapimYili;
    }
 
    public void setOyuncular(String Oyuncular) {
        this.Oyuncular = Oyuncular;
    }
    
    public String getKategori() {
        return Kategori;
    }
 
    public void setKategori(String Kategori) {
        this.Kategori = Kategori;
    }
    
    public String getTur() {
        return Tur;
    }
 
    public void setTur(String Tur) {
        this.Tur = Tur;
    }
    
    public String getGorsel() {
        return Gorsel;
    }
 
    public void setGorsel(String Gorsel) {
        this.Gorsel = Gorsel;
    }
    public String getYazar() {
        return Yazar;
    }
 
    public void setYazar(String Yazar) {
        this.Yazar = Yazar;
    }
    
}
