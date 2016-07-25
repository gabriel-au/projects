package br.com.prime.fiscon.mobile.form;

import java.io.IOException;
import java.util.Hashtable;
import java.util.Vector;

import javax.bluetooth.RemoteDevice;

import org.j4me.ui.components.Label;

import br.com.codequest.mobile.MobileDialog;
import br.com.codequest.mobile.exceptions.BancoDadosException;
import br.com.codequest.mobile.exceptions.ConexaoException;
import br.com.codequest.mobile.exceptions.PareadoException;
import br.com.codequest.mobile.util.DateConverter;
import br.com.codequest.mobile.util.Propriedades;
import br.com.codequest.mobile.util.StringUtils;
import br.com.codequest.mobile.util.ZebraPrinterBluetooth;
import br.com.prime.fiscon.mobile.negocio.CRUDNegocio;
import br.com.prime.fiscon.mobile.pojo.AutoInfracaoPojo;
import br.com.prime.fiscon.mobile.pojo.Impressora;
import br.com.prime.fiscon.mobile.pojo.VeiculoPojo;

/**
 * Tela para complementar o endereço
 * 
 * @author ecarminati
 * 
 */
public class AutoInfracaoSerieImprimir extends MobileDialog {
	private ZebraPrinterBluetooth zebraPrinterBluetooth;
	private String addressDevice;
	private Label impressoraEndereco;
	private Label numeroAutoInfracao;

	public AutoInfracaoSerieImprimir(MobileDialog dialog) {
		super("Solicitar Impressao"); 
		setPrevScreen(dialog);
	}

	public AutoInfracaoSerieImprimir(MobileDialog dialog, String addressDevice) {
		this(dialog);
		this.addressDevice = addressDevice;
	}
	
	public void init() {
		impressoraEndereco = new Label();
		append(impressoraEndereco);
		
		numeroAutoInfracao = new Label();
		append(numeroAutoInfracao);
		
		
	}
	public void show() {
		try {
			
			if(Impressora.getInstance().getBluetoothAddress()!=null){
				impressoraEndereco.setLabel("Impressora: "+Impressora.getInstance().getBluetoothAddress());
			}else{
				impressoraEndereco.setLabel("Impressora: Não configurada.");
			}
			
			numeroAutoInfracao.setLabel("Número Auto Infração: "+AutoInfracaoPojo.getInstance().getNumeroAutoInfracao());
			

			repaint();
		} catch (BancoDadosException e) {
			showMensagemErro(getTitle(), "Falha ao carregar impressora"+e.getMessage(), this);
			e.printStackTrace();
		} catch (Exception e) {
			showMensagemErro(getTitle(), "Falha ao serializar"+e.getMessage(), this);
			e.printStackTrace();
		}
		super.show();
	}
	protected void definirMenu() {
		setMenuText("Finalizar", "Imprimir");
	}

	public void executarLeft() {
		AutoInfracaoPojo.limparCampos();
		new MenuPrincipal().show();
	}

	public void executarRight() {
		
		try {	
			zebraPrinterBluetooth = new ZebraPrinterBluetooth();
			zebraPrinterBluetooth.setEnvio(getFormulario());
			zebraPrinterBluetooth.connect(this.addressDevice);

		} catch (PareadoException e) {
			e.printStackTrace();
			showMensagemErro(getTitle(), "Falha ao parear: " + e.getMessage(),
					this);
			/*ListaDeviceBluetooth listaDeviceBluetooth = new ListaDeviceBluetooth();
			listaDeviceBluetooth.setPrevScreen(this);
			listaDeviceBluetooth.show();*/
			new AguardeConfigurarImpressora(this, true).show();
		} catch (ConexaoException e) {
			e.printStackTrace();
			showMensagemErro(getTitle(),
					"Falha ao conectar: " + e.getMessage(), this);
			setMenuText("Finalizar", "Tentar Novamente");
		} catch (IOException e) {
			e.printStackTrace();
			showMensagemErro(getTitle(), "Falha ao carregar o logo."
					+ e.getMessage(), this);
		} catch (Exception e) {
			
			showMensagemErro(getTitle(), "Desconhecido\n" + e,
					this);
		}
		if (Propriedades.getProperty("ARMAZENAGEM_LOCAL").equals("true")) {
			try {
				CRUDNegocio crudNegocio = new CRUDNegocio();
				AutoInfracaoPojo.getInstance().setStatus(AutoInfracaoPojo.IMPRESSO);
				crudNegocio.gravar(AutoInfracaoPojo.getInstance());
			} catch (BancoDadosException be) {
			//	log.trace("Falha ao excluir dados localmente", be);
				showMensagemErro(getTitle(),
						"Falha ao excluir dados localmente", this);
			} catch (Exception e) {
				//log.trace("Falha ao excluir dados localmente", e); 
				showMensagemErro(getTitle(),
						"Falha ao excluir dados localmente", this);
			}
		}
		
		

	}

