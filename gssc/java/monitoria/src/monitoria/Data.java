package monitoria;

import java.util.Scanner;

public class Data {
	
	private short dia;
	private short mes;
	private short ano;
	
	public Data(short d, short m, short a){
		this.dia = d;
		this.mes = m;
		this.ano = a;		
	}

	public short getDia() {
		return dia;
	}

	public void setDia(short dia) {
		this.dia = dia;
	}

	public short getMes() {
		return mes;
	}

	public void setMes(short mes) {
		this.mes = mes;
	}

	public short getAno() {
		return ano;
	}

	public void setAno(short ano) {
		this.ano = ano;
	}

	public static void main (String args[]) {
		short a, b, c;
		Scanner in = new Scanner(System.in);
		
		System.out.println("Digite: dia, mes e ano");
		
		a = in.nextShort();
		b = in.nextShort();
		c = in.nextShort();
		
		Data alguma_data = new Data(a, b, c);
		
		System.out.println("..." + alguma_data.getDia() + "/" + alguma_data.getMes() + "/" + alguma_data.getAno());
	
		in.close();
	}
}




