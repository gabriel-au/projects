<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Tribunal Superior do Trabalho</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"/> 
<!-- link rel="apple-touch-icon" href="<%=request.getContextPath()%>/imagens/logo-touch-icon.png"/--> 
<!-- link  rel="shortcut icon" href="<%=request.getContextPath()%>/imagens/logo-touch-icon.ico" type="image/icon" /--> 
<style type="text/css" media="screen">@import "<%=request.getContextPath()%>/css/style.css";</style>
<style type="text/css" media="screen">@import "<%=request.getContextPath()%>/css/styleComplemento.css";</style>
<script type="application/x-javascript">
if (navigator.userAgent.indexOf('iPhone') != -1) {
        addEventListener("load", function() {
                setTimeout(hideURLbar, 0);
        }, false);
}

function hideURLbar() {
        window.scrollTo(0, 1);
}
</script>
<style type="text/css" media="screen">@import "<%=request.getContextPath()%>/css/styleJurisprudencia.css";</style>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/script.js"></script> 
</head>
<body>
<div class="toolbar">
<a href="<%=request.getContextPath()%>/" >
<img src="<%=request.getContextPath()%>/imagens/topo.png" /></a>
</div>
<div class="titulo">
<a href="<%=request.getContextPath()%>/" >
<img src="<%=request.getContextPath()%>/imagens/botao-inicio-azul.png" /></a>
<div class="titulo_texto">
Processos
</div>
</div>
<div class="arredondado">
<div class="arredondado_titulo">
Consulta
</div>
<form action="processoPesquisa.jsp" method="get">

<input type="hidden" name="p" id="p" value="Processos" />
<input type="hidden" name="m" id="m" value="consultar" />
<div class="arredondado_chamada">
Par&acirc;metro de pesquisa:
</div>
<div class="arredondado_chamada_simples_center">
<select class="input_select" name="opcaoConsulta">
<option  value="NUMERO" >N&uacute;mero do Processo</option>
<option  value="NUMERO_REGISTRO" >N&uacute;mero de REGISTRO</option>
<option  value="NUMERO_UNICO" >N&uacute;mero &Uacute;nico de Processo (NUP)</option>
<option  value="NUMERO_ORIGEM" >N&uacute;mero do Processo na ORIGEM</option>
<option  value="OAB" >OAB do Advogado</option>
<option  value="NOME_PARTE" >Nome da PARTE</option>
<option  value="NOME_ADVOGADO" >Nome do ADVOGADO</option></select>
</div>
<div class="arredondado_chamada_simples_center">
<input type="text" name="parametro" id="parametro" value="" class="input_text" size="50" />
<input type="submit" name="valor" id="valor" value="" class="input_submit" size="50" />
</div>
<p></p></form>
</div>
</body>
</html>