package tel;
import java.util.ArrayList;

public abstract class AgendaContatos {
	public static String[] obterNomes(Contato[] contatos){
		String[] nomes = new String[contatos.length];
		for(int i = 0; i < contatos.length; i++){
			nomes[i] = contatos[i].obterNome();
		}
		return nomes;
	}
	
	public static Contato[] obterContatosSmartphone(Contato[] contatos){
		ArrayList<Contato> aux = new ArrayList<Contato>();

		for(int i = 0; i < contatos.length; i++){
			if(contatos[i] instanceof ContatoSmartphone){
				aux.add(contatos[i]);
			}
		}

		Contato[] smart = new Contato[aux.size()];
		
		for(int i = 0; i < aux.size(); i++){
			smart[i] = aux.get(i);
		}
		return smart;
	}

	public static Contato[] obterContatosCelular(Contato[] contatos){
		ArrayList<Contato> aux = new ArrayList<Contato>();

		for(int i = 0; i < contatos.length; i++){
			if(contatos[i] instanceof ContatoCelular){
				aux.add(contatos[i]);
			}
		}

		Contato[] smart = new Contato[aux.size()];
			
		for(int i = 0; i < aux.size(); i++){
			smart[i] = aux.get(i);
		}
		return smart;
		
	}

}
