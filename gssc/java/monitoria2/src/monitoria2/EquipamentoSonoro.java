package monitoria2;

public class EquipamentoSonoro extends Equipamento {
	private short volume;
	
	public EquipamentoSonoro () {
		super();
		this.volume = 0;
	}
	
	public short lerVolume () {
		return this.volume;
	}
	
	public void setVolume (short vol) {
		if (vol <= 10 && vol >= 0) {
			this.volume = vol;
		}
	}
	
	public void ligar () {
		super.ligar();
		this.setVolume((short)5);
	}
	
	public void desligar () {
		super.desligar();
		this.setVolume((short)0);
	}

	public static void main (String[] args) {
		
		EquipamentoSonoro eq;
		eq = new EquipamentoSonoro();
		System.out.println(eq.lerVolume());
		eq.setVolume((short) 2);
		System.out.println(eq.lerVolume());
	}
}
