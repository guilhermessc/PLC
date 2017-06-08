package tel;
import java.util.ArrayList;

import tel.Telefone.TipoTelefone;

public class ContatoSmartphone implements Contato{
	private String nome, email;
	private ArrayList<Telefone> telefones;
	private int len_telefones;
	
	//Construtor
	public ContatoSmartphone(String nome, String email, ArrayList<Telefone> tels){
		boolean celular = false;
		int[] check = new int[4];		
		
		if(tels.size() > 4){
			throw new IllegalArgumentException("Máximo de 4 telefones excedido");
		}
		//Check for the type obrigatory celular
		for(int i = 0; i < tels.size(); i++){
			if(tels.get(i).getTipo() == TipoTelefone.Celular){
				celular = true;
			}
		}
		if(celular == false){
			throw new IllegalArgumentException("Deve haver um telefone do tipo celular");
		}
		
		//Check for repeated types
		for(int i = 0; i < tels.size(); i++){
			if(tels.get(i).getTipo() == TipoTelefone.Celular){
				check[0] += 1;
			}
			else if(tels.get(i).getTipo() == TipoTelefone.Residencial){
				check[1] += 1;
			}
			else if(tels.get(i).getTipo() == TipoTelefone.Comercial){
				check[2] += 1;
			}
			else{
				check[3] += 1;
			}
		}
		for(int i = 0; i < 4; i++){
			if(check[i] > 1){
				throw new IllegalArgumentException("Tipos repetidos");
			}
		}
		
		this.telefones = new ArrayList<Telefone>();
		this.nome = nome;
		this.email = email;
		this.telefones.addAll(tels);	
	}

	@Override
	public String obterNome(){
		return this.nome;
	}
	
	@Override
	public Telefone obterTelefone(){
		for(int i = 0; i < this.telefones.size(); i++){
			if(this.telefones.get(i).getTipo() == TipoTelefone.Celular){
				return this.telefones.get(i);
			}
		}
		return null;
	}

	

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public ArrayList<Telefone> getTelefones() {
		return telefones;
	}

	public void setTelefones(ArrayList<Telefone> telefones) {
		this.telefones = telefones;
	}

	public int getLen_telefones() {
		return len_telefones;
	}

	public void setLen_telefones(int len_telefones) {
		this.len_telefones = len_telefones;
	}
	
}
