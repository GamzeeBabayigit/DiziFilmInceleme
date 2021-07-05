package first;

public class login {

	protected String email,pass,yetki;  
	protected int id;
	
	  public login() {
	    }
	
    public login(String email, String pass,String yetki,int id) {
    	this.email = email;
        this.pass = pass;
        this.yetki=yetki;
        this.id=id;
    
    }
    public login(String email, int id) {
    this.email=email;
    this.id=id;
    }
    
    public login(int id, String email,String pass ) {
        this.email=email;
        this.id=id;
        this.pass=pass;
        }
	  
	public String getEmail() {  
	    return email;  
	}  
	  
	public void setEmail(String email) {  
	    this.email = email;  
	}  
	  
	public String getPass() {  
	    return pass;  
	}  
	  
	public void setPass(String pass) {  
	    this.pass = pass;  
	}  
	
	public String getyetki() {  
	    return yetki;  
	}  
	  
	public void setyetki(String yetki) {  
	    this.yetki = yetki;  
	}  
	
	   public int getId() {
	        return id;
	    }
	 
	    public void setId(int id) {
	        this.id = id;
	    }
	
}
