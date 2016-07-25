<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%--@page contentType="text/html" pageEncoding="UTF-8"--%>

<%@ page import="br.com.consorciosdf.intranet.controle.ManterOSControl" %>
<%@ page import="br.com.consorciosdf.intranet.controle.ManterUserControl" %>
<%@ page import="br.com.consorciosdf.intranet.modelo.*" %>

<%@page import="br.com.consorciosdf.intranet.util.DataUtil" %>

<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<jsp:useBean id="os" class="br.com.consorciosdf.intranet.modelo.OS" scope="request"/>
<jsp:useBean id="checkEquipamento" class="br.com.consorciosdf.intranet.modelo.CheckEquipamento" scope="request"/>
<jsp:useBean id="equipamento" class="br.com.consorciosdf.intranet.modelo.Equipamento" scope="request"/>
<jsp:useBean id="usuarioAutor" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request"/>
<jsp:useBean id="usuarioDest" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request"/>
<jsp:useBean id="usuarioAtual" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request"/>

<%
            ManterUserControl manterUserControl = new ManterUserControl();
            int userPerfil = 0;

            if ((session.getAttribute("userPerfil")) != null) {
                userPerfil = Integer.parseInt((String) session.getAttribute("userPerfil"));
            }

            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");
            DataUtil data = new DataUtil();

            String userMatricula = "";
            String menuHorizontal = "";
            String sucessAdd = "";
            String sucessAddClass = "Error";
            String msgSucess = "";

            usuarioAtual.setUser((String) session.getAttribute("user"));
            usuarioAtual.setMatriculaUsuario((String) session.getAttribute("userMatricula"));

            usuarioAtual = manterUserControl.viewUser(usuarioAtual);
            if ((session.getAttribute("userMatricula")) != null) {
                userMatricula = (String) session.getAttribute("userMatricula");
            }


            if ((request.getParameter("id")) != null) {
                int id = Integer.parseInt(request.getParameter("id"));

                ManterOSControl manterOSControl = new ManterOSControl();
                os = manterOSControl.recuperarOS(id);
            }

            if ((request.getParameter("accept")) != null) {
                if (request.getParameter("accept").equals("1")) {
                    sucessAdd = "Houve um problema na transa��o. N�o foi poss�vel assumir a OS.";
                } else if (request.getParameter("accept").equals("2")) {
                    sucessAdd = "Ordem de Servi�o assumida com sucesso.";
                    sucessAddClass = "Sucess";
                }

                msgSucess = ""
                        + "<tr>"
                        + "<td height='20' align='center' class='" + sucessAddClass + "'>" + sucessAdd + "</td>"
                        + "</tr>"
                        + "<tr>"
                        + "<td height='10'></td>"
                        + "</tr>";
            }

            if ((request.getParameter("sucess")) != null) {
                if (request.getParameter("sucess").equals("1")) {
                    sucessAdd = "Favor digitar os campos corretamente.";
                } else if (request.getParameter("sucess").equals("2")) {
                    sucessAdd = "Houve um problema na transa��o.";
                } else if (request.getParameter("sucess").equals("3")) {
                    sucessAdd = "Ordem de Servi�o fechada com sucesso.";
                    sucessAddClass = "Sucess";
                } else if (request.getParameter("sucess").equals("4")) {
                    sucessAdd = "Ordem de Servi�o alterada com sucesso.";
                    sucessAddClass = "Sucess";
                } else if (request.getParameter("sucess").equals("5")) {
                    sucessAdd = "Observa��o inclu�da com sucesso.";
                    sucessAddClass = "Sucess";
                } else if (request.getParameter("sucess").equals("6")) {
                    sucessAdd = "Servi�o inclu�do com sucesso.";
                    sucessAddClass = "Sucess";
                } else if (request.getParameter("sucess").equals("7")) {
                    sucessAdd = "Material inclu�do com sucesso.";
                    sucessAddClass = "Sucess";
                } else if (request.getParameter("sucess").equals("8")) {
                    sucessAdd = "Aten��o, a OS j� est� fechada!";
                }

                msgSucess = ""
                        + "<tr>"
                        + "<td height='20' align='center' class='" + sucessAddClass + "'>" + sucessAdd + "</td>"
                        + "</tr>"
                        + "<tr>"
                        + "<td height='10'></td>"
                        + "</tr>";
            }

