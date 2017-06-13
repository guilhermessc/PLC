package lista_6;
import java.util.Scanner;

public class Main {
	private String CPF;
	
	public Main () {
		CPF = new String("");
	}
	
	public void obterCPF () throws CPFInvalidoException {
		Scanner input = new Scanner(System.in);
		this.CPF = input.next();
		input.close();
		System.out.println("-> "+this.CPF);
		
		if (!isValidCPF())
			throw new CPFInvalidoException();
	}
	
	private boolean isValidCPF() {
		
		return false;
	}
	
	public static void main (String[] args) throws CPFInvalidoException {
		Main meu_cpf = new Main();
		try {
			meu_cpf.obterCPF();
		}
		catch (CPFInvalidoException var) {
			var.printStackTrace();
		}
		
	}
}