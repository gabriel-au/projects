package br.jus.tst.mobilesite;

import java.util.Map;

import javax.servlet.http.HttpSession;

import br.jus.stj.mobile.SystemException;
import br.jus.tst.mobilesite.ui.A;
import br.jus.tst.mobilesite.ui.Body;
import br.jus.tst.mobilesite.ui.Div;
import br.jus.tst.mobilesite.ui.Form;
import br.jus.tst.mobilesite.ui.HTML;
import br.jus.tst.mobilesite.ui.Img;
import br.jus.tst.mobilesite.ui.Input;
import br.jus.tst.mobilesite.ui.P;
import br.jus.tst.mobilesite.ui.Texto;

public abstract class PadraoPaginas {
	public abstract String gerarPagina() throws SystemException;

	public abstract String gerarPagina(String paramString,
			Map<String, String> paramMap, HttpSession paramHttpSession)
			throws SystemException;

	public String gerarPaginaMensagem(String titulo, String mensagem)
			throws SystemException {
		return gerarPaginaMensagem(titulo, mensagem, null);
	}

	public String gerarPaginaMensagem(String titulo, String mensagem,
			String linkVoltar) throws SystemException {
		HTML pagina = new HTML();
		pagina.add(Padroes.getHeader());
		Body body = Padroes.getBody();
		pagina.add(body);

		if (linkVoltar == null) {
			linkVoltar = "";
		}

		Div div = new Div("titulo");
		A at = new A(linkVoltar, true);
		at.add(new Img("imagens/botao-inicio-azul.png"));
		div.add(at);
		div.add(new Div("titulo_texto", new Texto(titulo)));
		body.add(div);

		div = new Div("arredondado", new Texto(mensagem));
		body.add(div);

		body.add(Padroes.getEnchimentoPagina(15));
		return pagina.toString();
	}

	public String gerarPaginaErro400() throws SystemException {
		String texto = "A p�gina que voc� procura n�o est� dispon�vel no portal m�vel do STJ. Por favor, verifique se voc� digitou o endere�o corretamente e tente outra vez";

		HTML pagina = new HTML();
		pagina.add(Padroes.getHeader());
		Body body = Padroes.getBody();
		pagina.add(body);

		{
			Div div = new Div("titulo");
			A at = new A("", true);
			at.add(new Img("imagens/botao-inicio-azul.png"));
			div.add(at);
			div.add(new Div("titulo_texto", new Texto("Erro")));
			body.add(div);
		}

		{
			Div div = new Div("arredondado");
			div.add(new Div("arredondado_titulo", new Texto(
					"A p�gina n�o foi encontrada")));
			div.add(new Div("arredondado_chamada", new Texto(texto)));
			body.add(div);
		}

		body.add(Padroes.getEnchimentoPagina(15));
		return pagina.toString();
	}

	public String gerarPaginaErro500() throws SystemException {
		String texto = "A p�gina que voc� procura n�o est� dispon�vel no portal m�vel do STJ. Por favor, verifique se voc� digitou o endere�o corretamente e tente outra vez";

		HTML pagina = new HTML();
		pagina.add(Padroes.getHeader());
		Body body = Padroes.getBody();
		pagina.add(body);

		{
			Div div = new Div("titulo");
			A at = new A("", true);
			at.add(new Img("imagens/botao-inicio-azul.png"));
			div.add(at);
			div.add(new Div("titulo_texto", new Texto("Erro")));
			body.add(div);
		}

		{
			Div div = new Div("arredondado");
			div.add(new Div("arredondado_titulo", new Texto(
					"Erro na abertura da p�gina")));
			div.add(new Div("arredondado_chamada", new Texto(texto)));
			body.add(div);
		}

		body.add(Padroes.getEnchimentoPagina(15));
		return pagina.toString();
	}

	public void gerarPaginaConsulta(Body body, String metodoAction)
			throws SystemException {
		Div divPrincipal = new Div("arredondado");

		{
		Div div = new Div("arredondado_titulo");
		div.add(new Texto("Consulta"));
		divPrincipal.add(div);
		}
		
		Form form = new Form("Pagina");
		form.add(new Input("hidden", "p", metodoAction));
		form.add(new Input("hidden", "m", "consultar"));
		form.setMethod("GET");

		form.add(new Div("arredondado_chamada", new Texto(
				"Par�metro de pesquisa:")));

		Div div = new Div("arredondado_chamada_simples_center");

		div.add(new Input("text", "parametro", "input_text", "", "3"));
		div.add(new Input("submit", "valor", "input_submit", "", "50"));
		form.add(div);
		form.add(new P(""));
		divPrincipal.add(form);
		body.add(divPrincipal);
		body.add(Padroes.getEnchimentoPagina(15));
	}
}
