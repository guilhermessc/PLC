import java.util.Scanner;
import java.lang.*;
public class Texto{
	private String tt;
	public Texto(String texto){
		this.tt = texto;
	}
	public void imprimir(){
		System.out.println(this.tt);
	}
	public void total(){
		int count = 0;
		String[] palavras = this.tt.split(" ");
		//System.out.println(palavras.length);
/*		System.out.println("---------------");
		for(String s : palavras){
			System.out.print(s);
			System.out.print("|");
			count += 1;
		}*/
		//System.out.println(count);
		System.out.println("Total de palavras: "+palavras.length);
	}
	public void numberofOccurs(String palavra){
		String[] palavras = this.tt.split(" ");
		String aux = null;
		int count = 0;
		for(String s : palavras){
			//System.out.println("comparando "+s+" com "+palavra);
			aux = s.trim();
			if(aux.startsWith(palavra)){
				if(aux.length() == palavra.length()){
					//System.out.println("True");
					count += 1;
				} 
				else if(!this.Letter(aux.charAt(aux.length()-1))){
					if(aux.length() == (palavra.length()+1)){
						count += 1;
						//System.out.println("True");
					}
				}
			}
		}
		System.out.println("Numero de ocorrencias de "+palavra+": "+count);
	}
	private boolean Letter(char c){
		if((c >= 65 && c <= 90) || (c >= 97 && c <= 122)){
			return true;
		}
		return false;
	}

	public void subistitui(String w1, String w2){
		String[] palavras = this.tt.split(" ");
		String aux = null;
		int i;
		for(i = 0; i < palavras.length; i++){
			aux = palavras[i].trim();
			if(aux.startsWith(w1)){
				if(aux.length() == w1.length()){
					//System.out.println("True");
					palavras[i] = w2;
				} 
				else if(!this.Letter(aux.charAt(aux.length()-1))){
					if(aux.length() == (w1.length()+1)){
						palavras[i] = w2;
						palavras[i] += aux.charAt(aux.length()-1);
						//System.out.println("True");
					}
				}
			}
			if(i == 0){
				this.tt = palavras[0];
				this.tt += " ";
			}
			else{
				this.tt += palavras[i];
				this.tt += " ";
			}
		}
	}
	public static void main(String[] args) {
		//variáveis
		String text = null;
		String aux = null;
		String choice = null;
		String word1 = null;
		String word2 = null;
		int c;
		Scanner in = new Scanner(System.in);
		
		System.out.println("Deseja digitar o texto(y) ou usar o padrao(n)?[y/n]");
		choice = in.next();
		if (choice.equals("y")) {
			System.out.println("Digite o texto:");
			aux = in.next();
			if(!aux.equals("0")){
				text = aux;
				while(in.hasNext()){
					aux = in.nextLine();
					if(aux.equals("0")){
						break;
					}
					text += "\n ";
					text += aux;
				}
			}	
		}
		else{
			text = "Pode se encontrar a felicidade mesmo nas horas mais sombrias, se a pessoa se lembrar de acender a luz\n Afinal, aquilo que amamos sempre sera parte de nos.\n Nao tenha pena dos mortos e sim dos vivos, principalmente daqueles que vivem sem amor.";
		}
		
		Texto user_text = new Texto(text);

		//menu
		c = 0;
		while (c != 5){
			System.out.println("----------------------------------------");
			System.out.println("1. Imprimir o texto.");
			System.out.println("2. Total de palavras.");
			System.out.println("3. Determinar o numero de ocorrencias.");
			System.out.println("4. Subistituir as ocorrencias de uma palavra.");
			System.out.println("5. Sair.");
			System.out.println("----------------------------------------");
			System.out.print("Choice: ");
			c = in.nextInt();
			if(c == 1){
				user_text.imprimir();
			}
			else if(c == 2){
				user_text.total();
			}
			else if(c == 3){
				System.out.print("Digite a palavra a ser buscada:");
				word1 = in.next();
				user_text.numberofOccurs(word1.trim());
			}
			else if(c == 4){
				System.out.print("Digite a palavra a ser subistituida:");
				word1 = in.next();
				System.out.print("Digite a palavra para subistituir:");
				word2 = in.next();
				user_text.subistitui(word1, word2);
				user_text.imprimir();
			}
		}
	}
}