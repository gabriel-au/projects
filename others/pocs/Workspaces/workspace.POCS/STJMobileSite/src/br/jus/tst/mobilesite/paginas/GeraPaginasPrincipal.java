package br.jus.tst.mobilesite.paginas;

import br.jus.tst.mobilesite.Padroes;
import br.jus.tst.mobilesite.ui.A;
import br.jus.tst.mobilesite.ui.Body;
import br.jus.tst.mobilesite.ui.Div;
import br.jus.tst.mobilesite.ui.HTML;
import br.jus.tst.mobilesite.ui.Img;
import br.jus.tst.mobilesite.util.CriarArquivo;

public class GeraPaginasPrincipal {
	public static void main(String[] args) {
		gerar();
	}

	public static void gerar() {
		try {
			gerarIndex();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void gerarIndex() throws Exception {
		HTML pagina = new HTML();
		pagina.add(Padroes.getHeader());
		Body body = Padroes.getBody();
		pagina.add(body);

		Div divPrincipal = new Div("links");

		Div divNoticia = new Div("links_secundario");
		Div divJurisprudencia = new Div("links_secundario");
		Div divProcessos = new Div("links_secundario");
		Div divDJEletronico = new Div("links_secundario");

		A linkNoticia = new A("noticias.jsp", true);
		Img imgNoticia = new Img("imagens/btn_noticias.png");
		linkNoticia.add(imgNoticia);
		divNoticia.add(linkNoticia);

		A linkJurisprudencia = new A("jurisprudencia.jsp", true);
		Img imgJurisprudencia = new Img("imagens/btn_jurisprudencia.png");
		linkJurisprudencia.add(imgJurisprudencia);
		divJurisprudencia.add(linkJurisprudencia);

		A linkProcessos = new A("processos.jsp", true);
		Img imgProcessos = new Img("imagens/btn_processos.png");
		linkProcessos.add(imgProcessos);
		divProcessos.add(linkProcessos);

		A linkDJEletronico = new A("JEletronico.jsp", true);
		Img imgDJEletronico = new Img("imagens/btn_dj-eletronico.png");
		linkDJEletronico.add(imgDJEletronico);
		divDJEletronico.add(linkDJEletronico);

		divPrincipal.add(divNoticia);
		divPrincipal.add(divJurisprudencia);
		divPrincipal.add(divProcessos);
		divPrincipal.add(divDJEletronico);
		body.add(divPrincipal);

		CriarArquivo.salvar("index.jsp", pagina);
	}
}