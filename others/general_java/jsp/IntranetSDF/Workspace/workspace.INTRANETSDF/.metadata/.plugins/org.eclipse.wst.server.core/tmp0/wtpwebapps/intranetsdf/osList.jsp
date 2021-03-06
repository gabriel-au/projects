<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%--@page contentType="text/html" pageEncoding="UTF-8"--%>

<%@ page import="br.com.consorciosdf.intranet.controle.ManterOSControl" %>
<%@ page import="br.com.consorciosdf.intranet.controle.ManterUserControl" %>
<%@ page import="br.com.consorciosdf.intranet.modelo.*" %>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>

<jsp:useBean id="os" class="br.com.consorciosdf.intranet.modelo.OS" scope="request"/>
<jsp:useBean id="osVerify" class="br.com.consorciosdf.intranet.modelo.OS" scope="request"/>
<jsp:useBean id="checkEquipamento" class="br.com.consorciosdf.intranet.modelo.CheckEquipamento" scope="request"/>
<jsp:useBean id="equipamento" class="br.com.consorciosdf.intranet.modelo.Equipamento" scope="request"/>
<jsp:useBean id="usuario" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request" />
<jsp:useBean id="usuarioAutor" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request"/>
<jsp:useBean id="usuarioDest" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request"/>
<jsp:useBean id="usuarioAtual" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request"/>

<!-- include de verifica��o do usu�rio -->
<%@ include file="includes/sessionVerify.jsp"%>
<!-- fim do include verifica��o do usu�rio -->

<!-- include de pagina��o de resultados - cabe�alho -->
 <%@ include file="includes/pageNavigatorHeader.jsp"%> 
<!-- fim do include de pagina��o de resultados - cabe�alho -->


