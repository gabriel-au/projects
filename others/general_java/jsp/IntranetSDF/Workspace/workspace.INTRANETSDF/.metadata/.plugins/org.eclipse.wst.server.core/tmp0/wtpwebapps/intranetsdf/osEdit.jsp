<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%--@page contentType="text/html" pageEncoding="UTF-8"--%>

<%@ page import="br.com.consorciosdf.intranet.controle.ManterOSControl" %>
<%@ page import="br.com.consorciosdf.intranet.controle.ManterUserControl" %>
<%@ page import="br.com.consorciosdf.intranet.modelo.*" %>

<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>

<jsp:useBean id="os" class="br.com.consorciosdf.intranet.modelo.OS" scope="request"/>
<jsp:useBean id="checkEquipamento" class="br.com.consorciosdf.intranet.modelo.CheckEquipamento" scope="request"/>
<jsp:useBean id="equipamento" class="br.com.consorciosdf.intranet.modelo.Equipamento" scope="request"/>
<jsp:useBean id="equipamentoOS" class="br.com.consorciosdf.intranet.modelo.Equipamento" scope="request"/>
<jsp:useBean id="usuario" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request"/>
<jsp:useBean id="usuarioAutor" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request"/>
<jsp:useBean id="usuarioDest" class="br.com.consorciosdf.intranet.modelo.Usuario" scope="request"/>

