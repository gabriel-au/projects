package br.gov.infraero.prototipo;

import br.gov.infraero.site.ui.Body;
import br.gov.infraero.site.ui.Div;
import br.gov.infraero.site.ui.H1;
import br.gov.infraero.site.ui.HTML;
import br.gov.infraero.site.ui.P;
import br.gov.infraero.site.util.CriarArquivo;

public class GeraPaginasErro {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		gerar();
	}

	public static void gerar(){
		try {
			GeraPaginasErro.gerarErro400();
			GeraPaginasErro.gerarErro500();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void gerarErro400() throws Exception{
		
		HTML pagina = new HTML();
		pagina.add(Padroes.getHeader());
		Body body = Padroes.getBody();
		pagina.add(body);
		
		String texto="A página que você procura não está disponível no portal móvel do STJ. Por favor, verifique se você digitou o endereço corretamente e tente outra vez";
		Div div = new Div("mensagem");
		H1 titulo = new H1("A Página não foi Encontrada.");
		P mensagem = new P(texto);
		
		div.add(titulo);
		div.add(mensagem);
		body.add(div);
		
		CriarArquivo.salvar("erro/400.jsp", pagina);
	}
	
	public static void gerarErro500() throws Exception{
		HTML pagina = new HTML();
		pagina.add(Padroes.getHeader());
		Body body = Padroes.getBody();
		pagina.add(body);
		
		String texto="Uma operação gerou uma falha na requisição desta página. Por favor, verifique se você digitou o endereço corretamente e tente outra vez";
		Div div = new Div("mensagem");
		H1 titulo = new H1("A Página não foi carregada.");
		P mensagem = new P(texto);
		
		div.add(titulo);
		div.add(mensagem);
		body.add(div);
		
		CriarArquivo.salvar("erro/500.jsp", pagina);
	}
	
}