<!-- Aumento de propriedades para o filtro de busca
e retirada do include de "MENU"-->
<%

            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");

            Date dataNow = new Date();
            long dataTimeNow = dataNow.getTime();
            long dataVerificador = 1 * 24 * 60 * 60 * 1000; //1 dias * 24 horas * 60 minutos * 60 segundos * 1000 milisegundos
            long dataVerifyStatus = dataTimeNow - dataVerificador;

            //String que guarda o valor dos campos que especificam a pesquisa.


            List list = null;
            List listEquipamentos = null;
            List listUsuarios = null;


            ManterOSControl manterOSControl = new ManterOSControl();
            ManterUserControl manterUserControl = new ManterUserControl();

            usuarioAtual.setUser((String) session.getAttribute("user"));
            usuarioAtual.setMatriculaUsuario((String) session.getAttribute("userMatricula"));
            usuarioAtual = manterUserControl.viewUser(usuarioAtual);
            
            ManterUserRulesControl userRulesControl = new ManterUserRulesControl();
            usuarioAtual.setUsuarioRules(userRulesControl.listUserRules(usuarioAtual.getCodUsuario()));
            /*		
            if (request.getParameter("numOS") != null &&
                    request.getParameter("statusOS") != null &&
                    request.getParameter("prioridadeOS") != null &&
                    request.getParameter("tipoOS") != null &&
                    request.getParameter("equipamento") != null &&
                    request.getParameter("tecnico") != null &&
                    request.getParameter("dt_ano_dia") != null &&
                    request.getParameter("dt_ini_dia") != null &&
                    request.getParameter("dt_serv_dia") != null &&
                    request.getParameter("dt_fim_dia") != null) {
			*/
                int idOS = 0;
                int idEquipamento = 0;
				
                String statusF = null;
                String prioridade = null;
                String tipoOS = null;
                String matriculaTecnico = null;
                String dateAnomalia = null;
                String dataInicial = null;
                String dateServico = null;
                String dataFinal = null;
                
                if(request.getParameter("LFOS") == null){
        		
                	orderBy = request.getParameter("orderBy");
                	if(orderBy != null && !orderBy.equals("")){
                		request.getSession().setAttribute("orderByFiltroOS",orderBy);
                	} else{
                		orderBy = (String) request.getSession().getAttribute("orderByFiltroOS");
                	}
                	
                	if(request.getParameter("numOS") != null && !request.getParameter("numOS").trim().equals("")){
                		idOS = Integer.parseInt(request.getParameter("numOS"));
                		request.getSession(true).setAttribute("numFiltroOS",idOS);
                	}else{
                		if(request.getSession().getAttribute("numFiltroOS") != null){
                			Object ob = request.getSession().getAttribute("numFiltroOS");
                			if(ob instanceof Integer){
                				idOS = (Integer)request.getSession().getAttribute("numFiltroOS");
                			}
                			if(ob instanceof String){
                				idOS = Integer.parseInt((String)request.getSession().getAttribute("numFiltroOS"));	
                			}
                				
                		}
                		
                	}
                	
            		statusF = request.getParameter("statusOS");
            		if(statusF != null && !statusF.trim().equals("")){
            			request.getSession(true).setAttribute("statusFiltroOS",statusF);
            		}else{
            			statusF = (String) request.getSession().getAttribute("statusFiltroOS");
            		}
            		
            		prioridade = request.getParameter("prioridadeOS");
            		if(prioridade != null && !prioridade.trim().equals("")){
            			request.getSession(true).setAttribute("prioridadeFiltroOS",prioridade);
            		} else{
            			prioridade = (String) request.getSession().getAttribute("prioridadeFiltroOS");
            		}
            		
            		tipoOS = request.getParameter("tipoOS");
            		if(tipoOS != null && !tipoOS.trim().equals("")){
            			request.getSession(true).setAttribute("tipoFiltroOS",tipoOS);
            		}else{
            			tipoOS = (String) request.getSession().getAttribute("tipoFiltroOS");
            		}
            		
            		matriculaTecnico = request.getParameter("tecnico");
            		if(matriculaTecnico != null && !matriculaTecnico.trim().equals("")){
            			request.getSession(true).setAttribute("matriculaFiltroOS",matriculaTecnico);
            		} else{
            			matriculaTecnico = (String) request.getSession().getAttribute("matriculaFiltroOS");
            		}
            		
            		if(request.getParameter("equipamento") != null){
            			idEquipamento = Integer.parseInt(request.getParameter("equipamento"));	
            		}            		
            		if(idEquipamento != 0){
            			request.getSession(true).setAttribute("equipamentoFiltroOS",""+idEquipamento);
            		} else{
            			if(request.getSession().getAttribute("equipamentoFiltroOS") != null){
            				idEquipamento = Integer.parseInt((String) request.getSession().getAttribute("equipamentoFiltroOS"));	
            			}
            		}
               
            		if(request.getParameter("dt_ano_dia") != null
            				&& request.getParameter("dt_ano_mes") != null 
            				&& request.getParameter("dt_ano_ano") != null){
            			if (!request.getParameter("dt_ano_dia").trim().equals("00") &&
                                !request.getParameter("dt_ano_mes").trim().equals("00") &&
                                !request.getParameter("dt_ano_ano").trim().equals("0000")) {
                            dateAnomalia = request.getParameter("dt_ano_ano") + "-" +
                                    request.getParameter("dt_ano_mes") + "-" + request.getParameter("dt_ano_dia");
                            request.getSession(true).setAttribute("dataAnomaliaFiltroOS",dateAnomalia);

                        } else{
                        	dateAnomalia = (String)request.getSession().getAttribute("dataAnomaliaFiltroOS");
                        }
            		}else{
                    	dateAnomalia = (String)request.getSession().getAttribute("dataAnomaliaFiltroOS");
                    }
            		
            		if(request.getParameter("dt_ini_dia") != null
            				&& request.getParameter("dt_ini_mes") != null 
            				&& request.getParameter("dt_ini_ano") != null){
	                    if (!request.getParameter("dt_ini_dia").trim().equals("00") &&
	                            !request.getParameter("dt_ini_mes").trim().equals("00") &&
	                            !request.getParameter("dt_ini_ano").trim().equals("0000")) {
	                        
	                    	dataInicial = request.getParameter("dt_ini_ano") + "-" +
	                                request.getParameter("dt_ini_mes") + "-" + request.getParameter("dt_ini_dia");
	                        request.getSession(true).setAttribute("dataInicialFiltroOS",dataInicial);

	                        	
	                    } else {
	                    	dataInicial = (String)request.getSession().getAttribute("dataInicialFiltroOS");
	                    }
            		} else {
            			dataInicial = (String)request.getSession().getAttribute("dataInicialFiltroOS");
            		}
                    
                    if(request.getParameter("dt_serv_dia") != null
            				&& request.getParameter("dt_serv_mes") != null 
            				&& request.getParameter("dt_serv_ano") != null){
	                    if (!request.getParameter("dt_serv_dia").trim().equals("00") &&
	                            !request.getParameter("dt_serv_mes").trim().equals("00") &&
	                            !request.getParameter("dt_serv_ano").trim().equals("0000")) {
	                        dateServico = request.getParameter("dt_serv_ano") + "-" +
	                                request.getParameter("dt_serv_mes") + "-" + request.getParameter("dt_serv_dia");
	                        request.getSession(true).setAttribute("dataServicoFilroOS",dateServico);
;
	                        	
	                    } else {
	                    	dateServico = (String)request.getSession().getAttribute("dataServicoFiltroOS");
	                    }
                    } else{
                    	dateServico = (String)request.getSession().getAttribute("dataServicoFiltroOS");
                    }
                    
                    if(request.getParameter("dt_fim_dia") != null
            				&& request.getParameter("dt_fim_mes") != null 
            				&& request.getParameter("dt_fim_ano") != null){
	                    if (!request.getParameter("dt_fim_dia").trim().equals("00") &&
	                            !request.getParameter("dt_fim_mes").trim().equals("00") &&
	                            !request.getParameter("dt_fim_ano").trim().equals("0000")) {
	                        dataFinal = request.getParameter("dt_fim_ano") + "-" +
	                                request.getParameter("dt_fim_mes") + "-" + request.getParameter("dt_fim_dia");
	                        request.getSession(true).setAttribute("dataFinalFiltroOS",dataFinal);

	                    } else {
	                    	dataFinal = (String)request.getSession().getAttribute("dataFinalFiltroOS");
	                    }
                    } else {
                    	dataFinal = (String)request.getSession().getAttribute("dataFinalFiltroOS");
                    }
            		             	
                	
                } else{
                	request.getSession(true).setAttribute("numFiltroOS","0");
                	request.getSession(true).setAttribute("statusFiltroOS",null);
                	request.getSession(true).setAttribute("prioridadeFiltroOS",null);
                	request.getSession(true).setAttribute("tipoFiltroOS",null);
                	request.getSession(true).setAttribute("matriculaFiltroOS",null);
                	request.getSession(true).setAttribute("equipamentoFiltroOS","0");
                	request.getSession(true).setAttribute("dataAnomaliaFiltroOS",null);
                	request.getSession(true).setAttribute("dataInicialFiltroOS",null);
                	request.getSession(true).setAttribute("dataServicoFilroOS",null);
                	request.getSession(true).setAttribute("dataFinalFiltroOS",null);
            	}


                /*
                if (!request.getParameter("numOS").trim().equals("")) {
                    idOS = Integer.parseInt(request.getParameter("numOS"));

                }
                if (!request.getParameter("statusOS").equals("")) {
                    status = request.getParameter("statusOS");
                }

                if(!request.getParameter("prioridadeOS").equals("")){
                    prioridade = request.getParameter("prioridadeOS");
                }

                if (!request.getParameter("tipoOS").equals("")) {
                    tipoOS = request.getParameter("tipoOS");

                }
                if (!request.getParameter("equipamento").equals("0")) {
                    idEquipamento = Integer.parseInt(request.getParameter("equipamento"));


                }
                if (!request.getParameter("tecnico").equals("")) {
                    matriculaTecnico = request.getParameter("tecnico");


                }
                if (!request.getParameter("dt_ano_dia").trim().equals("0") &&
                        !request.getParameter("dt_ano_mes").trim().equals("0") &&
                        !request.getParameter("dt_ano_ano").trim().equals("0")) {

                    dateAnomalia = request.getParameter("dt_ano_ano") + "-" +
                            request.getParameter("dt_ano_mes") + "-" + request.getParameter("dt_ano_dia");
                }
                if (!request.getParameter("dt_ini_dia").trim().equals("0") &&
                        !request.getParameter("dt_ini_mes").trim().equals("0") &&
                        !request.getParameter("dt_ini_ano").trim().equals("0")) {

                    dataInicial = request.getParameter("dt_ini_ano") + "-" +
                            request.getParameter("dt_ini_mes") + "-" + request.getParameter("dt_ini_dia");
                }
                if (!request.getParameter("dt_serv_dia").trim().equals("0") &&
                        !request.getParameter("dt_serv_mes").trim().equals("0") &&
                        !request.getParameter("dt_serv_ano").trim().equals("0")) {

                    dateServico = request.getParameter("dt_serv_ano") + "-" +
                            request.getParameter("dt_serv_mes") + "-" + request.getParameter("dt_serv_dia");
                }
                if (!request.getParameter("dt_fim_dia").trim().equals("0") &&
                        !request.getParameter("dt_fim_mes").trim().equals("0") &&
                        !request.getParameter("dt_fim_ano").trim().equals("0")) {

                    dataFinal = request.getParameter("dt_fim_ano") + "-" +
                            request.getParameter("dt_fim_mes") + "-" + request.getParameter("dt_fim_dia");
                }
                */
                
                list = manterOSControl.recuperarOSsPagFiltro(idOS, statusF, prioridade,tipoOS, idEquipamento, matriculaTecnico, dateAnomalia,dataInicial,dateServico, dataFinal, paginaInicial, qtdRegistros, orderBy, order);

               /* 
            } else {
                
            }*/

            listEquipamentos = manterOSControl.recuperarEquipamentos();
            listUsuarios = manterUserControl.listUsers();

            if (list != null) {
                if (list.size() > 0) {
                    osVerify = (OS) list.get(0);
                    paginacao = osVerify.getPaginacao();
                }
            }

