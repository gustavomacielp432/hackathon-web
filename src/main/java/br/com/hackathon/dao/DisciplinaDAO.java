package br.com.hackathon.dao;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import br.com.hackathon.modelo.Materia;
import br.com.hackathon.modelo.MateriaOfertada;
import br.com.hackathon.service.DisciplinaService;

public class DisciplinaDAO {

	//Diretorio do arquivo que sera transformado em JSON
	private static String DIRETORIO = "/home/ec2-user/arquivos/saida_";
	
	public List<MateriaOfertada> carregaMateriasOfertadasPorCodigo(String codigo, String tipo)  {
		HashMap<String, List<MateriaOfertada>> equivalencias = carregaMateriasOfertadas(tipo);
		return equivalencias.get(codigo);
	}

	private HashMap<String, List<MateriaOfertada>> carregaMateriasOfertadas(String tipo) {
		HashMap<String, List<MateriaOfertada>> equivalencias = new HashMap<>();//codigo
		
		String arquivoCSV = DIRETORIO+tipo+".csv";
	    BufferedReader br = null;
	    String linha = "";
	    String csvDivisor = "\t";
	    try {

	        br = new BufferedReader(new FileReader(arquivoCSV));
	        br.readLine();//header
	        while ((linha = br.readLine()) != null) {

	            String[] campos = linha.split(csvDivisor);
	            /*
	             * 0 = codigo
	             * 1 = nome_requerida
	             * 2 = sigla_ofertada
	             * 3 = nome_ofertada
	             * 4 = porcentagem_ofertada
	             */
	            
	            if(equivalencias.containsKey(campos[0])) {
	            	boolean possui =false;
	    			List<MateriaOfertada> materiasOfer = equivalencias.get(campos[0]);
	    			
	    			for(MateriaOfertada mo:materiasOfer) {
	    				if(mo.getSigla().equals(campos[2])) {
	    					possui = true;
	    				}
	    			}
	    			if(!possui) {
	    				int indexSplit = campos[3].indexOf("(");
	    				materiasOfer.add(new MateriaOfertada(campos[3].substring(0,indexSplit),campos[2],Integer.parseInt(campos[4])));
    					equivalencias.replace(campos[0], materiasOfer);
	    			}
	    		}else {
	    			List<MateriaOfertada> materiasEq = new ArrayList<>();
	    			materiasEq.add(new MateriaOfertada(campos[3],campos[2],Integer.parseInt(campos[4])));
	    			equivalencias.put(campos[0],materiasEq);
	    		}
	            
	        }

	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    } finally {
	        if (br != null) {
	            try {
	                br.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return equivalencias;
	}

	public List<Materia> carregarMaterias(String tipo) {
		List<Materia> materias = new ArrayList<Materia>();
		
		DisciplinaService.gerarCSV(tipo);
		String arquivoCSV = DIRETORIO+tipo+".csv";
	    BufferedReader br = null;
	    String linha = "";
	    String csvDivisor = "\t";
	    try {

	        br = new BufferedReader(new FileReader(arquivoCSV));
	        br.readLine();//header
	        while ((linha = br.readLine()) != null) {

	            String[] campos = linha.split(csvDivisor);
	            /*
	             * 0 = codigo
	             * 1 = nome_requerida
	             * 2 = sigla_ofertada
	             * 3 = nome_ofertada
	             * 4 = porcentagem_ofertada
	             */
	            
	    		boolean possui = false;
	            for(Materia m : materias) {
	            	if(m.getCodigo().equals(campos[0])) 
	            		possui = true;
	            	
	            }
	            
	            if(!possui) {
	            	Materia materia = new Materia(campos[0],campos[1]);
	            	materia.setMateriasOfertadas(carregaMateriasOfertadasPorCodigo(campos[0],tipo));
	            	materias.add(materia);
	            }
	            
	        }

	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    } finally {
	        if (br != null) {
	            try {
	                br.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return materias;
	}

	public List<Materia> carregarMateriasSalvas(List<Materia> materias){
		
		List<Materia> materiasSalvas = new ArrayList<>();
		
		for(Materia m:materias) {
			if(m.isSalva()) {
				materiasSalvas.add(m);
			}
		}
		
		return materiasSalvas;
	}
	
}
