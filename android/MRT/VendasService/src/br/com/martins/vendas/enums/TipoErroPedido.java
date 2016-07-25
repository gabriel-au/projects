package br.com.martins.vendas.enums;

@Deprecated
public enum TipoErroPedido {
	RN_ERRO_PORCENTAGEM_METALGRAMPO(-20029),
	RN_ERRO_PORCENTAGEM_SOJA(-20030), 
	RN_ERRO_QUOTA_EXCEDIDA(-20034), 
	RN_ERRO_ITEM_ESGOTADO(-20025),
	RN_ERRO_ITEM_DUPLICADO(-20024),
	RN_RESTRINGE_PEDIDO(-10015),
	RN_ERRO_VALOR_MAXIMO_BRINDE_FLEX(-20057),
	RN_ERRO_QDE_ITEM_INVALIDA(-20032),
	RN_ERRO_VENCIMENTO_CONDICAO (-20037),
	RN_ERRO_MINIMO_PONTOS_PEDIDO (-20056),
	RN_TOTAL_ZERO_QDE_ITENS (-10016),
	RN_ERRO_SEM_ITENS (-10008),
	RN_ERRO_BONIFICACAO_INDEVIDA (-20014);

/*	// Erros tratados com mensagens definidas na estrutura m_static_struSystemErros
	#define	RN_OK (1)
	#define RN_CIDADE_INVALIDA (-10001)
	#define RN_CLIENTE_NAO_ENCONTRADO (-10002)
	#define RN_DATREFLIV_DO_PEDIDO_INVALIDA (-10003)
	#define RN_ERRO_ABERTURA_ARQ_EXPORTACAO	(-10004)
	#define RN_ERRO_CHAVE_INVALIDA (-10005)
	#define RN_ERRO_ESCRITA_ARQ_EXPORTACAO (-10006)
	#define	RN_ERRO_SEEK (-10007)
	#define RN_ERRO_SEM_ITENS (-10008)
	#define	RN_ERRO_TABELA (-10009)
	#define	RN_NAO_ENCONTRADO (-10010)
	#define RN_OPERACAO_INVALIDA (-10011)
	#define RN_PEDIDO_EH_COTACAO (-10012)
	#define RN_PEDIDO_JA_PREPARADO (-10013)
	#define RN_PEDIDO_SO_LEITURA (-10014)
	#define RN_RESTRINGE_PEDIDO (-10015)
	#define RN_TOTAL_ZERO_QDE_ITENS (-10016)
	// Erros que não possuem mensagens definidas na estrutura m_static_struSystemErros
	#define RN_BLOQUEADA_REGIONALIZACAO (-20001)
	#define RN_CALCULO_INCORRETO (-20002)
	#define RN_CLIENTE_SEM_LIVRO (-20003)
	#define RN_CLIENTE_TERRITORIO_DIFERENTE (-20004)
	#define RN_CONCORRENTE_NAO_ENCONTRADO (-20005)
	#define RN_CONDICAO_NAO_ENCONTRADA (-20006)
	#define RN_DATREFLIV_ATUAL (-20007)
	#define RN_DATREFLIV_NOVO_LIVRO (-20008)
	#define RN_DATREFLIV_VENCIDA (-20009)
	#define RN_DEPOIS (-20010)
	#define RN_DESCONTO_INVALIDO (-20011)
	#define RN_ERRO (-20012)
	#define RN_ERRO_APAGA_REGISTRO (-20013)
	#define RN_ERRO_BONIFICACAO_INDEVIDA (-20014)
	#define RN_ERRO_CALCULO_PRECO (-20015)
	#define RN_ERRO_COPIA_ARQUIVO (-20016)
	#define RN_ERRO_CP_COMPROR_CLI_SEM_CTT (-20017)
	#define RN_ERRO_CP_VALORMINIMO (-20018)
	#define RN_ERRO_FILIAIS_PEDIDO (-20019)
	#define RN_ERRO_FRETE_VALORMINIMO (-20020)
	#define RN_ERRO_GRAVAR_CORPO_PEDIDO (-20021)
	#define RN_ERRO_GRAVAR_ITENS (-20022)
	#define RN_ERRO_INICIALIZA_TABELA (-20023)
	#define RN_ERRO_ITEM_DUPLICADO (-20024)
	#define RN_ERRO_ITEM_ESGOTADO (-20025)
	#define RN_ERRO_PARTICIPACAO_BENEFICIO	(-20026)
	#define RN_ERRO_PED_VALORMINIMO_BOLETO (-20027)
	#define RN_ERRO_PED_VALORMINIMO_EPD (-20028)
	#define RN_ERRO_PORCENTAGEM_METALGRAMPO	(-20029)
	#define RN_ERRO_PORCENTAGEM_SOJA (-20030)
	#define RN_ERRO_PROMOCAO_SEM_PMT (-20031)
	#define RN_ERRO_QDE_ITEM_INVALIDA (-20032)
	#define RN_ERRO_QDE_PROMOCAO (-20033)
	#define RN_ERRO_QUOTA_EXCEDIDA (-20034)
	#define RN_ERRO_QUOTA_MP_DO_BEM (-20035)
	#define RN_ERRO_VALOR_MINIMO_ITEM (-20036)
	#define RN_ERRO_VENCIMENTO_CONDICAO (-20037)
	#define	RN_EXISTE_ITEM_GONDOLA (-20038)
	#define RN_FALHA_INDICE (-20039)
	#define RN_FIM_ARRAY_CODTERCHV (-20040)
	#define	RN_FIM_PESQUISA (-20041)
	#define RN_ITEM_INSERIDO_OK (-20042)
	#define RN_ITEM_SEM_CONDICAO (-20043)
	#define RN_ITEM_SEM_DESCONTO (-20044)
	#define RN_MERCADORIA_INVALIDA (-20045)
	#define RN_MERCADORIA_LIBERADA (-20046)
	#define RN_MERCADORIA_SEM_PRECO (-20047)
	#define RN_NAO_SE_APLICA_STB (-20048)
	#define RN_NUMERO_NOTA_INVALIDO (-20049)
	#define RN_PEDIDO_BLOQUEADO (-20050)
	#define RN_PEDIDO_OK (-20051)
	#define RN_QUANTIDADE_INVALIDA (-20052)
	#define RN_SEM_FILIAL_FATURAMENTO (-20053)
	#define RN_THREAD_FIM_THREAD (-20054)
	#define RN_ERRO_PONTOS_DETALHE_ITEM (-20055)
	#define RN_ERRO_MINIMO_PONTOS_PEDIDO (-20056)
	#define RN_ERRO_VALOR_MAXIMO_BRINDE_FLEX (-20057)*/

    public Integer tipoErro;
 
    private TipoErroPedido(Integer tipoErro) {
    	this.tipoErro = tipoErro;
    }
    
}