import java.util.InputMismatchException;
import java.util.Scanner;

public class Questao2 {
	public static void main(String[] args){
		Scanner teclado = new Scanner(System.in);
		String aux;
		boolean c;
		int x = 0, y = 0, r = 0;
		
		System.out.println("eu sei dividir");
		
		c = true;
		while(c){
			c = false;
			try{
				System.out.print("informe o primeiro valor: ");
				x = teclado.nextInt();
			}
			catch(InputMismatchException e){
				e.printStackTrace(); 
				aux = teclado.next();
				c = true;
			}
		}
		c = true;
		while(c){
			c = false;
			try{
				System.out.print("informe o segundo valor: ");
				y = teclado.nextInt();
			}
			catch(InputMismatchException e){
				e.printStackTrace();
				aux = teclado.next();
				c = true;
			}
		}
		
		try{
			r = (x/y);
		}
		catch(ArithmeticException e){
			e.printStackTrace();
		}
		
		System.out.println("o resultado da soma é: "+r+ " ");
		teclado.close();
	}
	
}
