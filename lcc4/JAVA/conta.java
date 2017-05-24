public class conta {
	private String numero;
	private double saldo;
	
	public conta (String numero, double valor){
		this.numero = numero;
		this.saldo = valor;
	}

	public conta(String numero){
		this(numero,0.0);
	}

	public conta (){
		this("Sem numero.",0.0);
	}	

	public void creditar (double valor){
		this.saldo += valor;
	}
	public void debitar(double valor) {
		this.saldo -= valor;
	}

	public double getSaldo(){
		return this.saldo;
	}

	public String getNumero(){
		return this.numero;
	}
}