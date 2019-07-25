package br.com.hackathon.modelo;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import com.google.gson.Gson;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Materia {
	
	private String codigo;
	private String nome;
	private List<MateriaOfertada> materiasOfertadas;
	private boolean salva;
	
	public Materia() {}
	
	public Materia(String codigo, String nome) {
		this.nome = nome;
		this.codigo = codigo;
		this.salva = false;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	
	public List<MateriaOfertada> getMateriasOfertadas() {
		return materiasOfertadas;
	}

	public void setMateriasOfertadas(List<MateriaOfertada> materiasOfertadas) {
		this.materiasOfertadas = materiasOfertadas;
	}
	
	public List<MateriaOfertada> removeMateriaOfertada(MateriaOfertada materiaOf) {
		this.materiasOfertadas.remove(materiaOf);
		return materiasOfertadas;
	}
	
	public boolean isSalva() {
		return salva;
	}

	public void setSalva(boolean salva) {
		this.salva = salva;
	}

	@Override
	public String toString() {
		return "Codigo: " + codigo + ", Nome: " + nome;
	}

	public String toJSON() {
		Gson gson = new Gson();
		return gson.toJson(this);
	}
	
	
}
