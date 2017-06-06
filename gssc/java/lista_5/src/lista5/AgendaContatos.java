package lista5;

public abstract class AgendaContatos {
	
	public static String[] obterNomes (Contato[] contatos) {
		
		String[] nomes = new String[contatos.length];
		
		for (int i=0; i<contatos.length; ++i) {
			nomes[i] = contatos[i].obterNome();
		}
		return nomes;
	}

	public static Contato[] obterContatosCelular (Contato[] contatos) {
		
		int len=0;
		
		for (int i=0; i<contatos.length; ++i) {
			if (contatos[i] instanceof ContatoCelular) {
				++len;
			}
		}
		
		Contato[] ret = new Contato[len];
		
		for (int i=0; i<contatos.length; ++i) {
			if (contatos[i] instanceof ContatoCelular) {
				--len;
				ret[len] = contatos[i];
			}
		}
		
		return ret;
	}
	
	public static Contato[] obterContatosSmartphone (Contato[] contatos) {
		
		int len=0;
		
		for (int i=0; i<contatos.length; ++i) {
			if (contatos[i] instanceof ContatoSmartphone) {
				++len;
			}
		}
		
		Contato[] ret = new Contato[len];
		
		for (int i=0; i<contatos.length; ++i) {
			if (contatos[i] instanceof ContatoSmartphone) {
				--len;
				ret[len] = contatos[i];
			}
		}
		
		return ret;
	}

}