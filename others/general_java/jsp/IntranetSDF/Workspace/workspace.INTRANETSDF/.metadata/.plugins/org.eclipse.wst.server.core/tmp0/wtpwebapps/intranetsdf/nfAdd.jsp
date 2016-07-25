<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!-- include de verifica��o do usu�rio -->
<%@ include file="includes/sessionVerify.jsp"%>
<!-- fim do include verifica��o do usu�rio -->

<html>
<head>
<title>INTRANET CONSORCIO SDF</title>
<link rel="stylesheet" type="text/css" href="estilos/default.css" />

<script language="javascript" type="text/javascript"
	src="scripts/default.js">
	
</script>

<!-- include do menu -->
<jsp:include page="includes/menu.jsp" />
<!-- fim do include do menu -->

</head>

<body>
<!-- include do cabe�alho -->
<jsp:include page="includes/header.jsp" />
<!-- fim do include do cabe�alho -->


<table width="779" border="0" cellspacing="0" cellpadding="0">

	<tr>
		<td width="220">&nbsp;</td>
		<td width="549" height="180" colspan="2" valign="top">
		<form method="POST" action="nfPreview.jsp">
		<table width="549" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="Title">Notas Fiscais - Emiss�o de Notas</td>
			</tr>
			<tr>
				<td height="1" bgcolor="#000000"></td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td valign="top">
				<table width="549" border="0" cellspacing="0" cellpadding="0"
					bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
					<tr>
						<td height="20" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>&nbsp;</td>
						<td colspan="4" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>DESTINAT�RIO/REMETENTE:</td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Nome:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="nome" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td></td>
						<td height="18" class="Title">Endere�o:</td>
						<td></td>
						<td><input type="text" name="endereco" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td></td>
						<td height="18" class="Title">Cidade:</td>
						<td></td>
						<td><input type="text" name="cidade" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td></td>
						<td height="18" class="Title">Estado:</td>
						<td></td>
						<td><select name='estado' id='estado' class='Select'
							style='width: 120px;'>
							<option value='' class='OptionBody1'>-- SELECIONE --</option>
							<option value='AC' class='OptionBody2'>AC</option>
							<option value='AL' class='OptionBody1'>AL</option>
							<option value='AP' class='OptionBody2'>AP</option>
							<option value='AM' class='OptionBody1'>AM</option>
							<option value='BA' class='OptionBody2'>BA</option>
							<option value='CE' class='OptionBody1'>CE</option>
							<option value='DF' class='OptionBody2' selected="selected">DF</option>
							<option value='GO' class='OptionBody1'>GO</option>
							<option value='ES' class='OptionBody2'>ES</option>
							<option value='MA' class='OptionBody1'>MA</option>
							<option value='MT' class='OptionBody2'>MT</option>
							<option value='MS' class='OptionBody1'>MS</option>
							<option value='MG' class='OptionBody2'>MG</option>
							<option value='PA' class='OptionBody1'>PA</option>
							<option value='PB' class='OptionBody2'>PB</option>
							<option value='PR' class='OptionBody1'>PR</option>
							<option value='PE' class='OptionBody2'>PE</option>
							<option value='PI' class='OptionBody1'>PI</option>
							<option value='RJ' class='OptionBody2'>RJ</option>
							<option value='RN' class='OptionBody1'>RN</option>
							<option value='RS' class='OptionBody2'>RS</option>
							<option value='RO' class='OptionBody1'>RO</option>
							<option value='RR' class='OptionBody2'>RR</option>
							<option value='SP' class='OptionBody1'>SP</option>
							<option value='SC' class='OptionBody2'>SC</option>
							<option value='SE' class='OptionBody1'>SE</option>
							<option value='TO' class='OptionBody2'>TO</option>
						</select></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td></td>
						<td height="18" class="Title">Fone/Fax:</td>
						<td></td>
						<td><input type="text" name="fone" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td></td>
						<td height="18" class="Title">Data de Emiss�o:</td>
						<td></td>
						<td><select name='dt_dia' id='dt_dia' class='Select'>
							<option value='00'>00</option>
							<option value='01'>01</option>
							<option value='02'>02</option>
							<option value='03'>03</option>
							<option value='04'>04</option>
							<option value='05'>05</option>
							<option value='06'>06</option>
							<option value='07'>07</option>
							<option value='08'>08</option>
							<option value='09'>09</option>
							<option value='10'>10</option>
							<option value='11'>11</option>
							<option value='12'>12</option>
							<option value='13'>13</option>
							<option value='14'>14</option>
							<option value='15'>15</option>
							<option value='16'>16</option>
							<option value='17'>17</option>
							<option value='18'>18</option>
							<option value='19'>19</option>
							<option value='20'>20</option>
							<option value='21'>21</option>
							<option value='22'>22</option>
							<option value='23'>23</option>
							<option value='24'>24</option>
							<option value='25'>25</option>
							<option value='26'>26</option>
							<option value='27'>27</option>
							<option value='28'>28</option>
							<option value='29'>29</option>
							<option value='30'>30</option>
							<option value='31'>31</option>
						</select> / <select name='dt_mes' id='dt_mes' class='Select'>
							<option value='00'>00</option>
							<option value='01'>01</option>
							<option value='02'>02</option>
							<option value='03'>03</option>
							<option value='04'>04</option>
							<option value='05'>05</option>
							<option value='06'>06</option>
							<option value='07'>07</option>
							<option value='08'>08</option>
							<option value='09'>09</option>
							<option value='10'>10</option>
							<option value='11'>11</option>
							<option value='12'>12</option>
						</select> / <select name='dt_ano' id='dt_ano' class='Select'>
							<option value='0000'>0000</option>
							<!--option value='2007'>2007</option-->
							<option value='2008'>2008</option>
							<option value='2009'>2009</option>
							<option value='2010'>2010</option>
							<option value='2011'>2011</option>
							<option value='2012'>2012</option>
						</select></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" height="20"></td>
					</tr>
					<tr>
						<td></td>
						<td height="18" class="Title">CNPJ:</td>
						<td></td>
						<td><input type="text" name="cnpj" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td></td>
						<td height="18" class="Title">Inscri��o Estadual:</td>
						<td></td>
						<td><input type="text" name="inscricao_estadual" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" height="20"></td>
					</tr>
					<tr>
						<td></td>
						<td height="18" class="Title">Modelo:</td>
						<td></td>
						<td>
							<select name='modelo' id='modelo' class='Select'>
								<option value='1' selected="selected">1</option>
								<option value='2'>2</option>
							</select>
						</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="5" height="10"></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td>
					<table width="549" border="0" cellspacing="0" cellpadding="0"
					bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
					<tr>
						<td height="20" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>&nbsp;</td>
						<td colspan="4" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>DISCRIMINA��O DOS SERVI�OS - 01:</td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">C�digo:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="codigo_01" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Quantidade:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="quantidade_01" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Al�quota:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="aliquota_01" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Pre�o Unit�rio:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="preco_unitario_01" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Pre�o Total:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="preco_total_01" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Descri��o:</td>
						<td width="9"></td>
						<td width="300">
							<textarea name="descricao_01" class="TextArea" style="width:250px; height:100px;"></textarea>
						</td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td colspan="5" height="10"></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td>
					<table width="549" border="0" cellspacing="0" cellpadding="0"
					bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
					<tr>
						<td height="20" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>&nbsp;</td>
						<td colspan="4" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>DISCRIMINA��O DOS SERVI�OS - 02:</td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">C�digo:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="codigo_02" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Quantidade:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="quantidade_02" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Al�quota:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="aliquota_02" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Pre�o Unit�rio:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="preco_unitario_02" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Pre�o Total:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="preco_total_02" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Descri��o:</td>
						<td width="9"></td>
						<td width="300">
							<textarea name="descricao_02" class="TextArea" style="width:250px; height:100px;"></textarea>
						</td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td colspan="5" height="10"></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td>
					<table width="549" border="0" cellspacing="0" cellpadding="0"
					bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
					<tr>
						<td height="20" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>&nbsp;</td>
						<td colspan="4" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>DISCRIMINA��O DOS SERVI�OS - 03:</td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">C�digo:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="codigo_03" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Quantidade:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="quantidade_03" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Al�quota:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="aliquota_03" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Pre�o Unit�rio:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="preco_unitario_03" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Pre�o Total:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="preco_total_03" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Descri��o:</td>
						<td width="9"></td>
						<td width="300">
							<textarea name="descricao_03" class="TextArea" style="width:250px; height:100px;"></textarea>
						</td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td colspan="5" height="10"></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td>
					<table width="549" border="0" cellspacing="0" cellpadding="0"
					bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
					<tr>
						<td height="20" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>&nbsp;</td>
						<td colspan="4" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>DISCRIMINA��O DOS SERVI�OS - 04:</td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">C�digo:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="codigo_04" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Quantidade:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="quantidade_04" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Al�quota:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="aliquota_04" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Pre�o Unit�rio:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="preco_unitario_04" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Pre�o Total:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="preco_total_04" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Descri��o:</td>
						<td width="9"></td>
						<td width="300">
							<textarea name="descricao_04" class="TextArea" style="width:250px; height:100px;"></textarea>
						</td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td colspan="5" height="10"></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td>
					<table width="549" border="0" cellspacing="0" cellpadding="0"
					bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
					<tr>
						<td height="20" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>&nbsp;</td>
						<td colspan="4" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>DISCRIMINA��O DOS SERVI�OS - 05:</td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">C�digo:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="codigo_05" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Quantidade:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="quantidade_05" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Al�quota:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="aliquota_05" class="Input"
							maxlength="255" style="width: 100px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Pre�o Unit�rio:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="preco_unitario_05" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Pre�o Total:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="preco_total_05" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Descri��o:</td>
						<td width="9"></td>
						<td width="300">
							<textarea name="descricao_05" class="TextArea" style="width:250px; height:100px;"></textarea>
						</td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td colspan="5" height="10"></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td>
					<table width="549" border="0" cellspacing="0" cellpadding="0"
					bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
					<tr>
						<td height="20" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>&nbsp;</td>
						<td colspan="4" class="TableResultTitle"
							style='border-bottom: 1px solid #000000;'>TOTAL:</td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Dedu��es Legais:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="deducoes_legais" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="5"></td>
					</tr>
					<tr>
						<td width="10"></td>
						<td width="220" height="18" class="Title">Valor Total:</td>
						<td width="9"></td>
						<td width="300"><input type="text" name="valor_total" class="Input"
							maxlength="255" style="width: 250px;"></td>
						<td width="10"></td>
					</tr>
					<tr>
						<td colspan="5" height="25"></td>
					</tr>
					<tr>
						<td width="10">&nbsp;</td>
						<td colspan="3" align="right"><input type='submit'
							value='Emitir' id='Emitir' class='Button'
							onMouseOut='buttonOn(this)' onMouseOver='buttonOver(this)'
							style='width: 100px;'></td>
						<td width="10">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5" height="10"></td>
					</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td height="10"></td>
			</tr>
		</table>
		</form>
		</td>
		<td width="10"></td>
	</tr>
	<tr>
		<td colspan="3" height="20">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3" height="20">&nbsp;</td>
	</tr>
	<tr>
		<td colspan="3" align="center" class="Footer"><!-- include do rodap� -->
		<jsp:include page="includes/footer.jsp" /> <!-- fim do include do rodap� -->
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>
</body>
</html>