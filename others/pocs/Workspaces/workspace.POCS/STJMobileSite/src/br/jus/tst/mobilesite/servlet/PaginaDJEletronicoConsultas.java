package br.jus.tst.mobilesite.servlet;

import br.jus.stj.mobile.SystemException;
import br.jus.stj.mobile.bd.consulta.ConsultaDiarioJustica;
import br.jus.stj.mobile.bd.pojo.DiarioJusticaPojo;
import br.jus.tst.mobilesite.ui.A;
import br.jus.tst.mobilesite.ui.Div;
import br.jus.tst.mobilesite.ui.Input;
import br.jus.tst.mobilesite.ui.P;
import br.jus.tst.mobilesite.ui.Texto;
import java.util.List;

public class PaginaDJEletronicoConsultas {
	public Div getNumero() throws SystemException {
		Div d = new Div();

		d.add(new Div("arredondado_chamada", new Texto(
				"N�mero do Processo no STJ:")));

		{
			Div div = new Div("arredondado_chamada_simples_center");
			div.add(new Input("text", "parametro", "input_text", "", "50"));
			div.add(new Input("submit", "valor", "input_submit", "", "50"));
			d.add(div);
		}

		d.add(new Div("arredondado_chamada", new Texto("Data:")));

		Div div = new Div("arredondado_chamada_simples_center");
		div.add(new Input("text", "parametro", "input_text", "", "10"));
		div.add(new Input("button", "valor", "input_data", "", "50"));
		d.add(div);

		return d;
	}

	public Div getNumeroRegistro() throws SystemException {
		Div d = new Div();
		return d;
	}

	public Div getNumeroUnico() throws SystemException {
		Div d = new Div();
		return d;
	}

	public Div getNumeroOrigem() throws SystemException {
		Div d = new Div();
		return d;
	}

	public Div getOAB() throws SystemException {
		Div d = new Div();
		return d;
	}

	public Div getNomeParte() throws SystemException {
		Div d = new Div();
		return d;
	}

	public Div getNomeAdvogado() throws SystemException {
		Div d = new Div();
		return d;
	}

	public Div getIntegral() throws SystemException {
		ConsultaDiarioJustica consulta = new ConsultaDiarioJustica();

		Div d = new Div();

		d.add(new P(
				"Aten��o! Cada arquivo PDF contendo a �ntegra do DJe tem um tamanho aproximado de 30 MB. Arquivos desse tamanho costumam levar cerca de 30 minutos para serem copiados (download) em conex�es de 256 Kbps, podendo demorar mais em fun��o da quantidade de usu�rios que estiverem utilizando o servi�o. Caso haja lentid�o excessiva durante a c�pia do arquivo, tente efetu�-lo em hor�rios de menor concorr�ncia."));

		d.add(new P(
				"O arquivo �nico representa o resultado de um dos crit�rios de pesquisa. N�o tem valor legal por n�o ser assinado digitalmente. O resultado dessa pesquisa � mantido durante 60 dias."));

		List<DiarioJusticaPojo> lista = consulta.listarUltimasEdicoes();

		for (DiarioJusticaPojo pojo : lista) {
			A a = new A(pojo.getLink(), true);
			Div div = new Div();
			div.add(new Div(new Texto("Edi��o n� " + pojo.getEdicao() + " "
					+ pojo.getLocal())));
			div.add(new Div(new Texto(pojo.getDisponivelEm())));
			div.add(new Div(new Texto(pojo.getPublicadoEm())));

			a.add(div);

			d.add(new Div("arredondado_link_borda", a));
		}

		return d;
	}
}