<%

            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss dd/MM/yyyy");

            List listEquipamentos;
            List listUsuarios;

            ManterOSControl manterOSControl = new ManterOSControl();
            listEquipamentos = manterOSControl.recuperarEquipamentos();

            ManterUserControl manterUserControl = new ManterUserControl();
            listUsuarios = manterUserControl.listUsers();

            if ((request.getParameter("id")) != null) {
                int id = Integer.parseInt(request.getParameter("id"));

                os = manterOSControl.recuperarOS(id);
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

        <table width="779" border="0" cellspacing="0" cellpadding="0">

            <tr>
                <td width="13">&nbsp;</td>
                <td width="549" height="180" colspan="2" valign="top">

                    <%
                                int idOs = 0;

                                Calendar dtAnomalia = null;
                                Calendar dtAbertura = null;
                                Calendar dtFechamento = null;
                                Calendar dtServico = null;

                                String userAutor = "";
                                String userDest = "";
                                String tipoOS = "";
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
                                String dataAbertura = "";
                                String dataFechamento = "";
                                String dataServico = "";
                                String status = "";
                                String statusFechamento = "";
                                String statusStyle = "";
                                int prioridadeOS = 0;

                                String styleButtonEnabled = "class='Button'";
                                String styleButtonDisabled = "class='ButtonDisabled' disabled='disabled'";

                                String buttonAccept = styleButtonEnabled;
                                String buttonEdit = styleButtonEnabled;
                                String buttonClose = styleButtonEnabled;

                                if (os != null) {
                                    if (os.getCheckEquipamento() != null) {
                                        checkEquipamento = os.getCheckEquipamento();
                                    }
                                    if (os.getEquipamento() != null) {
                                        equipamentoOS = os.getEquipamento();
                                    }
                                    if (os.getUsuarioAutor() != null) {
                                        usuarioAutor = os.getUsuarioAutor();
                                    }
                                    if (os.getUsuarioDest() != null) {
                                        usuarioDest = os.getUsuarioDest();
                                    }

                                    if (os.getPrioridade() >= 0) {
                                        prioridadeOS = os.getPrioridade();
                                    }
                                    idOs = os.getId();
                                    tipoOS = os.getTipoOS();
                                    nomeEquipamento = equipamento.getNomeEquipamento();
                                    endEquipamento = equipamento.getEnderecoLogradouroEquipamento();
                                    //dataAbertura = dateFormat.format(os.getDataAbertura());

                                    if (os.getDataAnomalia() != null){
                                        dtAnomalia = Calendar.getInstance();
                                        dtAnomalia.setTime(os.getDataAnomalia());
                                        }

                                    if (os.getDataAbertura() != null) {
                                        dtAbertura = Calendar.getInstance();
                                        dtAbertura.setTime(os.getDataAbertura());
                                    }

                                    if (os.getDataFechamento() != null) {
                                        dtFechamento = Calendar.getInstance();
                                        dtFechamento.setTime(os.getDataFechamento());
                                    }
                                    if (os.getDataServico() != null) {
                                        dtServico = Calendar.getInstance();
                                        dtServico.setTime(os.getDataServico());
                                    }
                                    if (equipamentoOS.getNumSerie() != 0) {
                                        numSerie = String.valueOf(equipamentoOS.getNumSerie());
                                    }

                                    if (equipamentoOS.getNumUPR() != 0) {
                                        numUPR = String.valueOf(equipamentoOS.getNumUPR());
                                    }

                                    if (equipamentoOS.getNumCamera() != 0) {
                                        numCamera = String.valueOf(equipamentoOS.getNumCamera());
                                    }

                                    if (equipamentoOS.getNumFlash() != null) {
                                        numFlash = equipamentoOS.getNumFlash();
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

                    <form method="post" action="editOS">
                        <table width="549" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="Title">
                                    <table width='549' cellspacing='0' cellpadding='0' border='0'>
                                        <tr>
                                            <td class="Title" width="400">Ordem de Servi�o - Alterar</td>
                                            <td width="149" align="right">
                                                <a href="osView.jsp?id=<%= os.getId()%>"><img src="imagens/stock_navigator-back-16.gif" border="0" alt="Voltar"></a>
                                                  <a href='osList.jsp'><img src='imagens/home16.gif' border='0' alt='Tela Inicial'></a> 
                                                 <a href="javascript:window.location.reload()"><img src="imagens/stock_refresh-16.gif" border="0" alt="Atualizar"></a>
                                                <a href="#" onClick="openWindow('osPrint.jsp?id=<%= idOs%>', 'osPrint', 700, 500)"><img src="imagens/stock_print-16.gif" border="0" alt="Imprimir"></a>
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
                                    <table width="549" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style='border: 1px solid #000000;'>
                                        <tr>
                                            <td height="20" class="TableResultTitle" style='border-bottom: 1px solid #000000;'>&nbsp;</td>
                                            <td colspan="3" class="TableResultTitle" style='border-bottom: 1px solid #000000;'>Dados da OS:</td>
                                        </tr>

                                        <tr class="TableResultBody1">
                                            <td height="18">&nbsp;</td>
                                            <td class="Title">N&deg; de OS:</td>
                                            <td>&nbsp;</td>
                                            <td>
                                                <%= idOs + os.getTipoOS().toUpperCase()%>
                                            </td>
                                        </tr>
                                        <tr class="TableResultBody2">

                                            <td width="18"></td>
                                            <td class="Title" >Status da OS:</td>
                                            <td>&nbsp;</td>
                                            <td class="<%= statusStyle%>">
                                                <%
                                                            out.println("<select name='status' id='status' class='Select' style='width:120px;'>");
                                                            out.println("<option value='' class='OptionBody1'>SELECIONE</option>");

                                                            if (status.equals("ab")) {
                                                                out.println("<option value='ab' class='OptionBody2' selected='selected'>ABERTO</option>");
                                                                out.println("<option value='an' class='OptionBody1'>AN�LISE</option>");
                                                                out.println("<option value='ag' class='OptionBody2'>AGUARDANDO</option>");
                                                                out.println("<option value='fc' class='OptionBody1'>FECHADO</option>");
                                                            } else if (status.equals("an")) {
                                                                out.println("<option value='ab' class='OptionBody2'>ABERTO</option>");
                                                                out.println("<option value='an' class='OptionBody1' selected='selected'>AN�LISE</option>");
                                                                out.println("<option value='ag' class='OptionBody2'>AGUARDANDO</option>");
                                                                out.println("<option value='fc' class='OptionBody1'>FECHADO</option>");
                                                            } else if (status.equals("ag")) {
                                                                out.println("<option value='ab' class='OptionBody2'>ABERTO</option>");
                                                                out.println("<option value='an' class='OptionBody1'>AN�LISE</option>");
                                                                out.println("<option value='ag' class='OptionBody2' selected='selected'>AGUARDANDO</option>");
                                                                out.println("<option value='fc' class='OptionBody1'>FECHADO</option>");
                                                            } else if (status.equals("fc")) {
                                                                out.println("<option value='ab' class='OptionBody2'>ABERTO</option>");
                                                                out.println("<option value='an' class='OptionBody1'>AN�LISE</option>");
                                                                out.println("<option value='ag' class='OptionBody2'>AGUARDANDO</option>");
                                                                out.println("<option value='fc' class='OptionBody1' selected='selected'>FECHADO</option>");
                                                            } else {
                                                                out.println("<option value='ab' class='OptionBody2'>ABERTO</option>");
                                                                out.println("<option value='an' class='OptionBody1'>AN�LISE</option>");
                                                                out.println("<option value='ag' class='OptionBody2'>AGUARDANDO</option>");
                                                                out.println("<option value='fc' class='OptionBody1'>FECHADO</option>");
                                                            }

                                                            out.println("</select>");
                                                %>
                                            </td>
                                        </tr>
                                        <tr class="TableResultBody1">

                                            <td width="18"></td>
                                            <td class="Title" >Prioridade da OS:</td>
                                            <td>&nbsp;</td>
                                            <td class="<%= statusStyle%>">
                                                <%
                                                            out.println("<select name='prioridade_os' id='prioridade_os' class='Select' style='width:100px;'>");
                                                            out.println("<option value='' class='OptionBody1'>SELECIONE</option>");

                                                            if (prioridadeOS == 0) {
                                                                out.println("<option value='0' class='OptionBody2' selected='selected'>ALTA</option>");
                                                                out.println("<option value='1' class='OptionBody1'>M�DIA</option>");
                                                                out.println("<option value='2' class='OptionBody2'>BAIXA</option>");
                                                            } else if (prioridadeOS == 1) {
                                                                out.println("<option value='0' class='OptionBody2'>ALTA</option>");
                                                                out.println("<option value='1' class='OptionBody1' selected='selected'>M�DIA</option>");
                                                                out.println("<option value='2' class='OptionBody2'>BAIXA</option>");
                                                            } else if (prioridadeOS == 2) {
                                                                out.println("<option value='0' class='OptionBody2'>ALTA</option>");
                                                                out.println("<option value='1' class='OptionBody1'>M�DIA</option>");
                                                                out.println("<option value='2' class='OptionBody2' selected='selected'>BAIXA</option>");
                                                            }

                                                            out.println("</select>");
                                                %>
                                            </td>



                                        </tr>
                                        <tr class="TableResultBody2">
                                            <td height="18">&nbsp;</td>
                                            <td class="Title">Tipo de OS:</td>
                                            <td>&nbsp;</td>
                                            <td>
                                                <%

                                                            out.println("<select name='tipo_os' id='tipo_os' class='Select' style='width:250px;'>");
                                                            out.println("<option value='' class='OptionBody1'>-- SELECIONE --</option>");

                                                            if (os.getTipoOS().equals("p")) {
                                                                out.println("<option value='p' class='OptionBody2' selected='selected'>Manuten��o Preventiva</option>");
                                                                out.println("<option value='c' class='OptionBody1'>Manuten��o Corretiva</option>");
                                                                out.println("<option value='a' class='OptionBody2'>Aferi��o</option>");
                                                            } else if (os.getTipoOS().equals("c")) {
                                                                out.println("<option value='p' class='OptionBody2'>Manuten��o Preventiva</option>");
                                                                out.println("<option value='c' class='OptionBody1' selected='selected'>Manuten��o Corretiva</option>");
                                                                out.println("<option value='a' class='OptionBody2'>Aferi��o</option>");
                                                            } else if (os.getTipoOS().equals("a")) {
                                                                out.println("<option value='p' class='OptionBody2'>Manuten��o Preventiva</option>");
                                                                out.println("<option value='c' class='OptionBody1'>Manuten��o Corretiva</option>");
                                                                out.println("<option value='a' class='OptionBody2' selected='selected'>Aferi��o</option>");
                                                            } else {
                                                                out.println("<option value='p' class='OptionBody2'>Manuten��o Preventiva</option>");
                                                                out.println("<option value='c' class='OptionBody1'>Manuten��o Corretiva</option>");
                                                                out.println("<option value='a' class='OptionBody2'>Aferi��o</option>");
                                                            }

                                                            out.println("</select>");

                                                %>
                                            </td>
                                        </tr>
                                        <tr class="TableResultBody1">
                                            <td height="18">&nbsp;</td>
                                            <td class="Title">Solicitante:</td>
                                            <td>&nbsp;</td>
                                            <td>
                                                <%

                                                            if (listUsuarios != null) {
                                                                String optionStyle = "OptionBody1";
                                                                int countResult = 0;

                                                                out.println("<select name='usuario_autor' id='usuario_autor' class='Select' style='width:250px;'>");
                                                                out.println("<option value='' " + " class='" + optionStyle + "'>-- SELECIONE --</option>");

                                                                countResult++;

                                                                for (int i = 0; i < listUsuarios.size(); i++) {
                                                                    usuario = (Usuario) listUsuarios.get(i);
                                                                    countResult++;

                                                                    String userSelected = "";
                                                                    if (usuarioAutor.getMatriculaUsuario().equals(usuario.getMatriculaUsuario())) {
                                                                        userSelected = " selected='selected'";
                                                                    }

                                                                    if (countResult % 2 == 0) {
                                                                        optionStyle = "OptionBody2";
                                                                    } else if (countResult % 2 == 1) {
                                                                        optionStyle = "OptionBody1";
                                                                    }

                                                                    out.println("<option value='" + usuario.getMatriculaUsuario() + "' class='" + optionStyle + "'" + userSelected + ">");
                                                                    out.println(usuario.getNomeUsuario() + " " + usuario.getSobrenomeUsuario() + " (" + usuario.getUser() + ")");
                                                                    out.println("</option>");
                                                                }

                                                                out.println("</select>");
                                                            } else {
                                                                out.println("<select name='usuario_autor' class='Select' style='width:150px;' disabled='disabled'>");
                                                                out.println("<option>N�o h� usu�rios para editar.</option>");
                                                                out.println("</select>");
                                                            }

                                                %>
                                            </td>
                                        </tr>
                                        <tr class="TableResultBody2">
                                            <td height="18">&nbsp;</td>
                                            <td class="Title">T�cnico:</td>
                                            <td>&nbsp;</td>
                                            <td>
                                                <%

                                                            if (listUsuarios != null) {
                                                                String optionStyle = "OptionBody1";
                                                                int countResult = 0;

                                                                out.println("<select name='usuario_dest' id='usuario_dest' class='Select' style='width:250px;'>");
                                                                out.println("<option value='' " + " class='" + optionStyle + "'>-- SELECIONE --</option>");

                                                                countResult++;

                                                                for (int i = 0; i < listUsuarios.size(); i++) {
                                                                    usuario = (Usuario) listUsuarios.get(i);
                                                                    countResult++;

                                                                    String userSelected = "";
                                                                    if (usuarioDest.getMatriculaUsuario().equals(usuario.getMatriculaUsuario())) {
                                                                        userSelected = " selected='selected'";
                                                                    }

                                                                    if (countResult % 2 == 0) {
                                                                        optionStyle = "OptionBody2";
                                                                    } else if (countResult % 2 == 1) {
                                                                        optionStyle = "OptionBody1";
                                                                    }

                                                                    out.println("<option value='" + usuario.getMatriculaUsuario() + "' class='" + optionStyle + "'" + userSelected + ">");
                                                                    out.println(usuario.getNomeUsuario() + " " + usuario.getSobrenomeUsuario() + " (" + usuario.getUser() + ")");
                                                                    out.println("</option>");
                                                                }

                                                                out.println("</select>");
                                                            } else {
                                                                out.println("<select name='usuario_dest' class='Select' style='width:150px;' disabled='disabled'>");
                                                                out.println("<option>N�o h� usu�rios para editar.</option>");
                                                                out.println("</select>");
                                                            }

                                                %>
                                            </td>
                                        </tr>
                                        <tr class="TableResultBody1">
                                            <td height="18">&nbsp;</td>
                                            <td class="Title">Equipamento:</td>
                                            <td>&nbsp;</td>
                                            <td>
                                                <%

                                                            if (listEquipamentos != null) {
                                                                String optionStyle = "OptionBody1";
                                                                int countResult = 0;

                                                                out.println("<select name='equipamento' id='equipamento' class='Select' style='width:250px;'>");
                                                                out.println("<option value='' " + " class='" + optionStyle + "'>-- SELECIONE --</option>");

                                                                countResult++;

                                                                for (int i = 0; i < listEquipamentos.size(); i++) {
                                                                    equipamento = (Equipamento) listEquipamentos.get(i);
                                                                    countResult++;

                                                                    String equipamentoSelected = "";
                                                                    if (equipamentoOS.getIdEquipamento() == equipamento.getIdEquipamento()) {
                                                                        equipamentoSelected = " selected='selected'";
                                                                    }

                                                                    if (countResult % 2 == 0) {
                                                                        optionStyle = "OptionBody2";
                                                                    } else if (countResult % 2 == 1) {
                                                                        optionStyle = "OptionBody1";
                                                                    }

                                                                    out.println("<option value='" + equipamento.getIdEquipamento() + "' class='" + optionStyle + "'" + equipamentoSelected + ">");
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
                                        <tr class="TableResultBody2">
                                            <td height="18">&nbsp;</td>
                                            <td class="Title">N&deg; de s�rie:</td>
                                            <td>&nbsp;</td>
                                            <td><input type="text" name="numSerie" class="Input" onkeypress='return Number(event)'
                                                       maxlength="20" value="<%= numSerie%>"
                                                       style="width:250px;"></td>
                                        </tr>
                                        <tr class="TableResultBody1">
                                            <td height="18">&nbsp;</td>
                                            <td class="Title">N&deg; de Embarcada:</td>
                                            <td>&nbsp;</td>
                                            <td><input type="text" name="numUPR" class="Input" onkeypress='return Number(event)'
                                                       maxlength="20" value="<%= numUPR%>"
                                                       style="width:250px;"></td>
                                        </tr>
                                        <tr class="TableResultBody2">
                                            <td height="18">&nbsp;</td>
                                            <td class="Title">N&deg; de C�mera:</td>
                                            <td>&nbsp;</td>
                                            <td><input type="text" name="numCamera" class="Input" onkeypress='return Number(event)'
                                                       maxlength="20" value="<%= numCamera%>"
                                                       style="width:250px;"></td>
                                        </tr>
                                        <tr class="TableResultBody1">
                                            <td height="18">&nbsp;</td>
                                            <td class="Title">N&deg; de Flash:</td>
                                            <td>&nbsp;</td>
                                            <td><input type="text" name="numFlash" class="Input" onkeypress='return Number(event)'
                                                       maxlength="20" value="<%= numFlash%>"
                                                       style="width:250px;"></td>
                                        </tr>
                                        

                                        <tr class="TableResultBody2">
                                            <td height="18"></td>
                                            <td class="Title">Data de Anomalia:</td>
                                            <td></td>
                                            <td>
                                                <%

                                                            out.println("<select name='dt_ano_hr' id='dt_ano_hr' class='Select'>");

                                                            for (int hora = 0; hora <= 23; hora++) {
                                                                String selected = "";
                                                                if (dtAnomalia != null) {
                                                                    if (hora == dtAnomalia.get(Calendar.HOUR_OF_DAY)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + hora + "'" + selected + ">" + hora + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" : ");

                                                            out.println("<select name='dt_ano_min' id='dt_ano_min' class='Select'>");

                                                            for (int min = 0; min <= 59; min++) {
                                                                String selected = "";
                                                                if (dtAnomalia != null) {
                                                                    if (min == dtAnomalia.get(Calendar.MINUTE)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + min + "'" + selected + ">" + min + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println("&nbsp");

                                                            out.println("<select name='dt_ano_dia' id='dt_ano_dia' class='Select'>");

                                                            for (int dia = 0; dia <= 31; dia++) {
                                                                String selected = "";
                                                                if (dtAnomalia != null) {
                                                                    if (dia == dtAnomalia.get(Calendar.DAY_OF_MONTH)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + dia + "'" + selected + ">" + dia + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" / ");

                                                            out.println("<select name='dt_ano_mes' id='dt_ano_mes' class='Select'>");

                                                            for (int mes = 0; mes <= 12; mes++) {
                                                                String selected = "";
                                                                if (dtAnomalia != null) {
                                                                    if (mes == (dtAnomalia.get(Calendar.MONTH)) + 1) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }
                                                                out.println("<option value='" + mes + "'" + selected + ">" + mes + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" / ");

                                                            out.println("<select name='dt_ano_ano' id='dt_ano_ano' class='Select'>");
                                                            out.println("<option value='0'>0</option>");

                                                            for (int ano = 2007; ano <= 2012; ano++) {
                                                                String selected = "";
                                                                if (dtAnomalia != null) {
                                                                    if (ano == dtAnomalia.get(Calendar.YEAR)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + ano + "'" + selected + ">" + ano + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println("&nbsp");

                                                %>
                                            </td>
                                        </tr>
                                        <tr class="TableResultBody1">
                                            <td height="18"></td>
                                            <td class="Title">Data de Abertura:</td>
                                            <td></td>
                                            <td>
                                                <%

                                                            out.println("<select name='dt_ini_hr' id='dt_ini_hr' class='Select'>");

                                                            for (int hora = 0; hora <= 23; hora++) {
                                                                String selected = "";
                                                                if (dtAbertura != null) {
                                                                    if (hora == dtAbertura.get(Calendar.HOUR_OF_DAY)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + hora + "'" + selected + ">" + hora + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" : ");

                                                            out.println("<select name='dt_ini_min' id='dt_ini_min' class='Select'>");

                                                            for (int min = 0; min <= 59; min++) {
                                                                String selected = "";
                                                                if (dtAbertura != null) {
                                                                    if (min == dtAbertura.get(Calendar.MINUTE)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + min + "'" + selected + ">" + min + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println("&nbsp");

                                                            out.println("<select name='dt_ini_dia' id='dt_ini_dia' class='Select'>");

                                                            for (int dia = 0; dia <= 31; dia++) {
                                                                String selected = "";
                                                                if (dtAbertura != null) {
                                                                    if (dia == dtAbertura.get(Calendar.DAY_OF_MONTH)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + dia + "'" + selected + ">" + dia + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" / ");

                                                            out.println("<select name='dt_ini_mes' id='dt_ini_mes' class='Select'>");

                                                            for (int mes = 0; mes <= 12; mes++) {
                                                                String selected = "";
                                                                if (dtAbertura != null) {
                                                                    if (mes == (dtAbertura.get(Calendar.MONTH)) + 1) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }
                                                                out.println("<option value='" + mes + "'" + selected + ">" + mes + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" / ");

                                                            out.println("<select name='dt_ini_ano' id='dt_ini_ano' class='Select'>");
                                                            out.println("<option value='0'>0</option>");

                                                            for (int ano = 2007; ano <= 2012; ano++) {
                                                                String selected = "";
                                                                if (dtAbertura != null) {
                                                                    if (ano == dtAbertura.get(Calendar.YEAR)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + ano + "'" + selected + ">" + ano + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println("&nbsp");

                                                %>
                                            </td>
                                        </tr>
                                        <tr class="TableResultBody2">
                                            <td height="18"></td>
                                            <td class="Title">Data do Servi�o:</td>
                                            <td></td>
                                            <td>
                                                <%

                                                            out.println("<select name='dt_serv_hr' id='dt_serv_hr' class='Select'>");

                                                            for (int hora = 0; hora <= 23; hora++) {
                                                                String selected = "";
                                                                if (dtServico != null) {
                                                                    if (hora == dtServico.get(Calendar.HOUR_OF_DAY)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + hora + "'" + selected + ">" + hora + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" : ");

                                                            out.println("<select name='dt_serv_min' id='dt_serv_min' class='Select'>");

                                                            for (int min = 0; min <= 59; min++) {
                                                                String selected = "";
                                                                if (dtServico != null) {
                                                                    if (min == dtServico.get(Calendar.MINUTE)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + min + "'" + selected + ">" + min + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println("&nbsp");

                                                            out.println("<select name='dt_serv_dia' id='dt_serv_dia' class='Select'>");

                                                            for (int dia = 0; dia <= 31; dia++) {
                                                                String selected = "";
                                                                if (dtServico != null) {
                                                                    if (dia == dtServico.get(Calendar.DAY_OF_MONTH)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + dia + "'" + selected + ">" + dia + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" / ");

                                                            out.println("<select name='dt_serv_mes' id='dt_serv_mes' class='Select'>");

                                                            for (int mes = 0; mes <= 12; mes++) {
                                                                String selected = "";
                                                                if (dtServico != null) {
                                                                    if (mes == (dtServico.get(Calendar.MONTH)) + 1) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }
                                                                out.println("<option value='" + mes + "'" + selected + ">" + mes + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" / ");

                                                            out.println("<select name='dt_serv_ano' id='dt_serv_ano' class='Select'>");
                                                            out.println("<option value='0'>0</option>");

                                                            for (int ano = 2007; ano <= 2012; ano++) {
                                                                String selected = "";
                                                                if (dtServico != null) {
                                                                    if (ano == dtServico.get(Calendar.YEAR)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + ano + "'" + selected + ">" + ano + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println("&nbsp");

                                                %>

                                            </td>
                                        </tr>
                                        <tr class="TableResultBody1">
                                            <td height="18"></td>
                                            <td class="Title">Data de Fechamento:</td>
                                            <td></td>
                                            <td>
                                                <%

                                                            out.println("<select name='dt_fim_hr' id='dt_fim_hr' class='Select'>");

                                                            for (int hora = 0; hora <= 23; hora++) {
                                                                String selected = "";
                                                                if (dtFechamento != null) {
                                                                    if (hora == dtFechamento.get(Calendar.HOUR_OF_DAY)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + hora + "'" + selected + ">" + hora + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" : ");

                                                            out.println("<select name='dt_fim_min' id='dt_fim_min' class='Select'>");

                                                            for (int min = 0; min <= 59; min++) {
                                                                String selected = "";
                                                                if (dtFechamento != null) {
                                                                    if (min == dtFechamento.get(Calendar.MINUTE)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + min + "'" + selected + ">" + min + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println("&nbsp");

                                                            out.println("<select name='dt_fim_dia' id='dt_fim_dia' class='Select'>");

                                                            for (int dia = 0; dia <= 31; dia++) {
                                                                String selected = "";
                                                                if (dtFechamento != null) {
                                                                    if (dia == dtFechamento.get(Calendar.DAY_OF_MONTH)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + dia + "'" + selected + ">" + dia + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" / ");

                                                            out.println("<select name='dt_fim_mes' id='dt_fim_mes' class='Select'>");

                                                            for (int mes = 0; mes <= 12; mes++) {
                                                                String selected = "";
                                                                if (dtFechamento != null) {
                                                                    if (mes == (dtFechamento.get(Calendar.MONTH)) + 1) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }
                                                                out.println("<option value='" + mes + "'" + selected + ">" + mes + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println(" / ");

                                                            out.println("<select name='dt_fim_ano' id='dt_fim_ano' class='Select'>");
                                                            out.println("<option value='0'>0</option>");

                                                            for (int ano = 2007; ano <= 2012; ano++) {
                                                                String selected = "";
                                                                if (dtFechamento != null) {
                                                                    if (ano == dtFechamento.get(Calendar.YEAR)) {
                                                                        selected = " selected='selected'";
                                                                    }
                                                                }

                                                                out.println("<option value='" + ano + "'" + selected + ">" + ano + "</option>");
                                                            }

                                                            out.println("</select>");

                                                            out.println("&nbsp");

                                                %>
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
                                            <td colspan="2" height="5"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td align="center">
                                                <textarea name='defeito' class="TextArea" style='border: 0px solid #000000; background-color:#FFFFFF; width:539px; height: 100px;'><%= EditorTextoWeb.br2nl(descDefeito)%></textarea>
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
                                            <td class='TableResultTitle' style='border-bottom: 1px solid #000000;'>Observa��o:</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="5"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <textarea name='observacao' class="TextArea" style='border: 0px solid #000000; background-color:#FFFFFF; width:539px; height: 100px;'><%= EditorTextoWeb.br2nl(descObservacao)%></textarea>
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
                                            <td class='TableResultTitle' style='border-bottom: 1px solid #000000;'>Materiais Utilizados:</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="5"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <textarea name='reparo' class="TextArea" style='border: 0px solid #000000; background-color:#FFFFFF; width:539px; height: 100px;'><%= EditorTextoWeb.br2nl(descReparo)%></textarea>
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
                                            <td class='TableResultTitle' style='border-bottom: 1px solid #000000;'>Servi�os Executados:</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="5"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <textarea name='serv_exec' class="TextArea" style='border: 0px solid #000000; background-color:#FFFFFF; width:539px; height: 100px;'><%= EditorTextoWeb.br2nl(descServExec)%></textarea>
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
                                            <td class='TableResultTitle' style='border-bottom: 1px solid #000000;'>Fechamento:</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" height="5"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <textarea name='fechamento' class="TextArea" style='border: 0px solid #000000; background-color:#FFFFFF; width:539px; height: 100px;'><%out.print(EditorTextoWeb.br2nl(descFechamento));%></textarea>
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
                                    <table width="549" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="right">
                                                <input type="hidden" name="id" id="id" value="<%= idOs%>">
                                                <input type="submit" value="Salvar" id="Salvar" class="Button" onMouseOut="buttonOn(this)" onMouseOver="buttonOver(this)" style="width: 100px;">
                                            </td>
                                            <td width="50"></td>
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