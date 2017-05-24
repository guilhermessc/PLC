import java.util.Scanner;
public class Main{
	public static void main (String[] args){
		Scanner sald = new Scanner(System.in);
		Scanner cont = new Scanner(System.in);
		System.out.println("Saldo inicial: ");
		double n = sald.nextDouble(); 
		System.out.println("Coloque um numero de conta:");
		String y = cont.nextLine();

		conta c = new conta(y,n);
		c.creditar(100);
		System.out.println("saldo= "+c.getSaldo());
		System.out.println("numero= "+c.getNumero());
		if(c.getNumero().equals("123")){
			System.out.println("Yes!!");	
		}
	}
}