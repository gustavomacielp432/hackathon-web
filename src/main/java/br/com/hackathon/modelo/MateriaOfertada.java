package br.com.hackathon.modelo;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class MateriaOfertada {
	private String nome;
	private String sigla;
	private Integer porcentagemEq;
	
	public MateriaOfertada() {}
	
	public MateriaOfertada(String nome, String sigla, Integer porcentagemEq) {
		this.nome = nome;
		this.sigla = sigla;
		this.porcentagemEq = porcentagemEq;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	public Integer getPorcentagemEq() {
		return porcentagemEq;
	}

	public void setPorcentagemEq(Integer porcentagemEq) {
		this.porcentagemEq = porcentagemEq;
	}
	
	@Override
	public String toString() {
		int indexI = nome.indexOf("(");
		if(indexI != -1) {
			nome = nome.substring(0,indexI);
		}
		return "Nome: " + nome + ", Sigla: " + sigla + ", Porcentagem de equivalência: " + porcentagemEq;
	}
	
	
}
