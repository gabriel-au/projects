<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

String erroLogin = "";
String erro = "";
erro = request.getParameter("erro");
if (erro != null) {
    if (erro.equals("1")) {
        erroLogin = "Favor digitar os campos corretamente.";
    } else if (erro.equals("2")) {
        erroLogin = "Usuário e/ou senha incorretos.";
    } else if (erro.equals("3")) {
        erroLogin = "Área restrita, favor efetuar o Login.";
    } else if (erro.equals("4")) {
        erroLogin = "Usuário bloqueado, favor entrar em contato com o administrador do sistema.";
    } else if (erro.equals("5")) {
        erroLogin = "Página não autorizada.";
    }else if (erro.equals("6")){
    	erroLogin = "Feche a janela e faça o login novamente.";
    } 
}else{
	erro = "";
}

String urlDest = "";
if ((request.getParameter("urlDest")) != null) {
    if (!request.getParameter("urlDest").equals("")) {
        urlDest = request.getParameter("urlDest");
    }
}

//identificar o user-agent
	String agent = request.getHeader("user-agent");

//passar para minusculo
	agent = agent.toLowerCase();
	
	if(agent.indexOf("iphone")>=0||
			agent.indexOf("jme")>=0 || 
			agent.indexOf("jme")>=0 || 
			agent.indexOf("j2me")>=0 || 
			agent.indexOf("symbian")>=0 ||
			agent.indexOf("android")>=0 ||
			agent.indexOf("blackberry")>=0 ){
		response.sendRedirect(request.getContextPath()+"/mobile/index.jsp");
		}
	
	
	
%>

<html>
    <head>
        <title>INTRANET CONSORCIO SDF</title>
        <link rel="stylesheet" type="text/css" href="estilos/default.css">
        
        <script language="javascript" type="text/javascript" src="scripts/default.js">
        </script>
        
    </head>
    
    <body onLoad="document.login.user.focus()">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="center" valign="middle"><table width="500" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="10">&nbsp;</td>
                            <td align="center"><img src="imagens/logo_intranetsdf.gif" width="361" height="120" alt=""></td>
                            <td width="10">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center">
                                <form name="login" method="post" action="userVerify.jsp">
                                    <table width="300" border="0" cellspacing="0" cellpadding="0">
                                    <%if(!erro.equals("6")){ %>
                                        <tr>
                                            <td width="10">&nbsp;</td>
                                            <td width="100" align="right" height="18" class="Title">Usu&aacute;rio:</td>
                                            <td width="30">&nbsp;</td>
                                            <td width="155"><input name="user" type="text" size="25" class="Input"></td>
                                            <td width="10">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="5" height="2"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td align="right" height="18" class="Title">Senha:</td>
                                            <td>&nbsp;</td>
                                            <td><input name="pass" type="password" size="25" class="Input"></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td colspan="3" align="center" class="Error"><%= erroLogin %></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td><input type="hidden" name="urlDest" value="<%= urlDest %>"></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td colspan="3" align="right"><input type="submit" value="Entrar" id="Entrar" class="Button" onMouseOut="buttonOn(this)" onMouseOver="buttonOver(this)"></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td colspan="3">&nbsp;</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <%} else{%>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td colspan="3" align="center" class="Error"><%= erroLogin %></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <%} %>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td colspan="3" height="40"></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td colspan="3" align="right">INTRANET CONSÓRCIO SDF&reg; 1.0.0<br>
                                            &copy;2007/2012 - CONSÓRCIO SDF</td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                            </form></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                </table></td>
            </tr>
        </table>
    </body>
</html>