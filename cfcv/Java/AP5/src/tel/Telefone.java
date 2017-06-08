package tel;

public class Telefone extends Object {
	private String DDI, DDD, telefone;
	private TipoTelefone tp;
	public enum TipoTelefone{Residencial,Celular,Comercial,Fax}
	
	public Telefone(TipoTelefone t, String ddi, String ddd, String nTel){
		this.tp = t;
		this.DDI = ddi;
		this.DDD = ddd;
		this.telefone = nTel;
	}
	
	public Telefone(TipoTelefone t, String ddd, String nTel){
		this(t,"55",ddd,nTel);
	}
	public Telefone(TipoTelefone t, String nTel){
		this(t,"55","81", nTel);
	}
	public Telefone(String nTel){
		this(TipoTelefone.Celular, "55", "81", nTel);
	}
	
	public void setDDI(String dDI) {
		DDI = dDI;
	}
	public void setDDD(String dDD) {
		DDD = dDD;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getDDI() {
		return DDI;
	}
	public String getDDD() {
		return DDD;
	}
	public String getTelefone() {
		return telefone;
	}
	
	public void setTipo(TipoTelefone t){
		this.tp = t;
	}
	
	public TipoTelefone getTipo(){
		return this.tp;
	}
	public String showNumber(){
		return "+"+this.DDI+" "+"("+this.DDD+")"+" "+this.telefone;
	}
	
	public String toString(){
		return this.DDI+this.DDD+this.telefone;
	}
	
	public boolean equals(Object x){
		if(x instanceof Telefone){
			Telefone k = (Telefone)x;
			if(k.toString().equals(this.toString())){
				return true;
			}
			else{
				return false;
			}
		}
		else{
			return false;
		}
	}
	
	
}
