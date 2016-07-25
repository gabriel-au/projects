<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="includes/head.jsp" %>
<body>

<%@ include file="includes/toolbar.jsp" %>

<!-- In�cio da Barra de T�tulo -->
<!-- div class="titulo">
<a href="<%=request.getContextPath()%>/" >
<img src="<%=request.getContextPath()%>/imagens/botao-inicio-azul.png" />
</a>
<div class="titulo_texto">Noticias</div>
</div-->
<!-- Fim da Barra de T�tulo -->

<!-- In�cio do Conte�do -->
<div class="arredondado">
	<div class="arredondado_saudacao">
		JO�O,
	</div>
	<div class="arredondado_chamada_detalhe_espaco">
		A SUA FATURA CREDICARD EST� COM VISUAL MAIS MODERNO E TRAZ MUITO MAIS
		INFORMA��ES PARA VOC�.
	</div>
</div>

<!-- div class="arredondado">
	<div class="arredondado_titulo_detalhe_espaco">
		CART�O N�
	</div>
	<div class="arredondado_chamada_detalhe_espaco">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="40">
					<img src="<%=request.getContextPath()%>/imagens/logo_cc_mastercard.jpg" style="vertical-align: middle;"/>
				</td>
				<td>XXXX-XXXX-XXXX-1234</td>
			</tr>
		</table>
	</div>
</div-->

<div class="arredondado">
	<div class="arredondado_titulo_detalhe_espaco">
		�LTIMA FATURA
	</div>
	<div class="arredondado_chamada_simples_dupla_borda">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="40">
					<img src="<%=request.getContextPath()%>/imagens/logo_cc_mastercard.jpg" style="vertical-align: middle;"/>
				</td>
				<td>XXXX-XXXX-XXXX-1234</td>
			</tr>
		</table>
	</div>
	<div class="arredondado_chamada_detalhe_table_espaco">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td width="25%" style="border-right: 1px solid #DDE; text-align: center;">VENC.</td>
				<td width="40%" style="border-right: 1px solid #DDE; text-align: center;">TOTAL</td>
				<td style="text-align: center;">M�NIMO</td>
			</tr>
			<tr>
				<td style="border-right: 1px solid #DDE; font-size: 15px; text-align: center; font-weight: bold;"><strong>20/08</strong></td>
				<td style="border-right: 1px solid #DDE; font-size: 15px; text-align: center; font-weight: bold;"><strong>R$ 3.265,89</strong></td>
				<td style="font-size: 15px; text-align: center; font-weight: bold;"><strong>R$ 326,59</strong></td>
			</tr>
		</table>
	</div>
	<div class="arredondado_chamada_simples_borda">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td>MELHOR DIA DE COMPRA</td>
				<td width="50" style="font-weight: bold; font-size: 15px; text-align: right;">10/09</td>
			</tr>
		</table>
	</div>
</div>

<div class="arredondado">
<div class="arredondado_link">
<a href="<%=request.getContextPath()%>/invoices.jsp" >
FATURAS ANTERIORES</a>
</div>
</div>

<!-- Fim do Conte�do -->

<!-- div style="margin-top:0px; ">
<img src="<%=request.getContextPath()%>/imagens/tabbar.png" />
</div-->

<!-- In�cio do Espa�amento -->
<p>&nbsp;</p>
<!-- Fim do Espa�amento -->

</body>
</html>