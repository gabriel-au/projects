<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/includes/head.jsp" %>
<body>

<%@ include file="/includes/toolbar.jsp" %>

<div class="titulo">
<a href="<%=request.getContextPath()%>/" >
<img src="<%=request.getContextPath()%>/imagens/botao-inicio-azul.png" /></a>
<div class="titulo_texto">Vôos On-line</div>
</div>

<div class="arredondado">
<div class="arredondado_link">
<a href="<%=request.getContextPath()%>/voo_online/aeroporto.jsp" >Quero escolher um Aeroporto!</a>
</div>
</div>

<div class="arredondado">
<div class="arredondado_link">
<a href="<%=request.getContextPath()%>/voo_online/companhia.jsp" >Eu sei a Companhia Aérea!</a>
</div>
</div>

<div class="arredondado">
<div class="arredondado_link">
<a href="<%=request.getContextPath()%>/voo_online/voo.jsp" >Eu sei o Número do Vôo!</a>
</div>
</div>



</body>
</html>