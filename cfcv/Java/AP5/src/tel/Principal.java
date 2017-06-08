package tel;
import tel.Telefone.TipoTelefone;
import java.util.ArrayList;

public class Principal {

	public static void main(String[] args) {
		//Q1
		Telefone t1 = new Telefone(TipoTelefone.Residencial, "10", "99", "981081996");
		System.out.print(t1.showNumber());
		System.out.println(" "+t1.getTipo());
		
		Telefone t2 = new Telefone(TipoTelefone.Comercial, "85", "981541996");
		System.out.print(t2.showNumber());
		System.out.println(" "+t2.getTipo());
		
		Telefone t3 = new Telefone(TipoTelefone.Fax,"981081996");
		System.out.print(t3.showNumber());
		System.out.println(" "+t3.getTipo());
		
		Telefone t4 = new Telefone("981081996");
		System.out.print(t4.showNumber());
		System.out.println(" "+t4.getTipo());
		
		t2.setDDD("85");
		
		if(t3.equals(t4)){
			System.out.println("t3 e t4 são iguais.");
		}
		else{
			System.out.println("t3 e t4 são diferentes.");
		}
		
		//Q2
		ContatoCelular c1 = new ContatoCelular("Carlos", t1);
		ArrayList<Telefone> tels = new ArrayList<Telefone>();
		tels.add(t2);
		tels.add(t3);
		tels.add(t4);
		ContatoSmartphone c2 = new ContatoSmartphone("cfcv", "cfcv@cin.ufpe.br", tels);
		Contato[] conts = new Contato[2];
		conts[0] = c1;
		conts[1] = c2;
		
		String[] result1 = AgendaContatos.obterNomes(conts);
		Contato[] cont_smart = AgendaContatos.obterContatosSmartphone(conts);
		Contato[] cont_cel = AgendaContatos.obterContatosCelular(conts);
		
		//Mostrar todos os nomes
		System.out.println("Nomes:");
		for(int i = 0; i < result1.length; i++){
			System.out.println(" "+result1[i]);
		}
		
		//Mostrar os nomes de todos os contatos smartphone
		ContatoSmartphone aux;
		System.out.println("Nomes_smartphone:");
		for(int i = 0; i < cont_smart.length; i++){
			aux = (ContatoSmartphone)cont_smart[i];
			System.out.println(" "+aux.obterNome());
		}
		
		//Mostrar os nomes de todos os contatos celular
		ContatoCelular aux2;
		System.out.println("Nomes_celular:");
		for(int i = 0; i < cont_cel.length; i++){
			aux2 = (ContatoCelular)cont_cel[i];
			System.out.println(" "+aux2.obterNome());
		}
	}

}
