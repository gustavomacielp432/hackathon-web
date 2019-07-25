

<!DOCTYPE html>
<html lang="pt">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>API REST</title>

	<link rel="stylesheet" href="resources/landing_page/css/all.css">

	<style>
		table {
			border-collapse: collapse;
		}

		td+td, th+th {
			border-left: 1px solid gray;
			text-align: left;
			padding: 5px;
		}

		tr+tr {
			border-top: 1px solid gray;
			text-align: left;
		}

		table#t01 {
			width: 80%;
			text-align: left;
		}
		
	</style>
</head>

<body data-spy="scroll">

	<nav class="navbar navbar-inverse menu-dev"
		role="navigation">
		<div class="container">
			<div class="navbar-header">
				<!--  <button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>-->
			</div>
		</div>
	</nav> 

	<section id="descricao" class="section nopadding-bottom">
		<div class="container">	
			<div class="row">
				<div class="col-md-12 title">
					<h1>HACKATHON- Equivalências UNI-BH</h1>
					<br><br>
					<h2>Gustavo Maciel Pimenta<br>Jose Luiz Maciel Pimenta</h2>
				</div>
			</div>
			<br>
			<div class="row">
				<h3>Desafio</h3>
				Desenvolver uma interface inteligente para a indicação de equivalências de disciplinas nas IES do grupo Anima.
				<br>
				<h3>Objetivo</h3>
				<ul>
					<li>Abertura de muitos tickets na rematrícula devido à falta de ofertas de equivalências para as disciplinas pendentes não ofertadas no semestre</li>
					<li>Equivalências lançadas de forma manual e incorreta por diferentes pessoas: Informações divergentes</li>
					<li>Disciplinas comuns a vários cursos (Institucional, LAI, PI, TIG, cálculo diferencial, etc) não tem um padrão de lançamento de equivalência.</li>
					<li>Cursos com várias matrizes de convergência e legado que possuem disciplinas que não serão mais ofertadas e não há equivalência direta:
					 Equivalências por valor formativo sem padrão e/ou processo de inteligência e dificuldade na previsão de oferta de turmas especiais.</li>
				</ul>
			</div>
			<br>
			<div class="row">
				<h3>Tecnologias utilizadas</h3>
				<ul>
					<li>Support Vector Machine (SVM) com Gradiente Descendente Estocástico</li>
					<li>TF-IDF</li>
					<li>JAVA - Spring MVC</li>
				</ul>
				
				<br><br>
				
				<div class="col-sm-12" align="center">
					<img src="resources/img/tfidf.JPG">
				</div>
			</div>
		</div>	
		<br><br>
		
		<div class="container">
			<div class="row">
				<h1>Resultados</h1>
				<br>
				<div class="col-sm-12">
					<table width="100%">
						<thead>
							<tr>
								<th></th>
								<th>precision</th>
								<th>recall</th>
								<th>f1-score</th>
								<th>support</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>accuracy</td>
								<td></td>
								<td></td>
								<td>0.76</td>
								<td>440</td>
							</tr>
							<tr>
								<td>Macro avg</td>
								<td>0.69</td>
								<td>0.73</td>
								<td>0.67</td>
								<td>440</td>
							</tr>
							<tr>
								<td>weighted avg</td>
								<td>0.79</td>
								<td>0.76</td>
								<td>0.75</td>
								<td>440</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-sm-12" align="center">
					<img src="resources/img/precisao.JPG" width="40%">
					<img src="resources/img/recall.JPG" width="30%">
					<img src="resources/img/f1.JPG" width="30%">
				</div>
			</div>
		</div>
	</section>
	
	<section id="apiRest" class="section nopadding-bottom">
		<div class="container">		
			<div class="row">
				<div class="col-md-12 title">
					<h1>API Rest</h1>
				</div>
				<h3>Disciplinas</h3>

				<pre>http://3.130.179.162:8080/disciplina?curso={curso}</pre>


				<!-- DISCIPLINA GET -->
				<div class="panel blank-panel">
					<div class="panel-heading">
						<div class="panel-title m-b-md">
							<h4>GET: Obter lista de disciplinas classificadas</h4>
						</div>
						
					</div>
					<div class="panel-options">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab"
								href="#disciplina-get-curl">Requisição</a></li>
							<li class=""><a data-toggle="tab"
								href="#disciplina-get-request-parameters">Parâmetros de
									retorno</a></li>
							<li class=""><a data-toggle="tab"
								href="#disciplina-get-request-exemplo">Exemplo</a></li>
						</ul>
					</div>
					<div class="panel-body">
						<div class="tab-content">
							<div id="disciplina-get-curl" class="tab-pane active">
								<pre>
curl --include \
     --request GET \
     --header "Content-Type: application/json" \
'http://3.130.179.162:8080/disciplina?curso=vet'
								</pre>
							</div>

							<div id="disciplina-get-request-parameters" class="tab-pane">
								<div style="overflow-x: auto;">
									<table id="t01">
										<tr>
											<th>Nome</th>
											<th>Tipo</th>
											<th>Descrição</th>
										</tr>
										<tr>
											<td>codigo</td>
											<td>String</td>
											<td>Código disciplina requerida</td>
										</tr>
										<tr>
											<td>nome</td>
											<td>String</td>
											<td>Nome disciplina requerida</td>
										</tr>
										<tr>
											<td colspan="2" class="text-center"><strong>materiasOfertadas</strong></td>
											<td><strong>JSONArray</strong></td>
										</tr>
										<tr>
											<td>nome</td>
											<td>String</td>
											<td>Nome disciplina ofertada</td>
										</tr>
										<tr>
											<td>sigla</td>
											<td>String</td>
											<td>Sigla disciplina ofertada</td>
										</tr>
										<tr>
											<td>porcentagemEq</td>
											<td>Inteiro</td>
											<td>Taxa de equivalência com disciplina requerida</td>
										</tr>
										
									</table>
								</div>
							</div>

							<div id="disciplina-get-request-exemplo" class="tab-pane">
								<pre>					
http://3.130.179.162:8080/disciplina?curso=vet



[
    {
        "codigo": "4346034",
        "nome": "Sustentabilidade e Responsabilidade Socioambiental",
        "materiasOfertadas": [
            {
                "nome": "Responsabilidade e Negócios Sociais(1212000882)",
                "sigla": "1212000882",
                "porcentagemEq": 93
            }
        ],
        "salva": false
    },
    {
        "codigo": "4346026",
        "nome": "Economia",
        "materiasOfertadas": [
            {
                "nome": "Economia(1906000002)",
                "sigla": "1906000002",
                "porcentagemEq": 87
            }
        ],
        "salva": false
    }
]
								</pre>	
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>
	<br><br>

	<section class="footer footer-top">
		<div class="container text-justify">
			<div class="row">
				<div class="col-md-4 col-sm-12">
					<h3>&copy; Copyright 2019 Direitos Reservados.</h3>
				</div>
			</div>
		</div>
	</section>

	<script src="resources/landing_page/js/all.js"></script>

</body>

</html>