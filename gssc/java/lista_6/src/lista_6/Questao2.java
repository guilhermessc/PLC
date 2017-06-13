package lista_6;
import java.util.InputMismatchException;
import java.util.Scanner;

public class Questao2 {
	
	public static void main(String[] args) {
		
		Scanner teclado = new Scanner(System.in);
		int x=0, y=0;
		boolean exc = true;
		
		System.out.println("Eu sei dividir");
//		int x = Questao2.readInt();
		exc = true;
		while (exc) {
			exc = false;
			try {
				System.out.println("Informe o primeiro valor");
				x = teclado.nextInt();
			}
			catch (InputMismatchException ime) {
				ime.printStackTrace();
				exc = true;
				teclado.next();
			}
		}
		
		
//		int y = Questao2.readInt();
		exc = true;
		while (exc) {
			exc = false;
			try {
				System.out.println("Informe o segundo valor");
				y = teclado.nextInt();
			}
			catch (InputMismatchException ime) {
				ime.printStackTrace();
				exc = true;
				teclado.next();
			}
		}
		
		double r = 0;
		try {
			r = (x / y);
		}
		catch (ArithmeticException ae) {
			ae.printStackTrace();
		}
		System.out.println("O resultado da divisao: " + r);
		teclado.close();
	}
}
