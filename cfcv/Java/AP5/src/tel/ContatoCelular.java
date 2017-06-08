package tel;

public class ContatoCelular implements Contato{
	private String nome;
	private Telefone telefone;
	
	public ContatoCelular(String nome, Telefone t){
		this.nome = nome;
		this.telefone = t;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setTelefone(Telefone telefone) {
		this.telefone = telefone;
	}
	
	@Override
	public String obterNome(){
		return this.nome;
	}
	
	@Override
	public Telefone obterTelefone(){
		return this.telefone;
	}
	
}
