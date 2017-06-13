
public class ContaException extends Exception{
	public int saldo_recuperado;
	public ContaException(int rec){
		super("Saldo insuficiente");
		this.saldo_recuperado = rec;
	}
}
