package lista_6;

public class Conta {
	private double saldo;
	private double limite;
	
	public Conta () {
		this.saldo = 0;
		this.limite = -1;
	}
	
	public double getSaldo() {
		return this.saldo;
	}

	public double getLimite() {
		return this.limite;
	}

	public void deposita(double saldo) {
		this.saldo += saldo;
	}
	
	public void setLimite(double limite) {
		this.limite = limite;
	}

	public void saca (double saque) throws ContaException {
		if (this.saldo >= saque) 
			this.saldo -= saque;
		else
			throw new ContaException(this.saldo);
	}
	
	public static void main(String[] args) throws ContaException {
		Conta minhaConta = new Conta();
		minhaConta.deposita(100);
		minhaConta.setLimite(100);
		try {						// letra d
			minhaConta.saca(1000);
		}
		catch (ContaException ce) { // letra d
			System.out.println("Seu saldo atual:   " + ce.saldo);
		}
	}
}
