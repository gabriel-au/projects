<%@ page import="br.com.consorciosdf.intranet.controle.ManterReportControl" %>
<%@ page import="br.com.consorciosdf.intranet.modelo.*" %>

<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<jsp:useBean id="relatorio" class="br.com.consorciosdf.intranet.modelo.Relatorio" scope="request"/>
<jsp:useBean id="relatorioVerify" class="br.com.consorciosdf.intranet.modelo.Relatorio" scope="request"/>
<jsp:useBean id="equipamento" class="br.com.consorciosdf.intranet.modelo.Equipamento" scope="request"/>
<jsp:useBean id="tecnico" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- include de paginação de resultados - cabeçalho -->
<%@ include file="includes/pageNavigatorHeader.jsp"%>
<!-- fim do include de paginação de resultados - cabeçalho -->

<%
    
    SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
    
    String relatorioTipoId = "";
    String relatorioTipoNome = "";
    
    List listEquipamentos = null;
    
    if ((session.getAttribute("relatorioTipoId")) != null &&
        (session.getAttribute("relatorioTipoNome")) != null) {
        
        relatorioTipoId = (String) session.getAttribute("relatorioTipoId");
        relatorioTipoNome = (String) session.getAttribute("relatorioTipoNome");
        
        if ((request.getParameter("relatorioTipoId")) != null &&
                (request.getParameter("relatorioTipoNome")) != null) {
            
            String relatorioTipoIdReq = request.getParameter("relatorioTipoId");
            String relatorioTipoNomeReq = request.getParameter("relatorioTipoNome");
                
            if (!relatorioTipoId.equals(relatorioTipoIdReq) &&
                    !relatorioTipoNome.equals(relatorioTipoNomeReq)) {
                
                relatorioTipoId = request.getParameter("relatorioTipoId");
                relatorioTipoNome = request.getParameter("relatorioTipoNome");
                
                session.setAttribute("relatorioTipoId", request.getParameter("relatorioTipoId"));
                session.setAttribute("relatorioTipoNome", request.getParameter("relatorioTipoNome"));
            }
        }
        
    } else {
        if ((request.getParameter("relatorioTipoId")) != null &&
                (request.getParameter("relatorioTipoNome")) != null) {
                
            relatorioTipoId = request.getParameter("relatorioTipoId");
            relatorioTipoNome = request.getParameter("relatorioTipoNome");
            
            session.setAttribute("relatorioTipoId", request.getParameter("relatorioTipoId"));
            session.setAttribute("relatorioTipoNome", request.getParameter("relatorioTipoNome"));
        }
    }
    
    List list = null;
    ManterReportControl manterReportControl = new ManterReportControl();
    list = manterReportControl.recuperarReportsPag(Integer.parseInt(relatorioTipoId), paginaInicial, qtdRegistros, orderBy, order);
    
    listEquipamentos = manterReportControl.recuperarEquipamentos();
    
    if (list != null) {
        if (list.size() > 0) {
            relatorioVerify = (Relatorio) list.get(0);
            paginacao = relatorioVerify.getPaginacao();
        }
    }
    
%>

<!-- include de paginação de resultados - rodapé -->
<%@ include file="includes/pageNavigatorFooter.jsp"%>
<!-- fim do include de paginação de resultados - rodapé -->

<!-- include de verificação do usuário -->
<%@ include file="includes/sessionVerify.jsp"%>
<!-- fim do include verificação do usuário -->

<html>
<head>
<title>INTRANET CONSORCIO SDF</title>
<link rel="stylesheet" type="text/css" href="estilos/default.css" />

<script language="javascript" type="text/javascript" src="scripts/default.js">
</script>

<!-- include do menu -->
<jsp:include page="includes/menu.jsp" />
<!-- fim do include do menu -->

</head>

<body>
<!-- include do cabeçalho -->
<jsp:include page="includes/header.jsp" />
<!-- fim do include do cabeçalho -->

