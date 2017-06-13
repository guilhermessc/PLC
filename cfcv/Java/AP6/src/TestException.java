
public class TestException {

	public static void main(String[] args) throws OutOfRangeException{
		// TODO Auto-generated method stub
		System.out.println("inicio do main");
		try{
			metodo1();
		}
		catch(OutOfRangeException e){
			e.printStackTrace();
		}
		System.out.println("fim do main");
	}
	
	static void metodo1() throws OutOfRangeException{
		System.out.println("inicio do metodo1");
		metodo2();
		System.out.println("fim do metodo1");
	}
	
	static void metodo2() throws OutOfRangeException{
		System.out.println("inicio do metodo2");
		int[] array = new int[10];
		for(int i = 0; i < 15; i++){
			if(!check(array,i)){
				throw new OutOfRangeException();
			}
			array[i] = i;
			System.out.println(i);
		}
		System.out.println("fim do metodo2");
	}
	
	static boolean check(int[] ar, int i){
		if(i >= ar.length){
			return false;
		}
		return true;
	}

}
