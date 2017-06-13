package lista_6;

public class ContaException extends Exception {
	
	public double saldo; // letra d
	
	public ContaException (double saldoAtual) {
		super("Saldo insuficiente");
		this.saldo = saldoAtual; // letra d
	}
}