%>


<!-- include de pagina��o de resultados - rodap� -->
<%@ include file="includes/pageNavigatorFooter.jsp"%>
<!-- fim do include de pagina��o de resultados - rodap� -->


<%@page import="java.awt.image.DataBuffer"%>
<%@page import="br.com.consorciosdf.intranet.persistencia.ManterUserRuleDAO"%>
<%@page import="br.com.consorciosdf.intranet.controle.ManterUserRulesControl"%><html>
    <head>
        <title>INTRANET CONSORCIO SDF</title>
        <link rel="stylesheet" type="text/css" href="estilos/default.css" />

        <script language="javascript" type="text/javascript" src="scripts/default.js">
        </script>

        <!-- include do menu -->
        <%-- <jsp:include page="includes/menu.jsp" /> --%>
        <!-- fim do include do menu -->

    </head>

    <body>
        <!-- include do cabe�alho -->
        <jsp:include page="includes/header.jsp" />
        <!-- fim do include do cabe�alho -->
        <table width="" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td width="15">&nbsp;</td>
                <td width="" height="180" colspan="2" valign="top">
                    <form method="get" action="">
                        <table width="" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="Title">
                                    <table width='100%' cellspacing='0' cellpadding='0' border='0'>
                                        <tr>
                                            <td class="Title" width="">Ordem de Servi�o - Listagem (<%= paginacao.getResultSize()%> Registros - P�gina <%= pageNumber%> de <%= paginacao.getPageNavigator()%>)</td>
                                            <td width="" align="right">
                                                <%-- <a href="javascript:history.back()"><img src="imagens/stock_navigator-back-16.gif" border="0" alt="Voltar"></a>--%>
                                                    <%--  <a href="#"><img src="imagens/stock_search-16.gif" border="0" alt="Procurar"></a>--%>
                                                    <%
                                                    
                                                    if(usuarioAtual == null || usuarioAtual.getCodUsuario() == 0 ){
                                                    	usuarioAtual.setUser((String) session.getAttribute("user"));
                                                        usuarioAtual.setMatriculaUsuario((String) session.getAttribute("userMatricula"));
                                                        usuarioAtual = manterUserControl.viewUser(usuarioAtual);
                                                    }
                                                    
                                                    if(usuarioAtual.getUsuarioRules() == null || usuarioAtual.getUsuarioRules().size() == 0){
                                                    	usuarioAtual.setUsuarioRules(userRulesControl.listUserRules(usuarioAtual.getCodUsuario()));	
                                                    }											
                                                    
                                                    
										            for (int j = 0; j < usuarioAtual.getUsuarioRules().size(); j++) {
										
										                if (usuarioAtual.getUsuarioRules().get(j).getNome().equals("os_incluir")) {%>

                                                <a href="osAdd.jsp"><img src="imagens/stock_new-16.gif" border="0" alt="Novo"></a>
                                                    <%}
										            }%>

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
                                    <table width='' cellspacing='0' cellpadding='0' border='0'>
                                        <tr>
                                            <td width="165px" class="Title">N� OS:</td>
                                            <td width=""><input type="text" name="numOS" class="Input" onkeypress='return Number(event)'
                                                                maxlength="20" value="<%if(idOS != 0){ out.print(""+idOS);}%>"
                                                                style="width:120px;"></td>
                                        </tr>
                                        <tr>
                                            <td width="" class="Title">Status:</td>
                                            <td width="">
                                                <select name='statusOS' id='statusOS' class='Select' style='width:250px;'>
                                                    <option value='' class='OptionBody1' >-- SELECIONE --</option>
                                                    <option value='ab' class='OptionBody2'<%if (statusF != null && statusF.equals("ab")) {
                out.print("selected");
            }%>>ABERTO</option>
                                                    <option value='an' class='OptionBody1'<%if (statusF != null && statusF.equals("an")) {
                out.print("selected");
            }%>>AN�LISE</option>
                                                    <option value='ag' class='OptionBody2'<%if (statusF != null && statusF.equals("ag")) {
                out.print("selected");
            }%>>AGUARDANDO</option>
                                                    <option value='fc' class='OptionBody1'<%if (statusF != null && statusF.equals("fc")) {
                out.print("selected");
            }%>>FECHADO</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Title">Prioridade:</td>
                                            <td>
                                                <select name='prioridadeOS' id='prioridadeOS' class='Select' style='width:250px;'>
                                                    <option value='' class='OptionBody1' selected>-- SELECIONE --</option>
                                                    <option value='0' class='OptionBody2' <%if(prioridade != null && prioridade.equals("0")){ %> selected="selected"<%} %>>ALTA</option>
                                                    <option value='1' class='OptionBody1' <%if(prioridade != null && prioridade.equals("1")){ %> selected="selected"<%} %>>M�DIA</option>
                                                    <option value='2' class='OptionBody2' <%if(prioridade != null && prioridade.equals("2")){ %> selected="selected"<%} %>>BAIXA</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="" class="Title">Tipo de OS:</td>
                                            <td width="">
                                                <select name='tipoOS' id='tipoOS' class='Select' style='width:250px;'>
                                                    <option value='' class='OptionBody1'>-- SELECIONE --</option>
                                                    <option value='p' class='OptionBody2'<%if (tipoOS != null && tipoOS.equals("p")) {out.print("selected");}%>>Manuten��o Preventiva</option>
                                                    <option value='c' class='OptionBody1'<%if (tipoOS != null && tipoOS.equals("c")) {out.print("selected");}%>>Manuten��o Corretiva</option>
                                                    <option value='a' class='OptionBody2'<%if (tipoOS != null && tipoOS.equals("a")) {out.print("selected");}%>>Aferi��o</option>
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

                for (int i = 0; i < listEquipamentos.size(); i++) {
                    equipamento = (Equipamento) listEquipamentos.get(i);
                    countResult++;
                    String select = "";
                    if (idEquipamento == equipamento.getIdEquipamento()) {
                        select = "selected";
                    }
                    if (countResult % 2 == 0) {
                        optionStyle = "OptionBody2";
                    } else if (countResult % 2 == 1) {
                        optionStyle = "OptionBody1";
                    }

                    out.println("<option value='" + equipamento.getIdEquipamento() + "' class='" + optionStyle + "' " + select + ">");
                    out.println(equipamento.getNomeEquipamento());
                    out.println("</option>");
                }

                out.println("</select>");
            } else {
                out.println("<select name='equipamentoSelect' class='Select' style='width:150px;' disabled='disabled'>");
                out.println("<option>N�o h� usu�rios para editar.</option>");
                out.println("</select>");
            }

                                                %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Title">T�cnico:</td>
                                            <td>
                                                <%

            if (listUsuarios != null) {
                String optionStyle = "OptionBody1";
                int countResult = 0;

                out.println("<select name='tecnico' id='tecnico' class='Select' style='width:250px;'>");
                out.println("<option value='' " + " class='" + optionStyle + "'>-- SELECIONE --</option>");

                countResult++;

                for (int i = 0; i < listUsuarios.size(); i++) {
                    usuario = (Usuario) listUsuarios.get(i);
                    countResult++;
                    String select = "";
                    if (matriculaTecnico != null && matriculaTecnico.equals(usuario.getMatriculaUsuario())) {
                        select = "selected";
                    }
                    if (countResult % 2 == 0) {
                        optionStyle = "OptionBody2";
                    } else if (countResult % 2 == 1) {
                        optionStyle = "OptionBody1";
                    }

                    out.println("<option value='" + usuario.getMatriculaUsuario() + "' class='" + optionStyle + "'" + select + ">");
                    out.println(usuario.getNomeUsuario() + " " + usuario.getSobrenomeUsuario() + " (" + usuario.getUser() + ")");
                    out.println("</option>");
                }

                out.println("</select>");
            } else {
                out.println("<select name='userSelect' class='Select' style='width:150px;' disabled='disabled'>");
                out.println("<option>N�o h� usu�rios para editar.</option>");
                out.println("</select>");
            }

                                                %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Title">Data de Anomalia:</td>
                                            <td>
                                                <%

            out.println("<select name='dt_ano_dia' id='dt_ano_dia' class='Select'>");
            if(dateAnomalia != null && !dateAnomalia.equals("00-00-0000") && !dateAnomalia.equals("")){
            	String diaTemp = null;
            	diaTemp = dateAnomalia.substring(8);
            	out.println("<option value='" + diaTemp + "' selected>" + diaTemp + "</option>");
            }
            for (int dia = 0; dia <= 31; dia++) {
                String selected = "";
				

				                
                if(dia < 10){
                	out.println("<option value='0" + dia + "'" + selected + ">0" + dia + "</option>");
                } else {
                	out.println("<option value='" + dia + "'" + selected + ">" + dia + "</option>");	
                }
            }

            out.println("</select>");

            out.println(" / ");

            out.println("<select name='dt_ano_mes' id='dt_ano_mes' class='Select'>");

			if(dateAnomalia != null && !dateAnomalia.equals("00-00-0000") && !dateAnomalia.equals("")){
				String mesTemp = null;
            	mesTemp = dateAnomalia.substring(5,7);
            	out.println("<option value='" + mesTemp + "' selected>" + mesTemp + "</option>");
            }
            for (int mes = 0; mes <= 12; mes++) {
                String selected = "";
                if(mes < 10){
                	out.println("<option value='0" + mes + "'" + selected + ">0" + mes + "</option>");
                } else{
                	out.println("<option value='" + mes + "'" + selected + ">" + mes + "</option>");
                }
            }

            out.println("</select>");

            out.println(" / ");

            out.println("<select name='dt_ano_ano' id='dt_ano_ano' class='Select'>");            
            out.println("<option value='0000'>0000</option>");
            if(dateAnomalia != null && !dateAnomalia.equals("00-00-0000") && !dateAnomalia.equals("")){
                String anoTemp = null;
            	anoTemp = dateAnomalia.substring(0,4);
            	out.println("<option value='" + anoTemp + "' selected>" + anoTemp + "</option>");
            }
            for (int ano = 2007; ano <= 2012; ano++) {
                String selected = "";

                out.println("<option value='" + ano + "'" + selected + ">" + ano + "</option>");
            }

            out.println("</select>");

            out.println("&nbsp");

                                                %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="Title">Data de Abertura:</td>
                                            <td>
                                                <%

            out.println("<select name='dt_ini_dia' id='dt_ini_dia' class='Select'>");
            if(dataInicial != null && !dataInicial.equals("00-00-0000") && !dataInicial.equals("")){
                String diaTemp = null;
            	diaTemp = dataInicial.substring(8);
            	out.println("<option value='" + diaTemp + "' selected>" + diaTemp + "</option>");
            }
            for (int dia = 0; dia <= 31; dia++) {
                String selected = "";
                if(dia < 10){
                	out.println("<option value='0" + dia + "'" + selected + ">0" + dia + "</option>");
                } else {
                	out.println("<option value='" + dia + "'" + selected + ">" + dia + "</option>");	
                }

            }

            out.println("</select>");

            out.println(" / ");

            out.println("<select name='dt_ini_mes' id='dt_ini_mes' class='Select'>");
			
			if(dataInicial != null && !dataInicial.equals("00-00-0000") && !dataInicial.equals("")){
				String mesTemp = null;
            	mesTemp = dataInicial.substring(5,7);
            	out.println("<option value='" + mesTemp + "' selected>" + mesTemp + "</option>");
            }
            for (int mes = 0; mes <= 12; mes++) {
                String selected = "";
                


                if(mes < 10){
                	out.println("<option value='0" + mes + "'" + selected + ">0" + mes + "</option>");
                } else{
                	out.println("<option value='" + mes + "'" + selected + ">" + mes + "</option>");
                }
            }

            out.println("</select>");

            out.println(" / ");

            out.println("<select name='dt_ini_ano' id='dt_ini_ano' class='Select'>");
            out.println("<option value='0000'>0000</option>");
            
            if(dataInicial != null && !dataInicial.equals("00-00-0000") && !dataInicial.equals("")){
            	String anoTemp = null;
            	anoTemp = dataInicial.substring(0,4);
            	out.println("<option value='" + anoTemp + "' selected>" + anoTemp + "</option>");
            }
            for (int ano = 2007; ano <= 2012; ano++) {
                String selected = "";
  

                out.println("<option value='" + ano + "'" + selected + ">" + ano + "</option>");
            }

            out.println("</select>");

            out.println("&nbsp");

                                                %>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td class="Title">Data de Servi�o:</td>
                                            <td>
                                                <%

            out.println("<select name='dt_serv_dia' id='dt_serv_dia' class='Select'>");
			
            if(dateServico != null && !dateServico.equals("00-00-0000") && !dateServico.equals("")){
            	String diaTemp = null;
            	diaTemp = dateServico.substring(8);
            	out.println("<option value='" + diaTemp + "' selected>" + diaTemp + "</option>");
            }			
            for (int dia = 0; dia <= 31; dia++) {
                String selected = "";

                if(dia < 10){
                	out.println("<option value='0" + dia + "'" + selected + ">0" + dia + "</option>");
                } else {
                	out.println("<option value='" + dia + "'" + selected + ">" + dia + "</option>");	
                }
            }

            out.println("</select>");

            out.println(" / ");

            out.println("<select name='dt_serv_mes' id='dt_serv_mes' class='Select'>");
            if(dateServico != null && !dateServico.equals("00-00-0000") && !dateServico.equals("")){
            	String mesTemp = null;
            	mesTemp = dateServico.substring(5,7);
            	out.println("<option value='" + mesTemp + "' selected>" + mesTemp + "</option>");
            }
            for (int mes = 0; mes <= 12; mes++) {
                String selected = "";


                if(mes < 10){
                	out.println("<option value='0" + mes + "'" + selected + ">0" + mes + "</option>");
                } else{
                	out.println("<option value='" + mes + "'" + selected + ">" + mes + "</option>");
                }
            }

            out.println("</select>");

            out.println(" / ");

            out.println("<select name='dt_serv_ano' id='dt_serv_ano' class='Select'>");
            out.println("<option value='0000'>0000</option>");
            
            if(dateServico != null && !dateServico.equals("00-00-0000") && !dateServico.equals("")){
            	String anoTemp = null;
            	anoTemp = dateServico.substring(0,4);
            	out.println("<option value='" + anoTemp + "' selected>" + anoTemp + "</option>");
            }
            for (int ano = 2007; ano <= 2012; ano++) {
                String selected = "";


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
			
            if(dataFinal != null && !dataFinal.equals("00-00-0000") && !dataFinal.equals("")){
            	String diaTemp = null;
            	diaTemp = dataFinal.substring(8);
            	out.println("<option value='" + diaTemp + "' selected>" + diaTemp + "</option>");
            }
            for (int dia = 0; dia <= 31; dia++) {
                String selected = "";


                if(dia < 10){
                	out.println("<option value='0" + dia + "'" + selected + ">0" + dia + "</option>");
                } else {
                	out.println("<option value='" + dia + "'" + selected + ">" + dia + "</option>");	
                }
            }

            out.println("</select>");

            out.println(" / ");

            out.println("<select name='dt_fim_mes' id='dt_fim_mes' class='Select'>");
			if(dataFinal != null && !dataFinal.equals("00-00-0000") && !dataFinal.equals("")){
				String mesTemp = null;
				mesTemp = dataFinal.substring(5,7);
            	out.println("<option value='" + mesTemp + "' selected>" + mesTemp + "</option>");
            }
            for (int mes = 0; mes <= 12; mes++) {
                String selected = "";
                if(mes < 10){
                	out.println("<option value=0'" + mes + "'" + selected + ">0" + mes + "</option>");
                } else{
                	out.println("<option value='" + mes + "'" + selected + ">" + mes + "</option>");
                }
            }

            out.println("</select>");

            out.println(" / ");

            out.println("<select name='dt_fim_ano' id='dt_fim_ano' class='Select'>");
            out.println("<option value='0000'>0000</option>");
            if(dataFinal != null && !dataFinal.equals("00-00-0000") && !dataFinal.equals("")){
            	String anoTemp = null;
            	anoTemp = dataFinal.substring(0,4);
            	out.println("<option value='" + anoTemp + "' selected>" + anoTemp + "</option>");
            }
            
            for (int ano = 2007; ano <= 2012; ano++) {
                String selected = "";
                
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
                                            <td colspan="2" align="center">
                                                <input type="button" value="Limpar Filtro" id="Limpar Filtro" class="Button" onClick="location.href='osList.jsp?LFOS=a'" onMouseOut="buttonOn(this)" onMouseOver="buttonOver(this)" style="width: 100px;">&nbsp;&nbsp;&nbsp;
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
                                    <table width='' cellspacing='0' cellpadding='0' border='0' style='border: 1px solid #000000;'>
                                        <tr>
                                            <td width='20' height='18' class='TableResultTitle' style='border-bottom: 1px solid #000000;'>&nbsp</td>
                                            <td width='80' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=id&page=1" class="LinkTitle">N&deg;.</a></td>
                                            <td width='80' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=equipamento&page=1" class="LinkTitle">Equip.</a></td>
                                            <td width='159' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=autor&page=1" class="LinkTitle">Solicitante:</a></td>
                                            <td width='160' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=tecnico&page=1" class="LinkTitle">T�cnico:</a></td>
                                            <td width='160' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=data_anomalia&page=1" class="LinkTitle">Data Anomalia</a></td>
                                            <td width='160' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=data_abertura&page=1" class="LinkTitle">Data Abertura</a></td>
                                            <td width='160' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=data_servico&page=1" class="LinkTitle">Data Servico</a></td>
                                            <td width='160' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=data_fechamento&page=1" class="LinkTitle">Data Fechamento</a></td>
                                            <td width='90' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=status&page=1" class="LinkTitle">Status</a></td>
                                            <td width='90' class='TableResultTitle' style='border-bottom: 1px solid #000000;'><a href="?orderBy=prioridade&page=1" class="LinkTitle">Prioridade</a></td>
                                        </tr>
                                        <%

            if (list != null) {
                String tableStyle = "TableResultBody1";
                String status = "";
                int countResult = 0;

                for (int i = 0; i < list.size(); i++) {
                    os = (OS) list.get(i);
                    checkEquipamento = os.getCheckEquipamento();
                    equipamento = os.getEquipamento();
                    usuarioAutor = os.getUsuarioAutor();
                    usuarioDest = os.getUsuarioDest();
                    status = os.getStatus();

                    long dataVerifyAbertura = os.getDataAbertura().getTime();

                    String statusFechamento = "";
                    String statusStyle = "";
                    String prioridadeOSStyle = "";
                    String prioridadeOS = "";

                    countResult++;

                    if (countResult % 2 == 0) {
                        tableStyle = "TableResultBody2";
                    } else if (countResult % 2 == 1) {
                        tableStyle = "TableResultBody1";
                    }

                    if (status.equals("ab") && dataVerifyAbertura < dataVerifyStatus) {
                        statusFechamento = "ABERTO";
                        statusStyle = "OSWarning";
                    } else if (status.equals("ab")) {
                        statusFechamento = "ABERTO";
                        statusStyle = "OSOpen";
                    } else if (status.equals("an")) {
                        statusFechamento = "AN�LISE";
                        statusStyle = "OSWorking";
                    } else if (status.equals("fc")) {
                        statusFechamento = "FECHADO";
                        statusStyle = "OSClose";
                    } else if (status.equals("ag")) {
                        statusFechamento = "AGUARDANDO";
                        statusStyle = "OSStandby";
                    }

                    /*if (os.getDataFechamento() == null && dataVerifyAbertura < dataVerifyStatus) {
                    statusFechamento = "ABERTO";
                    statusStyle = "OSWarning";
                    } else if (os.getDataFechamento() == null) {
                    statusFechamento = "ABERTO";
                    statusStyle = "OSOpen";
                    } else {
                    statusFechamento = "FECHADO";
                    statusStyle = "OSClose";
                    }*/

                                        %>

                                        <tr>
                                            <td height='16' class='<%= tableStyle%>' align="right"><img src="imagens/topico.gif" height="15" width="15" alt=""></td>
                                            <td class='<%= tableStyle%>'><a href="osView.jsp?id=<%= os.getId()%>"><%= os.getId() + os.getTipoOS().toUpperCase()%></a></td>
                                            <td class='<%= tableStyle%>'><a href="osView.jsp?id=<%= os.getId()%>"><%= equipamento.getNomeEquipamento()%></a></td>
                                            <td class='<%= tableStyle%>'><a href="osView.jsp?id=<%= os.getId()%>"><%= usuarioAutor.getNomeUsuario() + " " + usuarioAutor.getSobrenomeUsuario()%></a></td>
                                            <td class='<%= tableStyle%>'><a href="osView.jsp?id=<%= os.getId()%>"><%= usuarioDest.getNomeUsuario() + " " + usuarioDest.getSobrenomeUsuario()%></a></td>
                                            <td class='<%= tableStyle%>'><a href="osView.jsp?id=<%= os.getId()%>">
                                                    <%
                                                        if (os.getDataAnomalia() == null) {
                                                            out.println("00:00:00 00/00/0000");
                                                            } else {
                                                                out.println(dateFormat.format(os.getDataAnomalia()));
                                                            }
                                                    %></a></td>
                                            <td class='<%= tableStyle%>'><a href="osView.jsp?id=<%= os.getId()%>"><%= dateFormat.format(os.getDataAbertura())%></a></td>
                                            <td class='<%= tableStyle%>'><a href="osView.jsp?id=<%= os.getId()%>">
                                                    <%
                    if (os.getDataServico() == null) {
                        out.println("00:00:00 00/00/0000");
                    } else {
                        out.println(dateFormat.format(os.getDataServico()));
                    }
                                                    %>
                                                </a>

                                            </td>
                                            <td class='<%= tableStyle%>'><a href="osView.jsp?id=<%= os.getId()%>">
                                                    <%
                    if (os.getDataFechamento() == null) {
                        out.println("00:00:00 00/00/0000");
                    } else {
                        out.println(dateFormat.format(os.getDataFechamento()));
                    }
                                                    %>
                                                </a></td>
                                            <td class='<%= tableStyle%>'><a href="osView.jsp?id=<%= os.getId()%>"><span class="<%= statusStyle%>"><%= statusFechamento%></span></a></td>
                                            <%

                    if (os.getPrioridade() == 0) {
                        prioridadeOS = "Alta";
                        prioridadeOSStyle = "OSPrioridadeAlta";
                    } else if (os.getPrioridade() == 1) {
                        prioridadeOS = "M�dia";
                        prioridadeOSStyle = "OSPrioridadeMedia";
                    } else if (os.getPrioridade() == 2) {
                        prioridadeOS = "Baixa";
                        prioridadeOSStyle = "OSPrioridadeBaixa";
                    }
                                            %>
                                            <td class='<%= tableStyle%>' ><a href="osView.jsp?id=<%= os.getId()%>"><span class="<%= prioridadeOSStyle%>"><%= prioridadeOS%></span></a></td>
                                        </tr>

                                        <%
                }
            }

                                        %>

                                        <tr>
                                            <td colspan="8" height="5"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" align="center"><%= pageViewNavigator%></td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" height="5"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
                <td width="10"></td>
            </tr>
        </table>
        <table align="center">
            <tr>
                <td colspan="3" height="20">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" align="center" class="Footer">
                    <!-- include do rodap� -->
                    <jsp:include page="includes/footer.jsp" />
                    <!-- fim do include do rodap� -->
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