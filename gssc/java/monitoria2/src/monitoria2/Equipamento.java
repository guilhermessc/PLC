package monitoria2;

public class Equipamento {
	private boolean ligado;
	
	public Equipamento () {
		this.ligado = false;
	}
	
	public void ligar () {
		this.ligado = true;
	}
	
	public void desligar () {
		this.ligado = false;
	}
	
	public boolean getStatus () {
		return this.ligado;
	}
	
	public void switch_stat () {
		this.ligado = !this.ligado;
	}
}