	public static String getFormulario() throws Exception {
		try{
			Vector veiculos = AutoInfracaoPojo.getInstance().getVeiculos();
			VeiculoPojo vp = (VeiculoPojo) veiculos.elementAt(AutoInfracaoPojo.getInstance().getIndice().intValue());
			AutoInfracaoPojo.getInstance().setVeiculoPojo(vp);
			//configureMicroLog();
			//log.debug("TEste");
			Hashtable campos = new Hashtable();
			if (AutoInfracaoPojo.getInstance().getVeiculoPojo().getNumeroAutoInfracao() != null) {
				//log.debug("Numero Infracao: "+AutoInfracaoPojo.getInstance().getNumeroAutoInfracao());
				campos.put("<<NUMAUTOINFRACAO>>", AutoInfracaoPojo.getInstance().getVeiculoPojo().getNumeroAutoInfracao());
			} else {
				campos.put("<<NUMAUTOINFRACAO>>", "P001023093");
			}
			//log.debug("NumeroInfracao");
			campos.put("<<ORGAOAUTUADOR>>", "DETRAN-DF");
			campos.put("<<CODIGOORGAO>>", "107100");
			if (AutoInfracaoPojo.getInstance().getVeiculoPojo() != null) {
				if (AutoInfracaoPojo.getInstance().getVeiculoPojo()
						.getVeiculoPlaca() != null) {
					campos.put("<<PLACA>>", AutoInfracaoPojo.getInstance()
							.getVeiculoPojo().getVeiculoPlaca());
				} else {
					campos.put("<<PLACA>>", " ");
				}
				//log.debug("Placa");
				if (AutoInfracaoPojo.getInstance().getVeiculoPojo().getEspecie() != null) {
					campos.put("<<ESPECIE>>", AutoInfracaoPojo.getInstance()
							.getVeiculoPojo().getEspecie());
				} else {
					campos.put("<<ESPECIE>>", " ");
				}
				//log.debug("Especie");
	
				if (AutoInfracaoPojo.getInstance().getVeiculoPojo().getUf() != null) {
					campos.put("<<UF>>", AutoInfracaoPojo.getInstance()
							.getVeiculoPojo().getUf());
				} else {
					campos.put("<<UF>>", " ");
				}
				//log.debug("UF");
				if (AutoInfracaoPojo.getInstance().getVeiculoPojo()
						.getMarcaModelo() != null) {
					campos.put("<<MARCA>>", AutoInfracaoPojo.getInstance()
							.getVeiculoPojo().getMarcaModelo());
				} else {
					campos.put("<<MARCA>>", " ");
				}
				//log.debug("Marcar");
				
					campos.put("<<NOMEPROP>>", " ");
				
				//log.debug("Nome Prop");
			} else {
				campos.put("<<PLACA>>", " ");
				campos.put("<<UF>>", " ");
				campos.put("<<MARCA>>", " ");
				campos.put("<<NOMEPROP>>", " ");
				campos.put("<<ESPECIE>>", " ");
			}
			//campos.put("<<DESDOBRAMENTO>>", " ");
			campos.put("<<UFCNH>>", "  ");
	
			campos.put("<<CPF>>", "  ");
			campos.put("<<NUMCNH>>", "");
			//log.debug("CNH Registro");
			if (AutoInfracaoPojo.getInstance().getInfracaoTipoPojo() != null) {
				if (AutoInfracaoPojo.getInstance().getInfracaoTipoPojo().getNome() != null) {
					if (AutoInfracaoPojo.getInstance().getInfracaoTipoPojo()
							.getNome().length() < 65) {
						campos.put("<<DESCINFRACAO>>", AutoInfracaoPojo
								.getInstance().getInfracaoTipoPojo().getNome());
						
						//log.debug("Infracao Nome");
						
						campos.put("<<DESCINFRACAOCONT>>", "");
					} else {
						campos.put("<<DESCINFRACAO>>", AutoInfracaoPojo
								.getInstance().getInfracaoTipoPojo().getNome()
								.substring(0, 65));
						campos.put("<<DESCINFRACAOCONT>>", AutoInfracaoPojo
								.getInstance().getInfracaoTipoPojo().getNome()
								.substring(
										65,
										AutoInfracaoPojo.getInstance()
												.getInfracaoTipoPojo().getNome()
												.length()));
						//log.debug("Infracao Nome");
					}
	
				} else {
					campos.put("<<DESCINFRACAO>>", " ");
				}
				if (AutoInfracaoPojo.getInstance().getInfracaoTipoPojo()
						.getCodigo() != null) {
					campos.put("<<CODINFRACAO>>", AutoInfracaoPojo.getInstance()
							.getInfracaoTipoPojo().getCodigo());
				} else {
					campos.put("<<CODINFRACAO>>", " ");
				}
				//log.debug("Codigo Infracao");
			} else {
				campos.put("<<DESCINFRACAO>>", " ");
				campos.put("<<CODINFRACAO>>", " ");
			}
			if(AutoInfracaoPojo.getInstance().getEndereco()!=null){
				if(AutoInfracaoPojo.getInstance().getEndereco().getEndereco()!=null){
					campos.put("<<ENDERECO>>", AutoInfracaoPojo.getInstance().getEndereco()
						.getEndereco());
					//log.debug("Endereço");
				}
				if(AutoInfracaoPojo.getInstance().getEndereco().getBairro()!=null){
					campos.put("<<BAIRRO>>", AutoInfracaoPojo.getInstance().getEndereco()
							.getBairro());
					//log.debug("Bairro");
				}
				if(AutoInfracaoPojo.getInstance().getEndereco().getComplemento()!=null){
					campos.put("<<COMPLEMENTO>>", AutoInfracaoPojo.getInstance()
							.getEndereco().getComplemento());
					//log.debug("Complemento");
				}else{
					campos.put("<<COMPLEMENTO>>", "");
				}
				campos.put("<<UFLOCAL>>", AutoInfracaoPojo.getInstance().getEndereco()
						.getUf());
				//log.debug("UF Local");
			}
			if (AutoInfracaoPojo.getInstance().getDataInfracao() != null) {
				campos.put("<<DATAINFRACAO>>", DateConverter.dateToString(
						AutoInfracaoPojo.getInstance().getDataInfracao(),
						"dd/MM/yyyy"));
			} else {
				campos.put("<<DATAINFRACAO>>", " ");
			}
			//log.debug("Data infracao");
			if (AutoInfracaoPojo.getInstance().getDataInfracao() != null) {
				campos.put("<<HORAINFRACAO>>", DateConverter.dateToString(
						AutoInfracaoPojo.getInstance().getDataInfracao(), "hh:mm"));
			} else {
				campos.put("<<HORAINFRACAO>>", " ");
			}
			//log.debug("Hora infracao");
			if(AutoInfracaoPojo.getInstance()
					.getInfracaoTipoPojo().getGravidade()!=null){
				campos.put("<<PONTUCAO>>", AutoInfracaoPojo.getInstance()
						.getInfracaoTipoPojo().getGravidade());
				//log.debug("Pontuacao");
			}
			if(AutoInfracaoPojo.getInstance()
					.getInfracaoTipoPojo().getAmparoLegal()!=null){
				campos.put("<<ARTIGOCTB>>", AutoInfracaoPojo.getInstance()
						.getInfracaoTipoPojo().getAmparoLegal());
				//log.debug("Artigo");
			}
			String t = new String();
	
			t += "! 0 200 200 930 1                                                                   \r\n";
			t += "JOURNAL                                                                             \r\n";
			t += "CONTRAST 0                                                                          \r\n";
			t += "TONE 0                                                                              \r\n";
			t += "SPEED 3                                                                             \r\n";
			t += "PAGE-WIDTH 588                                                                      \r\n";
			t += "BAR-SENSE                                                                           \r\n";
			t += ";// PAGE 0000000005880930                                                           \r\n";
			t += "T Gil08pt.cpf 0 137 39 GOVERNO DO DISTRITO FEDERAL                                  \r\n";
			t += "T Gil08pt.cpf 0 138 58 SECRETARIA DE ESTADO DE SEGURANÇA PUBLICA                    \r\n";
			t += "T Gil08pt.cpf 0 138 77 DEPARTAMENTO DE TRÂNSITO DO DISTRITO FEDERAL                 \r\n";
			t += "T Gil08pt.cpf 0 224 628 TIPIFICACAO DA INFRACAO                                     \r\n";
			t += "BOX 35 173 581 231 1                                                                \r\n";
			t += "T Gil08pt.cpf 0 386 197 <<NUMAUTOINFRACAO>>                                                  \r\n";
			t += "T 0 0 383 180 N. do Auto de Infracao                                                \r\n";
			t += "T 0 0 38 178 Orgao Autuador                                                         \r\n";
			t += "T Gil08pt.cpf 0 55 195 <<ORGAOAUTUADOR>>                                                    \r\n";
			t += "T 0 0 204 178 Codigo do Orgao                                                       \r\n";
			t += "T Gil08pt.cpf 0 234 196 <<CODIGOORGAO>>                                                      \r\n";
			t += "BOX 35 261 579 318 1                                                                \r\n";
			t += "T Gil08pt.cpf 0 205 232 IDENTIFICACAO DO VEICULO                                    \r\n";
			t += "T 0 0 42 267 Placa                                                                  \r\n";
			t += "T Gil08pt.cpf 0 47 282 <<PLACA>>                                                      \r\n";
			t += "T 0 0 443 267 Marca/Modelo                                                          \r\n";
			t += "T Gil08pt.cpf 0 443 282 <<ESPECIE>>                                                  \r\n";
			t += "T 0 0 115 268 UF                                                                    \r\n";
			t += "T Gil08pt.cpf 0 121 282 <<UF>>                                                          \r\n";
			t += "T 0 0 155 267 Marca/Modelo                                                          \r\n";
			t += "T Gil08pt.cpf 0 155 282 <<MARCA>>                                         \r\n";
			t += "BOX 36 348 580 463 1                                                                \r\n";
			t += "T Gil08pt.cpf 0 146 319 IDENTIFICACAO DO PROPRIETARIO/ARRENDATARIO                  \r\n";
			t += "T 0 0 497 412 UF(CNH)                                                               \r\n";
			t += "T Gil08pt.cpf 0 509 428 <<UFCNH>>                                                          \r\n";
			t += "LINE 35 405 581 405 1                                                               \r\n";
			t += "T 0 0 43 355 Nome do Proprietario/Arrendatario                                      \r\n";
			t += "T Gil08pt.cpf 0 45 371 <<NOMEPROP>>                                      \r\n";
			t += "T 0 0 44 412 CPF/CNPJ                                                               \r\n";
			t += "T 0 0 176 411 Nº de Registro da CNH                                                 \r\n";
			t += "T Gil08pt.cpf 0 193 427 <<NUMCNH>>                                              \r\n";
			t += "BOX 36 492 580 626 1                                                                \r\n";
			t += "T Gil08pt.cpf 0 84 464 IDENTIFICACAO LOCAL/DATA/HORA DO COMETIMENTO DA INFRACAO     \r\n";
			t += "T 0 0 492 576 UF                                                                    \r\n";
			t += "T Gil08pt.cpf 0 491 591 <<UFLOCAL>>                                                          \r\n";
			t += "LINE 36 569 580 569 1                                                               \r\n";
			t += "T 0 0 44 499 Local da Infracao                                                      \r\n";
			t += "T 0 0 72 574 Data                                                                   \r\n";
			t += "T 0 0 268 575 Hora                                                                  \r\n";
			t += "T Gil08pt.cpf 0 482 534 <<BAIRRO>>                                                      \r\n";
			t += "T Gil08pt.cpf 0 264 592 <<HORAINFRACAO>>                                                       \r\n";
			t += "LINE 363 174 363 231 1                                                              \r\n";
			t += "T Gil08pt.cpf 0 197 143 IDENTIFICACAO DA AUTUACAO                                   \r\n";
			t += "IL 35 626 580 626 30                                                                \r\n";
			t += "LINE 436 260 436 317 1                                                              \r\n";
			t += "IL 36 143 581 143 30                                                                \r\n";
			t += "LINE 190 174 190 231 1                                                              \r\n";
			t += "LINE 110 261 110 318 1                                                              \r\n";
			t += "LINE 413 570 413 627 1                                                              \r\n";
			t += "IL 35 231 580 231 30                                                                \r\n";
			t += "LINE 148 261 148 318 1                                                              \r\n";
			t += "LINE 472 406 472 463 1                                                              \r\n";
			t += "IL 35 318 580 318 30                                                                \r\n";
			t += "LINE 162 406 162 463 1                                                              \r\n";
			t += "IL 36 462 581 462 30                                                                \r\n";
			t += "LINE 181 569 181 626 1                                                              \r\n";
			t += "T Gil08pt.cpf 0 46 428 <<CPF>>                                               \r\n";
			t += ";//{{BEGIN-BT                                                                       \r\n";
			t += "T Gil08pt.cpf 0 44 517 <<ENDERECO>>                                                     \r\n";
			t += "T Gil08pt.cpf 0 44 537 <<COMPLEMENTO>>                                                  \r\n";
			t += ";//{{END-BT                                                                         \r\n";
			t += "T Gil08pt.cpf 0 51 590 <<DATAINFRACAO>>                                                   \r\n";
			t += "BOX 35 793 581 895 1                                                                \r\n";
			t += "T 0 0 42 664 Descricao da Infracao                                                  \r\n";
			t += "T 0 0 225 872 Assinatura do condutor                                                \r\n";
			t += ";//{{BEGIN-BT                                                                       \r\n";
			t += "T Gil08pt.cpf 0 46 684 <<DESCINFRACAO>>             \r\n";
			t += "T Gil08pt.cpf 0 46 704 <<DESCINFRACAOCONT>>                                           \r\n";
			t += ";//{{END-BT                                                                         \r\n";
			t += "LINE 99 866 527 866 1                                                               \r\n";
			t += "T 0 0 40 743 Codigo da Infracao                                                     \r\n";
			t += "T Gil08pt.cpf 0 78 764 <<CODINFRACAO>>                                                        \r\n";
			t += "T 0 0 408 743 Pontuacao da Infracao                                                 \r\n";
			t += "T Gil08pt.cpf 0 469 762 <<PONTUCAO>>                                                          \r\n";
			t += "T 0 0 199 742 Artigo(CTB)                                                           \r\n";
			t += "T Gil08pt.cpf 0 197 761 <<ARTIGOCTB>>                                              \r\n";
			t += "LINE 188 736 188 793 1                                                              \r\n";
			t += "LINE 400 737 400 794 1                                                              \r\n";
			t += "BOX 35 656 581 794 1                                                                \r\n";
			t += "LINE 35 736 581 736 1                                                               \r\n";
			t += "PCX 40 5 !<logoG.pcx                                                                \r\n";
			t += "PRINT                                                                               \r\n";
	
	
			t = StringUtils.processaTexto(t, campos);
			return t;
		}catch(Exception e){
			throw new Exception("Falha na criação do formulario");
		}
	}
	public void setImpressora(RemoteDevice dispositivo) {
		this.addressDevice = dispositivo.getBluetoothAddress();
	}
	

}
