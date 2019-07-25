package br.com.hackathon.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

public class DisciplinaService {

	private static String DIRETORIO = "/home/ec2-user/arquivos/saida_python";
	//private static String DIRETORIO = "C:\\Users\\Gustavo\\Desktop\\saida_python";
	private static String DIRETORIO_SAIDA = "/home/ec2-user/arquivos/saida_";
	//private static String DIRETORIO_SAIDA = "C:\\Users\\Gustavo\\Desktop\\saida_";
	
	private static final String SEPARADOR = "\t";
	
	//recebe uma arquivo contendo valores em porcentagem de cada materia
	//devolve arquivo que sera usado para gerar o JSON
	public static void gerarCSV(String tipo) {
		BufferedReader reader = null;
		try {
			
			File arquivoCliente = new File(DIRETORIO+tipo+".csv");
			FileInputStream arquivoEntrada = new FileInputStream(arquivoCliente);
			
			reader = new BufferedReader(new InputStreamReader(arquivoEntrada));
			String linha = reader.readLine(); // Header
			
			String[]header = linha.split(SEPARADOR,-1);
			
			FileWriter writer = new FileWriter(DIRETORIO_SAIDA+tipo+".csv");
			
			writer.append("ID\tNOME_REQ\tSIGLA_OFER\tNOME_OFER\tPOR_EQ\n");
			
			int count = 0;
			int count2 = 0;
			while ((linha = reader.readLine()) != null) {
				try {
					
					String[] colunas = linha.split(SEPARADOR, -1);
					for(int i = 0; i< colunas.length;i++) {
						if(colunas[i].matches("[0-9]*[.][0-9]*")) {
							count2++;
							float num = Float.parseFloat(colunas[i]);
							if(num>0.5f) {
								count++;
								String val = String.valueOf(Math.floor(num*100)).substring(0,2);
								 writer.append(colunas[0]+"\t"+colunas[1]+"\t"+colunas[2]+"\t"+header[i]+"\t"+val+"\n");
							}
						}
					}
				}catch(Exception e) {}
			}
			writer.flush();
	        writer.close();
			System.out.println(count);
			System.out.println(count2);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	//Metodos responsaveis por rodar o SVM no Python
	public static String rodarClassificador(String tipo) {
		try {
			//gerar saida_teste
			System.out.println("rodando shell");
			Process process	= Runtime.getRuntime().exec("/home/ec2-user/rodarPython.sh "+tipo+" > /home/ec2-user/rodarPython.log 2>&1");
			 
			while(true) {
				if(!process.isAlive()) {
					return "SUCESSO";
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "ERRO"; 
	}
}