<table width="779" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td width="220">&nbsp;</td>
    <td width="549" height="180" colspan="2" valign="top">
        <form method="get" action="">
	        <table width="549" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	                <td class="Title">
	                    <table width='549' cellspacing='0' cellpadding='0' border='0'>
	                        <tr>
	                            <td class="Title" width="420"><%= relatorioTipoNome %> - Listagem (<%= paginacao.getResultSize() %> Registros - Página <%= pageNumber %> de <%= paginacao.getPageNavigator() %>)</td>
	                            <td width="129" align="right">
	                                <a href="javascript:history.back()"><img src="imagens/stock_navigator-back-16.gif" border="0" alt="Voltar"></a>
	                                <a href="#"><img src="imagens/stock_search-16.gif" border="0" alt="Procurar"></a>
	                                <a href="reportUpload.jsp?relatorioTipoId=<%= relatorioTipoId %>&relatorioTipoNome=<%= relatorioTipoNome %>"><img src="imagens/stock_new-16.gif" border="0" alt="Novo"></a>
	                                <a href="javascript:window.location.reload()"><img src="imagens/stock_refresh-16.gif" border="0" alt="Atualizar"></a>
	                            </td>
	                        </tr>
	                    </table>
	                </td>
	            </tr>
	            <tr>
	                <td height="1" bgcolor="#000000"></td>
	            </tr>
	            <tr>
	                <td height="10"></td>
	            </tr>
	            <tr>
	                <td>
	                    <table width='549' cellspacing='0' cellpadding='0' border='0'>
	                        <tr>
	                            <td width="150" class="Title">Nº:</td>
	                            <td width="399"><input type="text" name="num" class="Input" onkeypress='return Number(event)'
	                                                       maxlength="20"
	                                                   style="width:120px;"></td>
	                        </tr>
	                        <tr>
	                            <td width="150" class="Title">Tipo:</td>
	                            <td width="399">
	                                <select name='tipo_os' id='tipo_os' class='Select' style='width:250px;'>
	                                    <option value='' class='OptionBody1'>-- SELECIONE --</option>
	                                    <option value='1' class='OptionBody2'>Coleta</option>
	                                    <option value='2' class='OptionBody1'>Corretiva</option>
	                                    <option value='3' class='OptionBody2'>DTS</option>
	                                </select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="Title">Equipamento:</td>
	                            <td>
	                                <%
	
	                                if (listEquipamentos != null) {
	                                    String optionStyle = "OptionBody1";
	                                    int countResult = 0;
	
	                                    out.println("<select name='equipamento' id='equipamento' class='Select' style='width:120px;'>");
	                                    out.println("<option value='0' " + " class='" + optionStyle + "'>-- SELECIONE --</option>");
	
	                                    countResult++;
	
	                                    for (int i=0; i < listEquipamentos.size(); i++) {
	                                        equipamento = (Equipamento) listEquipamentos.get(i);
	                                        countResult++;
	
	                                        if (countResult % 2 == 0) {
	                                            optionStyle = "OptionBody2";
	                                        } else if (countResult % 2 == 1) {
	                                            optionStyle = "OptionBody1";
	                                        }
	
	                                        out.println("<option value='" + equipamento.getIdEquipamento() + "' class='" + optionStyle + "'>");
	                                        out.println(equipamento.getNomeEquipamento());
	                                        out.println("</option>");
	                                    }
	
	                                    out.println("</select>");
	                                    } else {
	                                        out.println("<select name='equipamentoSelect' class='Select' style='width:150px;' disabled='disabled'>");
	                                        out.println("<option>Não há equipamentos para selecionar.</option>");
	                                        out.println("</select>");
	                                }
	
	                                %>
	                            </td>
	                        </tr>
	                        <!--tr>
	                            <td class="Title">Técnico:</td>
	                            <td>
	                                <%--
	
	                                if (listUsuarios != null) {
	                                    String optionStyle = "OptionBody1";
	                                    int countResult = 0;
	
	                                    out.println("<select name='tecnico' id='tecnico' class='Select' style='width:250px;'>");
	                                    out.println("<option value='' " + " class='" + optionStyle + "'>-- SELECIONE --</option>");
	
	                                    countResult++;
	
	                                    for (int i=0; i < listUsuarios.size(); i++) {
	                                        usuario = (Usuario) listUsuarios.get(i);
	                                        countResult++;
	
	                                        if (countResult % 2 == 0) {
	                                            optionStyle = "OptionBody2";
	                                        } else if (countResult % 2 == 1) {
	                                            optionStyle = "OptionBody1";
	                                        }
	
	                                        out.println("<option value='" + usuario.getMatriculaUsuario() + "' class='" + optionStyle + "'>");
	                                        out.println(usuario.getNomeUsuario() + " " + usuario.getSobrenomeUsuario() + " (" + usuario.getUser() + ")");
	                                        out.println("</option>");
	                                    }
	
	                                    out.println("</select>");
	                                    } else {
	                                        out.println("<select name='userSelect' class='Select' style='width:150px;' disabled='disabled'>");
	                                        out.println("<option>Não há usuários para editar.</option>");
	                                        out.println("</select>");
	                                }
	
	                                --%>
	                            </td>
	                        </tr-->
	                        <tr>
	                            <td class="Title">Data de Abertura:</td>
	                            <td>
	                                <%
	
	                                out.println("<select name='dt_ini_dia' id='dt_ini_dia' class='Select'>");
	
	                                for (int dia=0; dia <= 31; dia++) {
	                                    String selected = "";
	                                    /*if (dtAbertura != null) {
	                                    if (dia == dtAbertura.get(Calendar.DAY_OF_MONTH)) {
	                                    selected = " selected='selected'";
	                                    }
	                                    }*/
	
	                                    out.println("<option value='" + dia + "'" + selected + ">" + dia + "</option>");
	                                }
	
	                                out.println("</select>");
	
	                                out.println(" / ");
	
	                                out.println("<select name='dt_ini_mes' id='dt_ini_mes' class='Select'>");
	
	                                for (int mes=0; mes <= 12; mes++) {
	                                    String selected = "";
	                                    /*if (dtAbertura != null) {
	                                    if (mes == (dtAbertura.get(Calendar.MONTH)) + 1) {
	                                    selected = " selected='selected'";
	                                    }
	                                    }*/
	                                    out.println("<option value='" + mes + "'" + selected + ">" + mes + "</option>");
	                                }
	
	                                out.println("</select>");
	
	                                out.println(" / ");
	
	                                out.println("<select name='dt_ini_ano' id='dt_ini_ano' class='Select'>");
	                                out.println("<option value='0'>0</option>");
	
	                                for (int ano=2007; ano <= 2011; ano++) {
	                                    String selected = "";
	                                    /*if (dtAbertura != null) {
	                                    if (ano == dtAbertura.get(Calendar.YEAR)) {
	                                    selected = " selected='selected'";
	                                    }
	                                    }*/
	
	                                    out.println("<option value='" + ano + "'" + selected + ">" + ano + "</option>");
	                                }
	
	                                out.println("</select>");
	
	                                out.println("&nbsp");
	
	                                %>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="Title">Data de Fechamento:</td>
	                            <td>
	                                <%
	
	                                out.println("<select name='dt_fim_dia' id='dt_fim_dia' class='Select'>");
	
	                                for (int dia=0; dia <= 31; dia++) {
	                                    String selected = "";
	                                    /*if (dtFechamento != null) {
	                                    if (dia == dtFechamento.get(Calendar.DAY_OF_MONTH)) {
	                                    selected = " selected='selected'";
	                                    }
	                                    }*/
	
	                                    out.println("<option value='" + dia + "'" + selected + ">" + dia + "</option>");
	                                }
	
	                                out.println("</select>");
	
	                                out.println(" / ");
	
	                                out.println("<select name='dt_fim_mes' id='dt_fim_mes' class='Select'>");
	
	                                for (int mes=0; mes <= 12; mes++) {
	                                    String selected = "";
	                                    /*if (dtFechamento != null) {
	                                    if (mes == (dtFechamento.get(Calendar.MONTH)) + 1) {
	                                    selected = " selected='selected'";
	                                    }
	                                    }*/
	                                    out.println("<option value='" + mes + "'" + selected + ">" + mes + "</option>");
	                                }
	
	                                out.println("</select>");
	
	                                out.println(" / ");
	
	                                out.println("<select name='dt_fim_ano' id='dt_fim_ano' class='Select'>");
	                                out.println("<option value='0'>0</option>");
	
	                                for (int ano=2007; ano <= 2009; ano++) {
	                                    String selected = "";
	                                    /*if (dtFechamento != null) {
	                                    if (ano == dtFechamento.get(Calendar.YEAR)) {
	                                    selected = " selected='selected'";
	                                    }
	                                    }*/
	
	                                    out.println("<option value='" + ano + "'" + selected + ">" + ano + "</option>");
	                                }
	
	                                out.println("</select>");
	
	                                out.println("&nbsp");
	
	                                %>
	                            </td>
	                        </tr>
	                        <tr>
	                            <td colspan="2" height="15"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="2" align="right">
	                                <input type="button" value="Limpar Filtro" id="Limpar Filtro" class="Button" onClick="location.href='osList.jsp'" onMouseOut="buttonOn(this)" onMouseOver="buttonOver(this)" style="width: 100px;">&nbsp;&nbsp;&nbsp;
	                                <input type="submit" value="Filtrar" id="Filtrar" class="Button" onMouseOut="buttonOn(this)" onMouseOver="buttonOver(this)" style="width: 100px;">
	                            </td>
	                        </tr>
	                    </table>
	                </td>
	            </tr>
	            <tr>
	                <td height="20"></td>
	            </tr>
	            <tr>
	                <td>
	                    <table width='549' cellspacing='0' cellpadding='0' border='0' style='border: 1px solid #000000;'>
	                        <tr>
	                            <td width='20' height='18' class='TableResultTitle' style='border-bottom: 1px solid #000000;'>&nbsp</td>
	                            <td width='50' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=id" class="LinkTitle">N&deg;.</a></td>
	                            <td width='60' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=equipamento" class="LinkTitle">Equip.</a></td>
	                            <td width='230' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=observacao" class="LinkTitle">Observação</a></td>
	                            <td width='39' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=tecnico" class="LinkTitle">Tec.</a></td>
	                            <td width='150' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=data" class="LinkTitle">Data Inicial</a></td>
	                        </tr>
	                        <%
	                    
	                            if (list != null) {
	                                String tableStyle = "TableResultBody1";
	                                String linkReport = "";
	                                
	                                int countResult = 0;
	
	                                for (int i=0; i < list.size(); i++) {
	                                    relatorio = (Relatorio) list.get(i);
	                                    equipamento = relatorio.getEquipamento();
	                                    tecnico = relatorio.getTecnico();
	                                    
	                                    linkReport = "reportView.jsp?id=" + relatorio.getId() +
	                                            "&relatorioTipoId=" + relatorioTipoId +
	                                            "&relatorioTipoNome=" + relatorioTipoNome;
	
	                                    countResult++;
	
	                                    if (countResult % 2 == 0) {
	                                        tableStyle = "TableResultBody2";
	                                    } else if (countResult % 2 == 1) {
	                                        tableStyle = "TableResultBody1";
	                                    }
	                                    
	                                    String dtInicial = "";
	                                    
	                                    if (relatorio.getDataInicial() != null) {
	                                        dtInicial = dateFormat.format(relatorio.getDataInicial());
	                                    }
	
	                                    %>
	
	                                    <tr>
	                                        <td height='16' class='<%= tableStyle %>' align="right"><img src="imagens/topico.gif" height="15" width="15" alt=""></td>
	                                        <td class='<%= tableStyle %>'><a href="<%= linkReport %>"><%= relatorio.getId() %></a></td>
	                                        <td class='<%= tableStyle %>'><a href="<%= linkReport %>"><%= equipamento.getNomeEquipamento() %></a></td>
	                                        <td class='<%= tableStyle %>'><a href="<%= linkReport %>"><%= relatorio.getObservacao() %></a></td>
	                                        <td class='<%= tableStyle %>'><a href="<%= linkReport %>"><%= tecnico.getMatriculaUsuario() %></a></td>
	                                        <td class='<%= tableStyle %>'><a href="<%= linkReport %>"><%= dtInicial %></a></td>
	                                    </tr>
	
	                                    <%
	                                }
	                            }
	
	                        %>
	                        
	                        <tr>
	                            <td colspan="6" height="5"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="6" align="center"><%= pageViewNavigator %></td>
	                        </tr>
	                        <tr>
	                            <td colspan="6" height="5"></td>
	                        </tr>
	                    </table>
	                </td>
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
    <td colspan="3" align="center" class="Footer">
        <!-- include do rodapé -->
        <jsp:include page="includes/footer.jsp" />
        <!-- fim do include do rodapé -->
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