

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

	<!-- <nav class="navbar navbar-inverse navbar-fixed-top menu-dev"
		role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${pageContext.request.contextPath}">
					<img alt="Logo"
					src="resources/landing_page/img/dunning-logo-branca-775x170.png"
					height="50">
				</a>
			</div>
		</div>
	</nav> -->

	<section id="apiRest" class="section nopadding-bottom">
		<div class="container">		
			<div class="row">
				<div class="col-md-12 title">
					<h1>API Rest</h1>
				</div>
			</div>
			<div class="row">
				<h3>Disciplinas</h3>

				<pre>https://18.222.28.71:8080/disciplina?curso={curso}</pre>


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
'http://18.222.28.71:8080/disciplina?curso=vet'
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
http://18.222.28.71:8080/disciplina?curso=vet



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
					<h3>&copy; Copyright 2015-2019 Direitos Reservados.</h3>
				</div>
			</div>
		</div>
	</section>

	<script src="resources/landing_page/js/all.js"></script>

</body>

</html>