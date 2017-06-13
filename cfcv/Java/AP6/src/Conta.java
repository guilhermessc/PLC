
public class Conta {
	int saldo;
	int limit;
	
	public Conta(){
		this.saldo = 0;
	}
	
	public void deposita(int v){
		this.saldo += v;
	}
	
	public void saca(int v) throws ContaException{
		if(v > this.saldo){
			throw new ContaException(this.saldo);
		}
		else{
			this.saldo -= v;
		}
	}
	
	public void setLimit(int l){
		this.limit = l;
	}
	
	public static void main(String[] args){
		Conta minhaConta = new Conta();
		minhaConta.deposita(100);
		minhaConta.setLimit(1000);
		try{
			minhaConta.saca(200);
		}
		catch(ContaException e){
			e.printStackTrace();
			System.out.println("Seu saldo antes de ocorrer a exception(recuperado): "+e.saldo_recuperado);
		}
	}
}
