package br.com.hackathon.resource;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import br.com.hackathon.dao.DisciplinaDAO;
import br.com.hackathon.modelo.Materia;
import br.com.hackathon.service.DisciplinaService;


@RestController
@RequestMapping(value = "/")
public class DisciplinaResource {

	@RequestMapping(
			value = "disciplina", 
			method = RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE)
	public String busca(@RequestParam String curso) {
		DisciplinaDAO mainS = new DisciplinaDAO();
		List<Materia> materias = mainS.carregarMaterias(curso);
	    Gson gson = new Gson();
	    return gson.toJson(materias);
	}
	
	
	@RequestMapping(
			value = "rodarclassificador", 
			method = RequestMethod.GET, 
			produces = MediaType.TEXT_HTML_VALUE)
	public String rodarclassificador(@RequestParam String curso) {
		return DisciplinaService.rodarClassificador(curso);
	}
	
	
}
