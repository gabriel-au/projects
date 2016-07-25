<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/includes/head.jsp" %>
<body>

<%@ include file="/includes/toolbar.jsp" %>

<div class="titulo">
<a href="<%=request.getContextPath()%>/voo_online/" >
<img src="<%=request.getContextPath()%>/imagens/botao-inicio-azul.png" /></a>
<div class="titulo_texto">Vôos On-line</div>
</div>

<div class="arredondado">
<div class="arredondado_titulo">Consulta por Companhia</div>

<form action="resultado.jsp">


<div class="arredondado_chamada">Aeroporto:</div>

<div class="arredondado_chamada_simples_center">
<select class="input_select" name="aeroporto">
<option value="Selecione um Aeroporto" selected="selected">Selecione um Aeroporto</option>
<option value="SBHT">ALTAMIRA-PA</option>
<option value="SBAR">ARACAJU-SE</option>
<option value="SBBE">BELÉM-PA</option>
<option value="SBBH">BELO HORIZONTE - PAMPULHA-MG</option>
<option value="SBCF">BELO HORIZONTE - T.NEVES-MG</option>
<option value="SBBV">BOA VISTA-RR</option>
<option value="SBBR">BRASÍLIA-DF</option>
<option value="SBKG">CAMPINA GRANDE-PB</option>
<option value="SBKP">CAMPINAS-SP</option>
<option value="SBCG">CAMPO GRANDE-MS</option>
<option value="SBCP">CAMPOS DOS GOYTACAZES-RJ</option>
<option value="SBCJ">CARAJÁS-PA</option>
<option value="SBCR">CORUMBÁ-MS</option>
<option value="SBCM">CRICIÚMA-SC</option>
<option value="SBCZ">CRUZEIRO DO SUL-AC</option>
<option value="SBCY">CUIABÁ-MT</option>
<option value="SBCT">CURITIBA-PR</option>
<option value="SBFL">FLORIANÓPOLIS-SC</option>
<option value="SBFZ">FORTALEZA-CE</option>
<option value="SBFI">FOZ DO IGUAÇU-PR</option>
<option value="SBGO">GOIÂNIA-GO</option>
<option value="SBIL">ILHÉUS-BA</option>
<option value="SBIZ">IMPERATRIZ-MA</option>
<option value="SBJP">JOAO PESSOA-PB</option>
<option value="SBJV">JOINVILLE-SC</option>
<option value="SBJU">JUAZEIRO DO NORTE-CE</option>
<option value="SBLO">LONDRINA-PR</option>
<option value="SBME">MACAÉ-RJ</option>
<option value="SBMQ">MACAPÁ-AP</option>
<option value="SBMO">MACEIÓ-AL</option>
<option value="SBEG">MANAUS-AM</option>
<option value="SBMA">MARABÁ-PA</option>
<option value="SBMK">MONTES CLAROS-MG</option>
<option value="SBNT">NATAL-RN</option>
<option value="SBNF">NAVEGANTES-SC</option>
<option value="SBPJ">PALMAS-TO</option>
<option value="SBPK">PELOTAS-RS</option>
<option value="SBPL">PETROLINA-PE</option>
<option value="SBPA">PORTO ALEGRE-RS</option>
<option value="SBPV">PORTO VELHO - RO</option>
<option value="SBRF">RECIFE-PE</option>
<option value="SBRB">RIO BRANCO-AC</option>
<option value="SBGL">RIO DE JANEIRO - GALEAO-RJ</option>
<option value="SBRJ">RIO DE JANEIRO - S.DUMONT-RJ</option>
<option value="SBSV">SALVADOR-BA</option>
<option value="SBSN">SANTARÉM-PA</option>
<option value="SBSL">SAO LUIS-MA</option>
<option value="SBSP">SAO PAULO - CONGONHAS-SP</option>
<option value="SBGR">SAO PAULO - GUARULHOS-SP</option>
<option value="SBTE">TERESINA-PI</option>
<option value="SBUR">UBERABA-MG</option>
<option value="SBUL">UBERLÂNDIA-MG</option>
<option value="SBUG">URUGUAIANA-RS</option>
<option value="SBVT">VITÓRIA-ES</option>
</select>
</div>

<div class="arredondado_chamada">Companhia Aérea:</div>
<div class="arredondado_chamada_simples_center">
<select class="input_select" name="companhia">
<option value="Selecione uma Companhia Aérea">Selecione uma Companhia Aérea</option>
<option value="ARG">AEROLINEAS ARGENTINAS</option>
<option value="AMX">AEROMEXICO</option>
<option value="RSU">AEROSUR</option>
<option value="ACA">AIR CANADA</option>
<option value="CCA">AIR CHINA</option>
<option value="AFR">AIR FRANCE</option>
<option value="AZA">ALITALIA</option>
<option value="AAL">AMERICAN AIRLINES</option>
<option value="AVA">AVIANCA - AVA</option>
<option value="ONE">AVIANCA - ONE</option>
<option value="BAW">BRITISH AIRWAYS</option>
<option value="COA">CONTINENTAL AIR LINES</option>
<option value="CMP">COPA AIRLINES - PANAMÁ</option>
<option value="DAL">DELTA AIR LINES</option>
<option value="ELY">EL AL ISRAEL AIRLINES</option>
<option value="UAE">EMIRATES AIRLINES</option>
<option value="GLO">GOL</option>
<option value="IBE">IBERIA</option>
<option value="JAL">JAPAN AIRLINES</option>
<option value="KLM">KLM ROYAL DUTCH AIRLINES</option>
<option value="KAL">KOREAN AIRLINES</option>
<option value="DSM">LAN ARGENTINA</option>
<option value="LXP">LAN EXPRESS</option>
<option value="LPE">LAN PERU</option>
<option value="LAN">LAN-CHILE</option>
<option value="DLH">LUFTHANSA</option>
<option value="MXA">MEXICANA DE AVIACION</option>
<option value="NWA">NORTHWEST AIRLINES</option>
<option value="PTB">PASSAREDO</option>
<option value="PUA">PLUNA</option>
<option value="PLY">PUMA AIR</option>
<option value="SAA">SOUTH AFRICAN AIRWAYS</option>
<option value="SWR">SWISSAIR</option>
<option value="DTA">TAAG AIRLINES</option>
<option value="TPU">TACA PERU</option>
<option value="TAM">TAM</option>
<option value="LAP">TAM MERCOSUR</option>
<option value="TAP">TAP PORTUGAL</option>
<option value="TIB">TRIP</option>
<option value="THY">TURKISH AIRLINES</option>
<option value="UAL">UNITED AIRLINES</option>
<option value="WEB">WEBJET</option>
</select>
</div>

<p></p>

<div class="arredondado_chamada_simples_center">
	<input  type="submit" value="" class="input_submit"/>
</div>


</form>
</div>

</body>
</html>