package br.jus.tst.mobilesite.servlet;

import br.jus.stj.mobile.SystemException;
import br.jus.tst.mobilesite.PadraoPaginas;
import br.jus.tst.mobilesite.util.UtilString;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Pagina extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		UtilString.setFullPath(request.getContextPath());
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String parametro = request.getParameter("p");

		String metodo = request.getParameter("m");

		Map listaParametros = new HashMap();
		Enumeration itens = request.getParameterNames();
		while (itens.hasMoreElements()) {
			String nome = (String) itens.nextElement();
			String valor = request.getParameter(nome);
			listaParametros.put(nome, valor);
		}

		HttpSession session = request.getSession();
		try {
			if ((parametro == null) || (parametro.equals("")))
				out.write(getPagina());
			else
				out.write(getPagina(parametro, metodo, listaParametros, session));
		} catch (SystemException e) {
			throw new ServletException(e.getMessage());
		}
	}

	private String getPagina() throws SystemException {
		PaginaIndex pg = new PaginaIndex();
		return pg.gerarPagina();
	}

	private String getPagina(String parametro, String metodo,
			Map<String, String> listaParametros, HttpSession session)
			throws SystemException {
		if ((metodo == null) || (metodo.equals(""))) {
			metodo = "gerarPagina";
		}

		String classeNome = "br.jus.tst.mobilesite.servlet.Pagina" + parametro;
		try {
			Object[] contrutoraParam = new Object[0];
			Object objeto = java.lang.Class.forName(classeNome)
					.getConstructors()[0].newInstance(contrutoraParam);

			PadraoPaginas pagina = (PadraoPaginas) objeto;

			return pagina.gerarPagina(metodo, listaParametros, session);
		} catch (Exception e) {
			throw new SystemException("Erro: " + e.getMessage());
		}
		
	}
}

/*
 * Location:
 * /Users/Gabriel/Workspace/POCs/Workspaces/workspace.POCS/STJMobileSite
 * /WebContent/WEB-INF/classes/ Qualified Name:
 * br.jus.tst.mobilesite.servlet.Pagina JD-Core Version: 0.6.0
 */