%>

<!-- include de verifica��o do usu�rio -->
<%@ include file="includes/sessionVerify.jsp"%>
<!-- fim do include verifica��o do usu�rio -->

<html>
    <head>
        <title>INTRANET CONSORCIO SDF</title>
        <link rel="stylesheet" type="text/css" href="estilos/default.css" />

        <script language="javascript" type="text/javascript" src="scripts/default.js">
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- include do menu -->
        <%--<jsp:include page="includes/menu.jsp" />--%>
        <!-- fim do include do menu -->

    </head>

    <body>
        <!-- include do cabe�alho -->
        <jsp:include page="includes/header.jsp" />
        <!-- fim do include do cabe�alho -->

        <table align="left" width="779" border="0" cellspacing="0" cellpadding="0">

            <tr>
                <td width="13">&nbsp;</td>
                <td width="" height="180" colspan="2" valign="top">

                    <%
                                int idOs = 0;

                                String userAutor = "";
                                String userDest = "";
                                String nomeEquipamento = "";
                                String endEquipamento = "";
                                String numSerie = "";
                                String numUPR = "";
                                String numCamera = "";
                                String numFlash = "";
                                String descDefeito = "";
                                String descObservacao = "";
                                String descReparo = "";
                                String descServExec = "";
                                String descFechamento = "";
                                String dataAnomalia = "";
                                String dataAbertura = "";
                                String dataServico = "";
                                String dataFechamento = "";
                                String difAnomaliaAbertura = "";
                                String difAberturaServico = "";
                                String difServicoFechamento = "";
                                String difAnomaliaFechamento = "";
                                String status = "";
                                String statusFechamento = "";
                                String statusStyle = "";
                                String prioridadeOS = "";
                                String prioridadeOSStyle = "";

                                String styleButtonEnabled = "class='Button'";
                                String styleButtonDisabled = "class='ButtonDisabled' disabled='disabled'";

                                String buttonAccept = styleButtonEnabled;
                                String buttonEdit = styleButtonEnabled;
                                String buttonClose = styleButtonEnabled;

                                if (os != null) {
                                    checkEquipamento = os.getCheckEquipamento();
                                    equipamento = os.getEquipamento();
                                    usuarioAutor = os.getUsuarioAutor();
                                    usuarioDest = os.getUsuarioDest();

                                    idOs = os.getId();
                                    userAutor = usuarioAutor.getNomeUsuario() + " "
                                            + usuarioAutor.getSobrenomeUsuario();
                                    nomeEquipamento = equipamento.getNomeEquipamento();
                                    endEquipamento = equipamento.getEnderecoLogradouroEquipamento();


                                    dataAbertura = dateFormat.format(os.getDataAbertura());

                                    if (os.getDataAnomalia() != null) {
                                        dataAnomalia = dateFormat.format(os.getDataAnomalia());
                                        difAnomaliaAbertura = data.diferecaData(os.getDataAnomalia(), os.getDataAbertura());
                                    }

                                    /*
                                     * Montando o menu horizontal
                                     */
                                    menuHorizontal = "<a href='osList.jsp'><img src='imagens/stock_navigator-back-16.gif' border='0' alt='Voltar'></a> "+
                                    "  <a href='osList.jsp'><img src='imagens/home16.gif' border='0' alt='Tela Inicial'></a>  ";
				

                                    if (usuarioDest.getMatriculaUsuario() == null) {
                                        menuHorizontal += "<a href='#' onClick=\"location.href='osAccept.jsp?id=" + idOs
                                                + "'\"><img src='imagens/stock_format-page-16.gif' border='0' alt='Assumir OS'></a> ";
                                    }
                                    for (int j = 0; j < usuarioAtual.getUsuarioRules().size(); j++) {

                                        if (usuarioAtual.getUsuarioRules().get(j).getNome().equals("os_defeito")) {
                                            menuHorizontal += "<a href='#' onClick=\"location.href='osAddDefeito.jsp?id=" + idOs
                                                    + "'\"><img src='imagens/png/stock_insert-note-16.png' border='0' alt='Incluir Defeito Identificado'></a> ";
                                        }
                                        if (usuarioAtual.getUsuarioRules().get(j).getNome().equals("os_obs")) {
                                            menuHorizontal += "<a href='#' onClick=\"location.href='osAddObs.jsp?id=" + idOs
                                                    + "'\"><img src='imagens/stock_new-text-16.gif' border='0' alt='Incluir Observa��o'></a> ";
                                        }

                                        if (usuarioAtual.getUsuarioRules().get(j).getNome().equals("os_material")) {
                                            menuHorizontal += "<a href='#' onClick=\"location.href='osAddMatUtil.jsp?id=" + idOs
                                                    + "'\"><img src='imagens/stock_gear-16.gif' border='0' alt='Incluir Material Utilizado'></a> ";
                                        }

                                        if (usuarioAtual.getUsuarioRules().get(j).getNome().equals("os_servico")) {
                                            menuHorizontal += "<a href='#' onClick=\"location.href='osAddServ.jsp?id=" + idOs
                                                    + "'\"><img src='imagens/stock_tools-16.gif' border='0' alt='Incluir Servi�o Executado'></a> ";
                                        }

                                        if (usuarioAtual.getUsuarioRules().get(j).getNome().equals("os_alterar")) {
                                            menuHorizontal += "<a href='#' onClick=\"location.href='osEdit.jsp?id=" + idOs
                                                    + "'\"><img src='imagens/stock_edit-16.gif' border='0' alt='Alterar OS'></a> ";
                                        }

                                        if (usuarioAtual.getUsuarioRules().get(j).getNome().equals("os_fechamento")) {
                                            if (!os.getStatus().equals("fc")) {
                                                menuHorizontal += "<a href='#' onClick=\"location.href='osClose.jsp?id=" + idOs
                                                        + "'\"><img src='imagens/stock_copy-16.gif' border='0' alt='Fechar OS'></a> ";
                                            }
                                        }
                                    }

                                    menuHorizontal += "<a href='#' onClick='window.location.reload()'><img src='imagens/stock_refresh-16.gif' border='0' alt='Atualizar'></a> "
                                            + "<a href='#' onClick=\"openWindow('osPrint.jsp?id=" + idOs
                                            + "', 'osPrint', 800, 600)\"><img src='imagens/stock_print-16.gif' border='0' alt='Imprimir'></a>";


                                    if (usuarioDest.getNomeUsuario() != null) {
                                        userDest = usuarioDest.getNomeUsuario() + " " + usuarioDest.getSobrenomeUsuario();
                                        buttonAccept = styleButtonDisabled;

                                        if (!usuarioDest.getMatriculaUsuario().equals(userMatricula)) {
                                            buttonClose = styleButtonDisabled;
                                        }
                                    } else {
                                        buttonClose = styleButtonDisabled;
                                    }

                                    if (equipamento.getNumSerie() != 0) {
                                        numSerie = String.valueOf(equipamento.getNumSerie());
                                    }

                                    if (equipamento.getNumUPR() != 0) {
                                        numUPR = String.valueOf(equipamento.getNumUPR());
                                    }

                                    if (equipamento.getNumCamera() != 0) {
                                        numCamera = String.valueOf(equipamento.getNumCamera());
                                    }

                                    if (equipamento.getNumFlash() != null) {
                                        numFlash = equipamento.getNumFlash();
                                    }

                                    //quebra galho
                                    buttonClose = styleButtonEnabled;

                                    if (userPerfil > 2) {
                                        buttonEdit = styleButtonDisabled;
                                    }

                                    if (os.getDescDefeito() != null) {
                                        descDefeito = os.getDescDefeito();
                                    }

                                    if (os.getDescObservacao() != null) {
                                        descObservacao = os.getDescObservacao();
                                    }

                                    if (os.getDescReparo() != null) {
                                        descReparo = os.getDescReparo();
                                    }

                                    if (os.getDescServicoExecutado() != null) {
                                        descServExec = os.getDescServicoExecutado();
                                    }
                                    if (os.getDescFechamento() != null) {
                                        descFechamento = os.getDescFechamento();
                                    }

                                    if (os.getStatus() != null) {
                                        status = os.getStatus();

                                        if (status.equals("ab")) {
                                            statusFechamento = "ABERTO";
                                            statusStyle = "OSOpen";
                                        } else if (status.equals("an")) {
                                            statusFechamento = "AN�LISE";
                                            statusStyle = "OSWorking";
                                        } else if (status.equals("ag")) {
                                            statusFechamento = "AGUARDANDO";
                                            statusStyle = "OSStandby";
                                        } else if (status.equals("fc")) {
                                            statusFechamento = "FECHADO";
                                            statusStyle = "OSClose";
                                            buttonEdit = styleButtonDisabled;
                                            buttonClose = styleButtonDisabled;
                                        }
                                    }

                                    if (os.getPrioridade() >= 0) {
                                        prioridadeOS = "";
                                        if (os.getPrioridade() == 0) {
                                            prioridadeOS = "Alta";
                                            prioridadeOSStyle = "OsPrioridadeAlta";
                                        } else if (os.getPrioridade() == 1) {
                                            prioridadeOS = "M�dia";
                                            prioridadeOSStyle = "OsPrioridadeMedia";
                                        } else if (os.getPrioridade() == 2) {
                                            prioridadeOS = "Baixa";
                                            prioridadeOSStyle = "OsPrioridadeBaixa";
                                        }

                                    }

                                    if (os.getDataFechamento() != null) {
                                        dataFechamento = dateFormat.format(os.getDataFechamento());
                                        difServicoFechamento = data.diferecaData(os.getDataServico(), os.getDataFechamento());
                                        difAnomaliaFechamento = data.diferecaData(os.getDataAnomalia(), os.getDataFechamento());

                                    }
                                    if (os.getDataServico() != null) {
                                        dataServico = dateFormat.format(os.getDataServico());
                                        difAberturaServico = data.diferecaData(os.getDataAbertura(), os.getDataServico());
                                    }

                                    /*
                                    if (os.getDataAbertura() != null && os.getDataServico() != null) {
                                    long difAberturaServicoTemp = os.getDataServico().getTime() - os.getDataAbertura().getTime();
                                    Date difAberturaServico = new Date(difAberturaServicoTemp);
                                    strDifAberturaServico = dateFormatDif.format(difAberturaServico);
                                    }
                                    if (os.getDataAnomalia() != null && os.getDataAbertura() != null) {
                                    long difServicoFechamentoTemp = os.getDataFechamento().getTime() - os.getDataServico().getTime();
                                    Date difServicoFechamento = new Date(difServicoFechamentoTemp);
                                    strDifServicoFechamento = dateFormatDif.format(difServicoFechamento);
                                    }
                                    if (os.getDataAnomalia() != null && os.getDataAbertura() != null) {
                                    long difAnomaliaFechamentoTemp = os.getDataFechamento().getTime() - os.getDataAnomalia().getTime();
                                    Date difAnomaliaFechamento = new Date(difAnomaliaFechamentoTemp);
                                    strDifAnomaliaAbertura = dateFormatDif.format(difAnomaliaFechamento);
                                    }*/





                                    /*if (os.getDataFechamento() == null) {
                                    statusFechamento = "ABERTO";
                                    statusStyle = "OSOpen";
                                    } else {
                                    dataFechamento = dateFormat.format(os.getDataFechamento());
                                    statusFechamento = "FECHADO";
                                    statusStyle = "OSClose";

                                    buttonEdit = styleButtonDisabled;
                                    buttonClose = styleButtonDisabled;
                                    }*/
                                }
                    %>

                    <table width="549" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="Title">
                                <table width='549' cellspacing='0' cellpadding='0' border='0'>
                                    <tr>
                                        <td class="Title" width="">Ordem de Servi�o - Visualizar</td>
                                        <td width="" align="right">
                                            <%= menuHorizontal%>
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
                        <!--tr>
                            <td height="20" align="center">
                                <input type="button" value="Assumir OS" id="Assumir OS" <%--= buttonAccept --%> onMouseOut="buttonOn(this)" onMouseOver="buttonOver(this)" onClick="location.href='osAccept.jsp?id=<%= idOs%>'" style="width: 100px;">&nbsp;&nbsp;
                                <input type="button" value="Alterar OS" id="Alterar OS" <%--= styleButtonDisabled --%> onMouseOut="buttonOn(this)" onMouseOver="buttonOver(this)" onClick="location.href='osEdit.jsp?id=<%= idOs%>'" style="width: 100px;">&nbsp;&nbsp;
                                <input type="button" value="Fechar OS" id="Fechar OS" <%--= buttonClose --%> onMouseOut="buttonOn(this)" onMouseOver="buttonOver(this)" onClick="location.href='osClose.jsp?id=<%= idOs%>'" style="width: 100px;">&nbsp;&nbsp;
                                <input type="button" value="Imprimir OS" id="Imprimir OS" class="Button" onClick="openWindow('osPrint.jsp?id=<%--= idOs --%>', 'osPrint', 700, 500)" onMouseOut="buttonOn(this)" onMouseOver="buttonOver(this)" style="width: 100px;">
                            </td>
                        </tr>
                        <tr>
                            <td height="10"></td>
                        </tr-->
                        <%= msgSucess%>
                        <tr>
                            <td>
                                <table width="549" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
                                    <tr>
                                        <td height="20" class="TableResultTitle" style='border-bottom: 1px solid #000000;'>&nbsp;</td>
                                        <td colspan="3" class="TableResultTitle" style='border-bottom: 1px solid #000000;'>Dados da OS:</td>
                                    </tr>
                                    <tr class="TableResultBody1">
                                        <td height="18" width="10">&nbsp;</td>
                                        <td class="Title" width="140">N&deg; de OS:</td>
                                        <td width="10">&nbsp;</td>
                                        <td>
                                            <table width="380" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width=""><%= idOs + os.getTipoOS().toUpperCase()%></td>
                                                    <td class="Title" width="" align="right">Status:</td>
                                                    <td class="<%= statusStyle%>" align="center"> <%= statusFechamento%></td>
                                                    <td class="Title" width="" align="right">Prioridade:</td>
                                                    <td class="<%=prioridadeOSStyle%>" align="center"> <%=prioridadeOS%></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="TableResultBody2">
                                        <td height="18">&nbsp;</td>
                                        <td class="Title">Solicitante:</td>
                                        <td>&nbsp;</td>
                                        <td><%= userAutor%></td>
                                    </tr>
                                    <tr class="TableResultBody1">
                                        <td height="18">&nbsp;</td>
                                        <td class="Title">T�cnico:</td>
                                        <td>&nbsp;</td>
                                        <td><%= userDest%></td>
                                    </tr>
                                    <tr class="TableResultBody2">
                                        <td height="18">&nbsp;</td>
                                        <td class="Title">Equipamento:</td>
                                        <td>&nbsp;</td>
                                        <td><%= nomeEquipamento + " (" + endEquipamento + ")"%></td>
                                    </tr>
                                    <tr class="TableResultBody1">
                                        <td height="18" width="10">&nbsp;</td>
                                        <td class="Title" width="140">N&deg; de S�rie:</td>
                                        <td width="10">&nbsp;</td>
                                        <td>
                                            <table width="380" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="100"><%= numSerie%></td>
                                                    <td width="10"></td>
                                                    <td class="Title" width="110"><!--N&deg; de HD:--></td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="TableResultBody2">
                                        <td height="18" width="10">&nbsp;</td>
                                        <td class="Title" width="140">N&deg; de Embarcada:</td>
                                        <td width="10">&nbsp;</td>
                                        <td>
                                            <table width="380" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="100"><%= numUPR%></td>
                                                    <td width="10"></td>
                                                    <td class="Title" width="110"><!--N&deg; de Fonte:--></td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="TableResultBody1">
                                        <td height="18" width="10">&nbsp;</td>
                                        <td class="Title" width="140">N&deg; de C�mera:</td>
                                        <td width="10">&nbsp;</td>
                                        <td>
                                            <table width="380" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="100"><%= numCamera%></td>
                                                    <td width="10"></td>
                                                    <td class="Title" width="110"><!--Outros N&deg;s (1):--></td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="TableResultBody2">
                                        <td height="18" width="10">&nbsp;</td>
                                        <td class="Title" width="140">N&deg; de Flash:</td>
                                        <td width="10">&nbsp;</td>
                                        <td>
                                            <table width="380" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="100"><%= numFlash%></td>
                                                    <td width="10"></td>
                                                    <td class="Title" width="110"><!--Outros N&deg;s (2):--></td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr class="TableResultBody1">
                                        <td height="18"></td>
                                        <td class="Title">
                                            Data Anomalia:
                                        </td>
                                        <td></td>
                                        <td>
                                            <%=dataAnomalia%>
                                        </td>
                                    </tr>
                                    <tr class="TableResultBody2">
                                        <td height="18"></td>
                                        <td class="Title">
                                            Data Abertura:
                                        </td>
                                        <td></td>
                                        <td>
                                            <%=dataAbertura%>

                                        </td>
                                    </tr>
                                    <tr class="TableResultBody1">
                                        <td height="18"></td>
                                        <td class="Title">Data do Servi�o:</td>
                                        <td></td>
                                        <td><%if (!dataServico.equals("")) {
                                                        out.print(dataServico);
                                                    }%>

                                        </td>
                                    </tr>
                                    <tr class="TableResultBody2">
                                        <td height="18"></td>
                                        <td class="Title">Data de Fechamento:</td>
                                        <td></td>
                                        <td><%= dataFechamento%></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="10"></td>
                        </tr>
                        <tr>
                            <td>
                                <table width="549" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
                                    <tr>
                                        <td colspan="3">
                                            <table border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                                                <tr>
                                                    <td height="20" class="TableResultTitle" style='border-bottom: 1px solid #000000;'>&nbsp;</td>
                                                    <td colspan="2" class="TableResultTitle" style='border-bottom: 1px solid #000000;'>Tempo da OS:</td>
                                                </tr>
                                                <tr class="TableResultBody1">
                                                    <td height="18" width="11"></td>
                                                    <td class="Title" width="175px">
                                                        Anomalia x Abertura:
                                                    </td>
                                                    <td width="361">
                                                        <%=difAnomaliaAbertura%>
                                                    </td>
                                                </tr>
                                                <tr class="TableResultBody2">
                                                    <td height="18"></td>
                                                    <td class="Title">
                                                        Abertura x Servi�o:
                                                    </td>

                                                    <td>
                                                        <%=difAberturaServico%>

                                                    </td>
                                                </tr>
                                                <tr class="TableResultBody1">
                                                    <td height="18"></td>
                                                    <td class="Title">Servi�o x Fechamento:</td>

                                                    <td><%= difServicoFechamento%></td>
                                                </tr>
                                                <tr class="TableResultBody2">
                                                    <td height="18"></td>
                                                    <td class="Title" width="175">Anomalia x Fechamento:</td>

                                                    <td><%= difAnomaliaFechamento%></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td height="10"></td>
                        </tr>
                        <tr>
                            <td>
                                <table width="549" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
                                    <tr>
                                        <td width="10" height="20" class='TableResultTitle' style='border-bottom: 1px solid #000000;'>&nbsp;</td>
                                        <td class='TableResultTitle' style='border-bottom: 1px solid #000000;'>Defeito:</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <%= descDefeito%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="10"></td>
                        </tr>
                        <tr>
                            <td>
                                <table width="549" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
                                    <tr>
                                        <td width="10" height="20" class='TableResultTitle' style='border-bottom: 1px solid #000000;'>&nbsp;</td>
                                        <td class='TableResultTitle' style='border-bottom: 1px solid #000000;'>Observa��es:</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <%= descObservacao%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="10"></td>
                        </tr>
                        <tr>
                            <td>
                                <table width="549" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
                                    <tr>
                                        <td width="10" height="20" class='TableResultTitle' style='border-bottom: 1px solid #000000;'>&nbsp;</td>
                                        <td class='TableResultTitle' style='border-bottom: 1px solid #000000;'>Materiais Utilizados:</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <%= descReparo%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="10"></td>
                        </tr>
                        <tr>
                            <td>
                                <table width="549" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
                                    <tr>
                                        <td width="10" height="20" class='TableResultTitle' style='border-bottom: 1px solid #000000;'>&nbsp;</td>
                                        <td class='TableResultTitle' style='border-bottom: 1px solid #000000;'>Servi�os Executados:</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <%= descServExec%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td height="10"></td>
                        </tr>
                        <tr>
                            <td>
                                <table width="549" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
                                    <tr>
                                        <td width="10" height="20" class='TableResultTitle' style='border-bottom: 1px solid #000000;'>&nbsp;</td>
                                        <td class='TableResultTitle' style='border-bottom: 1px solid #000000;'>Fechamento:</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <%= descFechamento%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" height="10"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="10"></td>
            </tr>
            <tr>
                <td colspan="3" height="20">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3" class="Footer">
                    <table>
                        <tr>
                            <td align="center" width="535">
                                    <!-- include do rodap� -->
                                    <jsp:include page="includes/footer.jsp" />
                                    <!-- fim do include do rodap� -->
                            </td>
                        </tr>
                    </table>
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