import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Blif {
	
	/**
	 * 
	 * @param str - logicki uzraz zapisan u flif faju
	 * @return rec formiranu na osnovu zapisa u fajlu
	 */
	public static String formiranjeReci(String[] str){
		
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < str.length; i++) {
			//Ako je karakter -
			if(str[i].equals("-")){
				//skoci na sledecu iteraciju
				continue;				
			} else if(str[i].equals("1")){
				sb.append("+x("+(i+1)+")");
			}else if(str[i].equals("0")){
				sb.append("-x("+(i+1)+")");
			}
		}
		
		return sb.toString();
	}

	public static void main(String[] args) throws IOException{
		// TODO Auto-generated method stub
		BufferedReader in = new BufferedReader(new FileReader(args[0]));
		BufferedWriter out  =new BufferedWriter(new FileWriter("Parsirani_fajl.m"));
		
		//Za pravljenje stringa koji ce se upisivati u fajl
		StringBuilder sb = new StringBuilder();
		
		int brojacReci = 0;
		
		String linija = "function [y] = Parsirani_fajl(x)";	//Prva linija za definisanje funkcije
		sb.append(linija+"\n");
		sb.append("y = 1 - ..."+"\n\t(");
		int brSlova = 0;
		
		while ((linija = in.readLine()) != null) {
			String[] s = linija.split(" ");
			String[] rec = s[0].split("");
			int brojacNegitanihSlova = 0;
			//Odredjuje se broj negiranih slova u reci
			for(int i = 0; i < rec.length ; i++){
				if(rec[i].equals("0"))
					brojacNegitanihSlova++;
			}
			String gotovaRec;
			//Ako nema negiranih vrednosti
			if(brojacNegitanihSlova == 0){
				gotovaRec = "("+Blif.formiranjeReci(rec)+")" ;
			}else{
				gotovaRec = "("+Integer.toString(brojacNegitanihSlova) + Blif.formiranjeReci(rec) + ")";
			}
			//Kada se formira rec, sledi upisivanje u StringBuilder
			if(brojacReci == 0){
				sb.append(gotovaRec);
			}else{
				sb.append("*...\n\t"+gotovaRec);
			}
			brojacReci++;
			brSlova = rec.length;
		}
		sb.append(");\n");
		sb.append("\n\n%%Broj slova je "+brSlova+", a broj reci je: "+brojacReci);
		out.write(sb.toString());
		out.flush();
		
		System.out.println(sb.toString());
		//Zatvaranje fajla iz koga se cita
		in.close();
	}

}
