package br.com.consorciosdf.intranet.persistencia;

import br.com.consorciosdf.intranet.modelo.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ManterOSDAO {
	
	public final static int MAX_LINHAS = 10;

	private Conexao conexao;
	private Connection connection;
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	public boolean salvarOS(OS os) throws SQLException {
		PreparedStatement pstm = null;
		ResultSet rs;

		CheckEquipamento checkEquipamento;
		Equipamento equipamento;
		Usuario usuarioAutor;
		Usuario usuarioDest;
		int prioridade;

		checkEquipamento = os.getCheckEquipamento();
		equipamento = os.getEquipamento();
		usuarioAutor = os.getUsuarioAutor();

		if (os.getUsuarioDest() != null) {
			usuarioDest = os.getUsuarioDest();
		} else {
			usuarioDest = new Usuario();
			usuarioDest.setMatriculaUsuario("");
		}
		prioridade = os.getPrioridade();

		Date dtAnomalia = os.getDataAnomalia();
		String dataAnomalia = "0000-00-00 00:00:00";
		if (dtAnomalia != null) {
			dataAnomalia = dateFormat.format(dtAnomalia);
		}

		Date dtAbertura = os.getDataAbertura();
		String dataAbertura = dateFormat.format(dtAbertura);

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "";

			sql = "INSERT INTO os (tipo_os, id_equipamento, "
					+ "id_check, num_serie, num_upr, num_camera, num_flash, "
					+ "matricula_usuario_autor, matricula_usuario_dest, "
					+ "dsc_defeito, dt_anomalia,dt_abertura, prioridade) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			pstm = connection.prepareStatement(sql);
			pstm.setString(1, os.getTipoOS());
			pstm.setInt(2, equipamento.getIdEquipamento());
			pstm.setInt(3, checkEquipamento.getId());
			pstm.setInt(4, equipamento.getNumSerie());
			pstm.setInt(5, equipamento.getNumUPR());
			pstm.setInt(6, equipamento.getNumCamera());
			pstm.setString(7, equipamento.getNumFlash());
			pstm.setString(8, usuarioAutor.getMatriculaUsuario());
			pstm.setString(9, usuarioDest.getMatriculaUsuario());
			pstm.setString(10, os.getDescDefeito());
			pstm.setString(11, dataAnomalia);
			pstm.setString(12, dataAbertura);
			pstm.setInt(13, prioridade);

			pstm.execute();

			return true;
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.salvarOS): " + e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return false;
	}

	public boolean alterarOS(OS os) throws SQLException {
		PreparedStatement pstm = null;
		ResultSet rs;

		// CheckEquipamento checkEquipamento;
		Equipamento equipamento;
		Usuario usuarioAutor;
		Usuario usuarioDest;

		String idEquipamento = "";
		String matriculaAutor = "";
		String matriculaDest = "";
		String dataAnomalia = "";
		String dataAbertura = "";
		String dataServico = "";
		String dataFechamento = "";
		String status = "";
		String updateDatas = "";
		String fechamento = "";
		int prioridade = os.getPrioridade();

		// checkEquipamento = os.getCheckEquipamento();
		equipamento = os.getEquipamento();
		usuarioAutor = os.getUsuarioAutor();
		usuarioDest = os.getUsuarioDest();

		if (usuarioAutor != null) {
			matriculaAutor = usuarioAutor.getMatriculaUsuario();
		}
		if (os.getDescFechamento() != null) {
			fechamento = os.getDescFechamento();
		}
		if (usuarioDest != null) {
			matriculaDest = usuarioDest.getMatriculaUsuario();
		}

		if (os.getDataAnomalia() != null) {
			dataAnomalia = dateFormat.format(os.getDataAnomalia());
			updateDatas = ", dt_anomalia = '" + dataAnomalia + "'";
		}

		if (os.getDataAbertura() != null) {
			dataAbertura = dateFormat.format(os.getDataAbertura());
			updateDatas += ", dt_abertura = '" + dataAbertura + "'";
		}
		if (os.getDataServico() != null) {
			dataServico = dateFormat.format(os.getDataServico());
			updateDatas += ", dt_servico = '" + dataServico + "'";
		}
		if (os.getDataFechamento() != null) {
			dataFechamento = dateFormat.format(os.getDataFechamento());
			updateDatas += ", dt_fechamento = '" + dataFechamento + "'";
		}

		if (os.getStatus() != null) {
			status = os.getStatus();
		}

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "";

			sql = "UPDATE os SET " + "tipo_os = '" + os.getTipoOS() + "', "
					+ "id_equipamento = " + equipamento.getIdEquipamento()
					+ ", " + "num_serie = " + equipamento.getNumSerie() + ", "
					+ "num_upr = " + equipamento.getNumUPR() + ", "
					+ "num_camera = " + equipamento.getNumCamera() + ", "
					+ "num_flash = '" + equipamento.getNumFlash() + "', "
					+ "matricula_usuario_autor = '" + matriculaAutor + "', "
					+ "matricula_usuario_dest = '" + matriculaDest + "', "
					+ "dsc_defeito = '" + os.getDescDefeito() + "', "
					+ "dsc_observacao = '" + os.getDescObservacao() + "', "
					+ "dsc_reparo = '" + os.getDescReparo() + "', "
					+ "dsc_servico_executado = '"
					+ os.getDescServicoExecutado() + "',"
					+ "dsc_fechamento = '" + fechamento + "',"
					+ "prioridade = '" + prioridade + "'" + updateDatas
					+ ", status = '" + os.getStatus() + "' WHERE id = "
					+ os.getId();

			pstm = connection.prepareStatement(sql);

			pstm.execute();

			return true;
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.alterarOS): " + e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return false;
	}

	public boolean assumirOS(OS os) throws SQLException {
		PreparedStatement pstm = null;

		Usuario usuarioDest;
		usuarioDest = os.getUsuarioDest();
		String dataServico = "";
		String updateDatas = "";

		if (os.getDataServico() != null) {
			dataServico = dateFormat.format(os.getDataServico());
			updateDatas = ", dt_servico = '" + dataServico + "'";
		}
		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "UPDATE os SET " + "matricula_usuario_dest = '"
					+ usuarioDest.getMatriculaUsuario() + "' " + updateDatas
					+ ", status='" + os.getStatus() + "'" + "WHERE id = "
					+ os.getId();

			pstm = connection.prepareStatement(sql);
			pstm.execute();

			return true;
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.assumirOS): " + e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return false;
	}

	public boolean fecharOS(OS os) throws SQLException {
		PreparedStatement pstm = null;
		String fechamento = "";
		Date dtFechamento = os.getDataFechamento();
		String dataFechamento = dateFormat.format(dtFechamento);

		if (os.getDescFechamento() != null) {
			fechamento = os.getDescFechamento();
		}

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "UPDATE os SET " + "dsc_reparo = '"
					+ os.getDescReparo() + "', status='fc',"
					+ "dsc_servico_executado = '"
					+ os.getDescServicoExecutado() + "', "
					+ "dsc_fechamento = '" + fechamento + "', "
					+ "dt_fechamento = '" + dataFechamento + "' "
					+ "WHERE id = " + os.getId();

			pstm = connection.prepareStatement(sql);
			pstm.execute();

			return true;
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.fecharOS): " + e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return false;
	}

	public boolean incluirObsOS(OS os) throws SQLException {
		PreparedStatement pstm = null;
		ResultSet rs;
		String dataServico = "";
		String updateDatas = "";

		if (os.getDataServico() != null) {
			dataServico = dateFormat.format(os.getDataServico());
			updateDatas = ", dt_servico = '" + dataServico + "'";
		}
		SimpleDateFormat dateFormatTemp = new SimpleDateFormat(
				"HH:mm:ss dd-MM-yyyy");
		Date dataNowTemp = new Date();
		String dataTemp = dateFormatTemp.format(dataNowTemp);

		Usuario usuario = os.getUsuarioAutor();

		String observacao = "";

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sqlSelect = "";
			String sql = "";

			sqlSelect = "SELECT dsc_observacao FROM os " + "WHERE id = "
					+ os.getId();

			pstm = connection.prepareStatement(sqlSelect);
			rs = pstm.executeQuery();

			if (rs != null) {
				rs.last();
				observacao = rs.getString("dsc_observacao");
				if (observacao == null) {
					observacao = "";
				}
			}

			observacao += usuario.getNomeUsuario() + " "
					+ usuario.getSobrenomeUsuario() + " (" + dataTemp + ") - "
					+ os.getDescObservacao() + "\n";
			sql = "UPDATE os SET " + "dsc_observacao = '" + observacao + "' "
					+ updateDatas + "WHERE id = " + os.getId();

			pstm = connection.prepareStatement(sql);
			pstm.execute();

			return true;
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.incluirObsOS): " + e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return false;
	}

	public boolean incluirDefeitoOS(OS os) throws SQLException {
		PreparedStatement pstm = null;
		ResultSet rs;

		SimpleDateFormat dateFormatTemp = new SimpleDateFormat(
				"HH:mm:ss dd-MM-yyyy");
		Date dataNowTemp = new Date();
		String dataTemp = dateFormatTemp.format(dataNowTemp);

		Usuario usuario = os.getUsuarioAutor();

		String defeito = "";

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sqlSelect = "";
			String sql = "";

			sqlSelect = "SELECT dsc_defeito FROM os " + "WHERE id = "
					+ os.getId();

			pstm = connection.prepareStatement(sqlSelect);
			rs = pstm.executeQuery();

			if (rs != null) {
				rs.last();
				defeito = rs.getString("dsc_defeito");
				if (defeito == null) {
					defeito = "";
				}
			}

			defeito += "\n " + usuario.getNomeUsuario() + " "
					+ usuario.getSobrenomeUsuario() + " (" + dataTemp + ") - "
					+ os.getDescDefeito();
			sql = "UPDATE os SET " + "dsc_defeito = '" + defeito + "' "
					+ "WHERE id = " + os.getId();

			pstm = connection.prepareStatement(sql);
			pstm.execute();

			return true;
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.incluirObsOS): " + e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return false;
	}

	public boolean incluirMaterialUtilizadoOS(OS os) throws SQLException {
		PreparedStatement pstm = null;
		ResultSet rs;

		SimpleDateFormat dateFormatTemp = new SimpleDateFormat(
				"HH:mm:ss dd-MM-yyyy");
		Date dataNowTemp = new Date();
		String dataTemp = dateFormatTemp.format(dataNowTemp);
		Usuario usuario = os.getUsuarioAutor();
		String materialUtilizado = "";

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sqlSelect = "";
			String sql = "";

			sqlSelect = "SELECT dsc_reparo FROM os " + "WHERE id = "
					+ os.getId();

			pstm = connection.prepareStatement(sqlSelect);
			rs = pstm.executeQuery();

			if (rs != null) {
				rs.last();

				materialUtilizado = rs.getString("dsc_reparo");

				if (materialUtilizado == null) {
					materialUtilizado = "";
				}
			}

			materialUtilizado += usuario.getNomeUsuario() + " "
					+ usuario.getSobrenomeUsuario() + " (" + dataTemp + ") - "
					+ os.getDescReparo() + "\n";

			sql = "UPDATE os SET " + "dsc_reparo = '" + materialUtilizado
					+ "' " + "WHERE id = " + os.getId();

			pstm = connection.prepareStatement(sql);
			pstm.execute();

			return true;
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.incluirMaterialUtilizadoOS): "
					+ e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return false;
	}

	public boolean incluirServicoExecutadoOS(OS os) throws SQLException {
		PreparedStatement pstm = null;
		ResultSet rs;
		String dataServico = "";
		String updateDatas = "";

		if (os.getDataServico() != null) {
			dataServico = dateFormat.format(os.getDataServico());
			updateDatas = ", dt_servico = '" + dataServico + "'";
		}
		SimpleDateFormat dateFormatTemp = new SimpleDateFormat(
				"HH:mm:ss dd-MM-yyyy");
		Date dataNowTemp = new Date();
		String dataTemp = dateFormatTemp.format(dataNowTemp);
		Usuario usuario = os.getUsuarioAutor();
		String servicoExecutado = "";

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sqlSelect = "";
			String sql = "";

			sqlSelect = "SELECT dsc_servico_executado FROM os " + "WHERE id = "
					+ os.getId();

			pstm = connection.prepareStatement(sqlSelect);
			rs = pstm.executeQuery();

			if (rs != null) {
				rs.last();

				servicoExecutado = rs.getString("dsc_servico_executado");

				if (servicoExecutado == null) {
					servicoExecutado = "";
				}
			}

			servicoExecutado += usuario.getNomeUsuario() + " "
					+ usuario.getSobrenomeUsuario() + " (" + dataTemp + ") - "
					+ os.getDescServicoExecutado() + "\n";

			sql = "UPDATE os SET " + "dsc_servico_executado = '"
					+ servicoExecutado + "' " + ", status='" + os.getStatus()
					+ "'" + updateDatas + "WHERE id = " + os.getId();

			pstm = connection.prepareStatement(sql);
			pstm.execute();

			return true;
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.incluirServicoExecutadoOS): "
					+ e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return false;
	}

	public OS recuperarOS(int id) throws SQLException {
		PreparedStatement pstm = null;
		ResultSet rs;

		OS os = null;
		CheckEquipamento checkEquipamento = null;
		Equipamento equipamento = null;
		Usuario usuarioAutor = null;
		Usuario usuarioDest = null;

		// ManterUserControl userControl = null;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "SELECT os.id, os.tipo_os, os.id_check, os.id_equipamento, "
					+ "equip.nome as nome_equipamento, equip.end_logradouro, "
					+ "os.num_serie, os.num_upr, os.num_camera, os.num_flash, "
					+ "us_aut.nome as autor_nome, us_aut.sobrenome as autor_sobrenome, "
					+ "us_aut.matricula as autor_matricula, "
					+ "us_dest.nome as dest_nome, us_dest.sobrenome as dest_sobrenome, "
					+ "us_dest.matricula as dest_matricula, "
					+ "os.dsc_defeito, os.dsc_observacao, os.dsc_reparo, os.dsc_servico_executado, "
					+ "os.dt_anomalia, os.dt_abertura, os.dt_servico, os.dsc_fechamento ,os.dt_fechamento, os.status, os.prioridade "
					+ "FROM os os "
					+ "LEFT JOIN equipamentos equip "
					+ "ON os.id_equipamento = equip.id "
					+ "LEFT JOIN usuario us_aut "
					+ "ON os.matricula_usuario_autor = us_aut.matricula "
					+ "LEFT JOIN usuario us_dest "
					+ "ON os.matricula_usuario_dest = us_dest.matricula "
					+ "WHERE os.id = " + id;

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				rs.last();

				os = new OS();
				checkEquipamento = new CheckEquipamento();
				equipamento = new Equipamento();
				usuarioAutor = new Usuario();
				usuarioDest = new Usuario();

				// userControl = new ManterUserControl();

				String strDataAnomaliaTemp = "";
				Date dataAnomalia = null;
				String strDataFechamentoTemp = "";
				Date dataFechamento = null;
				String strDataServicoTemp = "";
				Date dataServico = null;

				checkEquipamento.setId(rs.getInt("id_check"));
				equipamento.setIdEquipamento(rs.getInt("id_equipamento"));
				equipamento
						.setNomeEquipamento(rs.getString("nome_equipamento"));
				equipamento.setEnderecoLogradouroEquipamento(rs
						.getString("end_logradouro"));
				equipamento.setNumSerie(rs.getInt("num_serie"));
				equipamento.setNumUPR(rs.getInt("num_upr"));
				equipamento.setNumCamera(rs.getInt("num_camera"));
				equipamento.setNumFlash(rs.getString("num_flash"));
				usuarioAutor.setMatriculaUsuario(rs
						.getString("autor_matricula"));
				usuarioAutor.setNomeUsuario(rs.getString("autor_nome"));
				usuarioAutor.setSobrenomeUsuario(rs
						.getString("autor_sobrenome"));
				usuarioDest.setMatriculaUsuario(rs.getString("dest_matricula"));
				usuarioDest.setNomeUsuario(rs.getString("dest_nome"));
				usuarioDest.setSobrenomeUsuario(rs.getString("dest_sobrenome"));
				strDataAnomaliaTemp = rs.getString("dt_anomalia");
				strDataFechamentoTemp = rs.getString("dt_fechamento");
				strDataServicoTemp = rs.getString("dt_servico");

				if (!strDataAnomaliaTemp.equals("0000-00-00 00:00:00")) {
					dataAnomalia = dateFormat
							.parse(rs.getString("dt_anomalia"));
				}

				if (!strDataFechamentoTemp.equals("0000-00-00 00:00:00")) {
					dataFechamento = dateFormat.parse(rs
							.getString("dt_fechamento"));
				}

				if (!strDataServicoTemp.equals("0000-00-00 00:00:00")) {
					dataServico = dateFormat.parse(rs.getString("dt_servico"));
				}
				os.setId(rs.getInt("id"));
				os.setTipoOS(rs.getString("tipo_os"));
				os.setCheckEquipamento(checkEquipamento);
				os.setEquipamento(equipamento);
				os.setUsuarioAutor(usuarioAutor);
				os.setUsuarioDest(usuarioDest);
				os.setDescDefeito(nl2br(rs.getString("dsc_defeito")));
				os.setDescObservacao(nl2br(rs.getString("dsc_observacao")));
				os.setDescReparo(nl2br(rs.getString("dsc_reparo")));
				os.setDescServicoExecutado(nl2br(rs
						.getString("dsc_servico_executado")));
				os.setDescFechamento(nl2br(rs.getString("dsc_fechamento")));
				os.setDataAnomalia(dataAnomalia);
				os.setDataAbertura(dateFormat
						.parse(rs.getString("dt_abertura")));
				os.setDataServico(dataServico);
				os.setDataFechamento(dataFechamento);
				os.setStatus(rs.getString("status"));
				os.setPrioridade(rs.getInt("prioridade"));

				return os;
			}

		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarOS): " + e.getMessage());
		} catch (ParseException pe) {
			System.out.println("Erro(OSDAO.recuperarOS): " + pe.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return os;
	}

	public String nl2br(String str) {
		String output = "";

		if (str != null) {
			String x = str;

			for (int i = 0; i < x.length(); i++) {
				if (x.codePointAt(i) == 10) {
					output += "<br>";
				} else {
					output += x.charAt(i);
				}
			}
		}

		return output;
	}

	public List recuperarOSs() throws SQLException {
		List list = null;

		PreparedStatement pstm = null;
		ResultSet rs;

		OS os;
		Equipamento equipamento;
		CheckEquipamento checkEquipamento;
		Usuario usuarioAutor;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "SELECT os.id, os.prioridade,os.tipo_os, os.id_check, equip.nome as nome_equipamento, "
					+ "us_aut.nome as autor_nome, us_aut.sobrenome as autor_sobrenome, os.dt_anomalia, "
					+ "os.dt_abertura, os.dt_servico ,os.dt_fechamento, os.status, os.dt_servico "
					+ "FROM os os, equipamentos equip, "
					+ "usuario us_aut "
					+ "WHERE os.id_equipamento = equip.id "
					+ "AND os.matricula_usuario_autor = us_aut.matricula "
					+ "ORDER BY dt_abertura DESC";

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {

				list = new ArrayList();

				while (rs.next()) {
					os = new OS();
					equipamento = new Equipamento();
					checkEquipamento = new CheckEquipamento();
					usuarioAutor = new Usuario();

					String strDataAnomaliaTemp = "";
					String strDataFechamentoTemp = "";
					String strDataServicoTemp = "";
					Date dataAnomalia = null;
					Date dataFechamento = null;
					Date dataServico = null;

					checkEquipamento.setId(rs.getInt("id_check"));
					equipamento.setNomeEquipamento(rs
							.getString("nome_equipamento"));
					usuarioAutor.setNomeUsuario(rs.getString("autor_nome"));
					usuarioAutor.setSobrenomeUsuario(rs
							.getString("autor_sobrenome"));
					strDataFechamentoTemp = rs.getString("dt_fechamento");
					strDataServicoTemp = rs.getString("dt_servico");
					strDataAnomaliaTemp = rs.getString("dt_anomalia");

					if (!strDataAnomaliaTemp.equals("0000-00-00 00:00:00")) {
						dataAnomalia = dateFormat.parse(rs
								.getString("dt_anomalia"));
					}

					if (!strDataFechamentoTemp.equals("0000-00-00 00:00:00")) {
						dataFechamento = dateFormat.parse(rs
								.getString("dt_fechamento"));
					}

					if (!strDataServicoTemp.equals("0000-00-00 00:00:00")) {
						dataServico = dateFormat.parse(rs
								.getString("dt_servico"));
					}
					os.setId(rs.getInt("id"));
					os.setTipoOS(rs.getString("tipo_os"));
					os.setCheckEquipamento(checkEquipamento);
					os.setEquipamento(equipamento);
					os.setUsuarioAutor(usuarioAutor);
					os.setDataAnomalia(dataAnomalia);
					os.setDataAbertura(dateFormat.parse(rs
							.getString("dt_abertura")));
					os.setDataFechamento(dataFechamento);
					os.setDataServico(dataServico);
					os.setStatus(rs.getString("status"));

					list.add(os);
				}

				return list;
			}
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarOS): " + e.getMessage());
		} catch (ParseException pe) {
			System.out.println("Erro(OSDAO.recuperarOS): " + pe.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return list;
	}

	public List recuperarOSsPag(int pageNumber, int pageLimit, String orderBy,
			String order) throws SQLException {
		List list = null;

		PreparedStatement pstm = null;
		ResultSet rs;

		OS os;
		Equipamento equipamento;
		CheckEquipamento checkEquipamento;
		Usuario usuarioAutor;
		Usuario usuarioDest;
		Paginacao paginacao;

		// ordenacao
		String ordenacao = " ORDER BY os.dt_abertura DESC";

		if (orderBy != null) {
			if (!orderBy.trim().equals("")) {
				if (orderBy.trim().equals("id")) {
					ordenacao = " ORDER BY os.id " + order;
				} else if (orderBy.trim().equals("equipamento")) {
					ordenacao = " ORDER BY equip.nome " + order;
				} else if (orderBy.trim().equals("tecnico")) {
					ordenacao = " ORDER BY us_aut.nome " + order;
				} else if (orderBy.trim().equals("data_abertura")) {
					ordenacao = " ORDER BY os.dt_abertura " + order;
				} else if (orderBy.trim().equals("status")) {
					ordenacao = " ORDER BY os.status, os.dt_abertura " + order;
				} else if (orderBy.trim().equals("prioridade")) {
					ordenacao = " ORDER BY os.prioridade " + order;
				} else if (orderBy.trim().equals("data_servico")) {
					ordenacao = " ORDER BY os.dt_servico " + order;
				}
			}
		}

		// paginacao
		int pageInit = 0;
		int resultSize = 0;
		int pageNavigator = 0;
		int pageLeft = 0;

		pageInit = pageNumber * pageLimit;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "SELECT os.id,os.prioridade,os.tipo_os, os.id_check, equip.nome as nome_equipamento, "
					+ "us_aut.nome as autor_nome, us_aut.sobrenome as autor_sobrenome, "
					+ "us_dest.nome as tecnico_nome, us_dest.sobrenome as tecnico_sobrenome, "
					+ "os.dt_anomalia, os.dt_abertura, os.dt_servico, os.dt_fechamento, os.status "
					+ "FROM os os "
					+ "LEFT JOIN equipamentos equip "
					+ "ON os.id_equipamento = equip.id "
					+ "LEFT JOIN usuario us_aut "
					+ "ON os.matricula_usuario_autor = us_aut.matricula "
					+ "LEFT JOIN usuario us_dest "
					+ "ON os.matricula_usuario_dest = us_dest.matricula"
					+ ordenacao;

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				rs.last();
				resultSize = rs.getRow();
				rs.beforeFirst();

				if (resultSize > pageLimit) {
					sql += " LIMIT " + pageInit + ", " + pageLimit;
					pageNavigator = resultSize / pageLimit;
					pageLeft = resultSize % pageLimit;

					if (pageLeft > 0) {
						pageNavigator++;
					}

					pstm = connection.prepareStatement(sql);
					rs = pstm.executeQuery();
				} else {
					pageNavigator = 1;
				}

				list = new ArrayList();

				while (rs.next()) {
					os = new OS();
					equipamento = new Equipamento();
					checkEquipamento = new CheckEquipamento();
					usuarioAutor = new Usuario();
					usuarioDest = new Usuario();
					paginacao = new Paginacao();

					paginacao.setPageInit(pageInit);
					paginacao.setPageLeft(pageLeft);
					paginacao.setPageLimit(pageLimit);
					paginacao.setPageNavigator(pageNavigator);
					paginacao.setPageNumber(pageNumber);
					paginacao.setResultSize(resultSize);

					String strDataAnomaliaTemp = "";
					Date dataAnomalia = null;
					String strDataFechamentoTemp = "";
					Date dataFechamento = null;
					String strDataServicoTemp = "";
					Date dataServico = null;

					checkEquipamento.setId(rs.getInt("id_check"));
					equipamento.setNomeEquipamento(rs
							.getString("nome_equipamento"));
					usuarioAutor.setNomeUsuario(rs.getString("autor_nome"));
					usuarioAutor.setSobrenomeUsuario(rs
							.getString("autor_sobrenome"));
					usuarioDest.setNomeUsuario(rs.getString("tecnico_nome"));
					usuarioDest.setSobrenomeUsuario(rs
							.getString("tecnico_sobrenome"));
					strDataAnomaliaTemp = rs.getString("dt_anomalia");
					strDataFechamentoTemp = rs.getString("dt_fechamento");
					strDataServicoTemp = rs.getString("dt_servico");

					if (!strDataAnomaliaTemp.equals("0000-00-00 00:00:00")) {
						dataAnomalia = dateFormat.parse(rs
								.getString("dt_anomalia"));
					}
					if (!strDataFechamentoTemp.equals("0000-00-00 00:00:00")) {
						dataFechamento = dateFormat.parse(rs
								.getString("dt_fechamento"));
					}
					if (!strDataServicoTemp.equals("0000-00-00 00:00:00")) {
						dataServico = dateFormat.parse(rs
								.getString("dt_servico"));
					}
					os.setId(rs.getInt("id"));
					os.setTipoOS(rs.getString("tipo_os"));
					os.setCheckEquipamento(checkEquipamento);
					os.setEquipamento(equipamento);
					os.setUsuarioAutor(usuarioAutor);
					os.setUsuarioDest(usuarioDest);
					os.setDataAnomalia(dataAnomalia);
					os.setDataAbertura(dateFormat.parse(rs
							.getString("dt_abertura")));
					os.setDataFechamento(dataFechamento);
					os.setDataServico(dataServico);
					os.setStatus(rs.getString("status"));
					os.setPrioridade(rs.getInt("prioridade"));

					os.setPaginacao(paginacao);

					list.add(os);
				}

				return list;
			}
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarOS): " + e.getMessage());
		} catch (ParseException pe) {
			System.out.println("Erro(OSDAO.recuperarOS): " + pe.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return list;
	}

	public List recuperarOSsPagFiltro(int idOS, String status,
			String prioridade, String tipoOS, int idEquipamento,
			String tecnico, String dataAnomalia, String dataInicial,
			String dataServico, String dataFinal, int pageNumber,
			int pageLimit, String orderBy, String order) throws SQLException {
		List list = null;

		PreparedStatement pstm = null;
		ResultSet rs;

		OS os;
		Equipamento equipamento;
		CheckEquipamento checkEquipamento;
		Usuario usuarioAutor;
		Usuario usuarioDest;
		Paginacao paginacao;

		// ordenacao
		String ordenacao = " ORDER BY os.dt_abertura DESC";

		if (orderBy != null) {
			if (!orderBy.trim().equals("")) {
				if (orderBy.trim().equals("id")) {
					ordenacao = " ORDER BY os.id " + order;
				} else if (orderBy.trim().equals("tipoOS")) {
					ordenacao = " ORDER BY os.tipo_os " + order;
				} else if (orderBy.trim().equals("equipamento")) {
					ordenacao = " ORDER BY equip.nome " + order;
				} else if (orderBy.trim().equals("autor")) {
					ordenacao = " ORDER BY us_aut.nome " + order;
				} else if (orderBy.trim().equals("tecnico")) {
					ordenacao = " ORDER BY us_dest.nome " + order;
				} else if (orderBy.trim().equals("data_abertura")) {
					ordenacao = " ORDER BY os.dt_abertura " + order;
				} else if (orderBy.trim().equals("status")) {
					ordenacao = " ORDER BY os.status, os.dt_abertura " + order;
				} else if (orderBy.trim().equals("prioridade")) {
					ordenacao = " ORDER BY os.prioridade " + order;
				} else if (orderBy.trim().equals("data_servico")) {
					ordenacao = " ORDER BY os.dt_servico " + order;
				}
			}
		}

		// filtro
		String filtro = "";

		if (idOS != 0) {
			if (filtro.trim().equals("")) {
				filtro += " WHERE os.id = " + idOS;
			} else {
				filtro += " AND os.id = " + idOS;
			}

		}

		if (tipoOS != null) {
			if (filtro.trim().equals("")) {
				filtro += " WHERE os.tipo_os = '" + tipoOS + "'";
			} else {
				filtro += " AND os.tipo_os = '" + tipoOS + "'";
			}

		}

		if (idEquipamento != 0) {
			if (filtro.trim().equals("")) {
				filtro += " WHERE equip.id = " + idEquipamento;
			} else {
				filtro += " AND equip.id = " + idEquipamento;
			}

		}

		if (tecnico != null) {
			if (!tecnico.trim().equals("")) {
				if (filtro.trim().equals("")) {
					filtro += " WHERE us_dest.matricula = " + tecnico;
				} else {
					filtro += " AND us_dest.matricula = " + tecnico;
				}
			}
		}

		if (dataAnomalia != null) {
			if (dataFinal != null) {
				if (!dataAnomalia.trim().equals("")
						&& !dataFinal.trim().equals("")) {
					if (filtro.trim().equals("")) {
						filtro += " WHERE DATE(os.dt_anomalia) >= DATE('"
								+ dataAnomalia + "')";
						filtro += " AND DATE(os.dt_fechamento) <= DATE('"
								+ dataFinal + "')";
					} else {
						filtro += " AND DATE(os.dt_anomalia) >= DATE('"
								+ dataAnomalia + "')";
						filtro += " AND DATE(os.dt_fechamento) <= DATE('"
								+ dataFinal + "')";
					}
				}
			} else if (dataServico != null) {
				if (!dataAnomalia.trim().equals("")
						&& !dataServico.trim().equals("")) {
					if (filtro.trim().equals("")) {
						filtro += " WHERE DATE(os.dt_anomalia) >= DATE('"
								+ dataAnomalia + "')";
						filtro += " AND DATE(os.dt_servico) <= DATE('"
								+ dataServico + "')";
					} else {
						filtro += " AND DATE(os.dt_anomalia) >= DATE('"
								+ dataAnomalia + "')";
						filtro += " AND DATE(os.dt_servico) <= DATE('"
								+ dataServico + "')";
					}
				}
			} else if (dataInicial != null) {
				if (!dataAnomalia.trim().equals("")
						&& !dataInicial.trim().equals("")) {
					if (filtro.trim().equals("")) {
						filtro += " WHERE DATE(os.dt_anomalia) >= DATE('"
								+ dataAnomalia + "')";
						filtro += " AND DATE(os.dt_abertura) <= DATE('"
								+ dataInicial + "')";
					} else {
						filtro += " AND DATE(os.dt_anomalia) >= DATE('"
								+ dataAnomalia + "')";
						filtro += " AND DATE(os.dt_abertura) <= DATE('"
								+ dataInicial + "')";
					}
				}
			} else {
				if (filtro.trim().equals("")) {
					filtro += " WHERE DATE(os.dt_anomalia) = DATE('"
							+ dataAnomalia + "')";
				} else {
					filtro += " AND DATE(os.dt_anomalia) = DATE('"
							+ dataAnomalia + "')";
				}
			}
		} else if (dataInicial != null) {
			if (dataServico != null) {
				if (!dataInicial.trim().equals("")
						&& !dataServico.trim().equals("")) {
					if (filtro.trim().equals("")) {
						filtro += " WHERE DATE(os.dt_abertura) >= DATE('"
								+ dataInicial + "')";
						filtro += " AND DATE(os.dt_servico) <= DATE('"
								+ dataServico + "')";
					} else {
						filtro += " AND DATE(os.dt_abertura) >= DATE('"
								+ dataInicial + "')";
						filtro += " AND DATE(os.dt_servico) <= DATE('"
								+ dataServico + "')";
					}
				}
			} else if (dataFinal != null) {
				if (!dataInicial.trim().equals("")
						&& !dataFinal.trim().equals("")) {
					if (filtro.trim().equals("")) {
						filtro += " WHERE DATE(os.dt_abertura) >= DATE('"
								+ dataInicial + "')";
						filtro += " AND DATE(os.dt_fechamento) <= DATE('"
								+ dataFinal + "')";
					} else {
						filtro += " AND DATE(os.dt_abertura) >= DATE('"
								+ dataInicial + "')";
						filtro += " AND DATE(os.dt_fechamento) <= DATE('"
								+ dataFinal + "')";
					}
				}
			} else {
				if (filtro.trim().equals("")) {
					filtro += " WHERE DATE(os.dt_abertura) = DATE('"
							+ dataInicial + "')";
				} else {
					filtro += " AND DATE(os.dt_abertura) = DATE('"
							+ dataInicial + "')";
				}
			}

		} else if (dataServico != null) {
			if (dataFinal != null) {
				if (!dataServico.trim().equals("")
						&& !dataFinal.trim().equals("")) {
					if (filtro.trim().equals("")) {
						filtro += " WHERE DATE(os.dt_servico) >= DATE('"
								+ dataServico + "')";
						filtro += " AND DATE(os.dt_fechamento) <= DATE('"
								+ dataFinal + "')";
					} else {
						filtro += " AND DATE(os.dt_servico) >= DATE('"
								+ dataServico + "')";
						filtro += " AND DATE(os.dt_fechamento) <= DATE('"
								+ dataFinal + "')";
					}
				}
			} else {
				if (filtro.trim().equals("")) {
					filtro += " WHERE DATE(os.dt_servico) = DATE('"
							+ dataServico + "')";
				} else {
					filtro += " AND DATE(os.dt_abertura) = DATE('"
							+ dataServico + "')";
				}
			}
		} else if (dataFinal != null) {
			if (filtro.trim().equals("")) {
				filtro += " WHERE DATE(os.dt_fechamento) = DATE('" + dataFinal
						+ "')";
			} else {
				filtro += " AND DATE(os.dt_fechamento) = DATE('" + dataFinal
						+ "')";
			}
		}

		/*
		 * if (dataAnomalia != null && dataFinal != null) { if
		 * (!dataAnomalia.trim().equals("") && !dataFinal.trim().equals("")) {
		 * if (filtro.trim().equals("")) { filtro +=
		 * " WHERE DATE(os.dt_anomalia) <= DATE('" + dataAnomalia + "')"; filtro
		 * += " AND DATE(os.dt_fechamento) >= DATE('" + dataFinal + "')"; } else
		 * { filtro += " AND DATE(os.dt_anomalia) = DATE('" + dataAnomalia +
		 * "')"; filtro += " AND DATE(os.dt_fechamento) >= DATE('" + dataFinal +
		 * "')"; } } } else if (dataAnomalia != null && dataInicial != null) {
		 * if (!dataAnomalia.trim().equals("") &&
		 * !dataInicial.trim().equals("")) { if (filtro.trim().equals("")) {
		 * filtro += " WHERE DATE(os.dt_anomalia) <= DATE('" + dataAnomalia +
		 * "')"; filtro += " AND DATE(os.dt_abertura) >= DATE('" + dataInicial +
		 * "')"; } else { filtro += " AND DATE(os.dt_anomalia) = DATE('" +
		 * dataAnomalia + "')"; filtro += " AND DATE(os.dt_abertura) >= DATE('"
		 * + dataInicial + "')"; } } }
		 * 
		 * if (dataInicial != null && dataFinal != null) { if
		 * (!dataInicial.trim().equals("") && !dataFinal.trim().equals("")) { if
		 * (filtro.trim().equals("")) { filtro +=
		 * " WHERE DATE(os.dt_abertura) <= DATE('" + dataInicial + "')"; filtro
		 * += " AND DATE(os.dt_fechamento) >= DATE('" + dataFinal + "')"; } else
		 * { filtro += " AND DATE(os.dt_abertura) = DATE('" + dataInicial +
		 * "')"; filtro += " AND DATE(os.dt_fechamento) >= DATE('" + dataFinal +
		 * "')"; } } }
		 * 
		 * if (dataInicial != null && dataFinal == null) { if
		 * (!dataInicial.trim().equals("")) { if (filtro.trim().equals("")) {
		 * filtro += " WHERE DATE(os.dt_abertura) = DATE('" + dataInicial +
		 * "')"; } else { filtro += " AND DATE(os.dt_abertura) = DATE('" +
		 * dataInicial + "')"; } } }
		 * 
		 * if (dataInicial == null && dataFinal != null) { if
		 * (!dataFinal.trim().equals("")) { if (filtro.trim().equals("")) {
		 * filtro += " WHERE DATE(os.dt_fechamento) = DATE('" + dataFinal +
		 * "')"; } else { filtro += " AND DATE(os.dt_fechamento) = DATE('" +
		 * dataFinal + "')"; } } }
		 */

		if (status != null) {
			if (filtro.trim().equals("")) {
				filtro += " WHERE os.status = '" + status + "'";
			} else {
				filtro += " AND os.status = '" + status + "'";
			}
		}

		if (prioridade != null) {
			if (filtro.trim().equals("")) {
				filtro += " WHERE os.prioridade = " + prioridade;
			} else {
				filtro += " AND os.prioridade = " + prioridade;
			}
		}

		// paginacao
		int pageInit = 0;
		int resultSize = 0;
		int pageNavigator = 0;
		int pageLeft = 0;

		pageInit = pageNumber * pageLimit;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "SELECT os.id, os.tipo_os, os.prioridade, os.id_check, equip.nome as nome_equipamento, "
					+ "us_aut.nome as autor_nome, us_aut.sobrenome as autor_sobrenome, "
					+ "us_dest.nome as tecnico_nome, us_dest.sobrenome as tecnico_sobrenome, "
					+ "os.dt_anomalia, os.dt_abertura, os.dt_servico, os.dt_fechamento, os.status "
					+ "FROM os os "
					+ "LEFT JOIN usuario us_aut "
					+ "ON os.matricula_usuario_autor = us_aut.matricula "
					+ "LEFT JOIN usuario us_dest "
					+ "ON os.matricula_usuario_dest = us_dest.matricula "
					+ "LEFT JOIN equipamentos equip "
					+ "ON os.id_equipamento = equip.id" + filtro + ordenacao;

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				rs.last();
				resultSize = rs.getRow();
				rs.beforeFirst();

				if (resultSize > pageLimit) {
					sql += " LIMIT " + pageInit + ", " + pageLimit;
					pageNavigator = resultSize / pageLimit;
					pageLeft = resultSize % pageLimit;

					if (pageLeft > 0) {
						pageNavigator++;
					}

					pstm = connection.prepareStatement(sql);
					rs = pstm.executeQuery();
				} else {
					pageNavigator = 1;
				}

				list = new ArrayList();

				while (rs.next()) {
					os = new OS();
					equipamento = new Equipamento();
					checkEquipamento = new CheckEquipamento();
					usuarioAutor = new Usuario();
					usuarioDest = new Usuario();
					paginacao = new Paginacao();

					paginacao.setPageInit(pageInit);
					paginacao.setPageLeft(pageLeft);
					paginacao.setPageLimit(pageLimit);
					paginacao.setPageNavigator(pageNavigator);
					paginacao.setPageNumber(pageNumber);
					paginacao.setResultSize(resultSize);

					String strDataAnomaliaTemp = "";
					Date dateAnomalia = null;
					String strDataFechamentoTemp = "";
					Date dataFechamento = null;
					String strDataServicoTemp = "";
					Date dateServico = null;

					checkEquipamento.setId(rs.getInt("id_check"));
					equipamento.setNomeEquipamento(rs
							.getString("nome_equipamento"));
					usuarioAutor.setNomeUsuario(rs.getString("autor_nome"));
					usuarioAutor.setSobrenomeUsuario(rs
							.getString("autor_sobrenome"));
					usuarioDest.setNomeUsuario(rs.getString("tecnico_nome"));
					usuarioDest.setSobrenomeUsuario(rs
							.getString("tecnico_sobrenome"));
					strDataAnomaliaTemp = rs.getString("dt_anomalia");
					strDataFechamentoTemp = rs.getString("dt_fechamento");
					strDataServicoTemp = rs.getString("dt_servico");

					if (!strDataAnomaliaTemp.equals("0000-00-00 00:00:00")) {
						dateAnomalia = dateFormat.parse(rs
								.getString("dt_anomalia"));
					}

					if (!strDataFechamentoTemp.equals("0000-00-00 00:00:00")) {
						dataFechamento = dateFormat.parse(rs
								.getString("dt_fechamento"));
					}

					if (!strDataServicoTemp.equals("0000-00-00 00:00:00")) {
						dateServico = dateFormat.parse(rs
								.getString("dt_servico"));
					}

					os.setId(rs.getInt("id"));
					os.setTipoOS(rs.getString("tipo_os"));
					os.setCheckEquipamento(checkEquipamento);
					os.setEquipamento(equipamento);
					os.setUsuarioAutor(usuarioAutor);
					os.setUsuarioDest(usuarioDest);
					os.setDataAnomalia(dateAnomalia);
					os.setDataAbertura(dateFormat.parse(rs
							.getString("dt_abertura")));
					os.setDataServico(dateServico);
					os.setDataFechamento(dataFechamento);
					os.setStatus(rs.getString("status"));
					os.setPrioridade(rs.getInt("prioridade"));

					os.setPaginacao(paginacao);

					list.add(os);
				}

				return list;
			}
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarOS): " + e.getMessage());
		} catch (ParseException pe) {
			System.out.println("Erro(OSDAO.recuperarOS): " + pe.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return list;
	}

	public int recuperarTotalOSAbertas(boolean atrasada) throws SQLException {
		Date dataNow = new Date();

		return 0;
	}

	public Equipamento recuperarEquipamento(int id) throws SQLException {
		Equipamento equipamento = null;

		return equipamento;
	}

	public List recuperarEquipamentos() throws SQLException {
		List list = null;

		PreparedStatement pstm = null;
		Equipamento equipamento;
		ResultSet rs;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "SELECT * FROM equipamentos "
					+ "ORDER BY nome ASC"; // +
			// "WHERE ativo = 'y'";

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				list = new ArrayList();

				while (rs.next()) {
					equipamento = new Equipamento();
					equipamento.setIdEquipamento(rs.getInt("id"));
					equipamento.setNomeEquipamento(rs.getString("nome"));
					equipamento.setDescricaoEquipamento(rs
							.getString("descricao"));
					equipamento.setEnderecoLogradouroEquipamento(rs
							.getString("end_logradouro"));
					equipamento.setEnderecoCidadeEquipamento(rs
							.getString("end_cidade"));
					equipamento.setEnderecoEstadoEquipamento(rs
							.getString("end_estado"));

					list.add(equipamento);
				}
				return list;
			}
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarEquipamentos): "
					+ e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return list;
	}

	public Andamento recuperarAndamento(int id) throws SQLException {
		Andamento andamento = null;

		return andamento;
	}

	public List recuperarAndamentos() throws SQLException {
		List list = null;

		PreparedStatement pstm = null;
		ResultSet rs;

		Andamento andamento;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "SELECT * FROM os_andamentos " + "WHERE ativo = 'y'";

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				list = new ArrayList();

				while (rs.next()) {
					andamento = new Andamento();
					list.add(andamento);
				}

				return list;
			}
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarAndamentos): "
					+ e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return list;
	}

	public List recuperarAndamentosOS(int idOS) {
		List list = null;

		PreparedStatement pstm = null;
		ResultSet rs;

		Andamento andamento;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			// modificar SQL
			String sql = "SELECT * FROM os_andamentos " + "WHERE ativo = 'y'";

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				list = new ArrayList();

				while (rs.next()) {
					andamento = new Andamento();
					list.add(andamento);
				}

				return list;
			}
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarAndamentosOS): "
					+ e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return list;
	}

	public Defeito recuperarDefeito(int id) throws SQLException {
		Defeito defeito = null;

		return defeito;
	}

	public List recuperarDefeitos() throws SQLException {
		List list = null;

		PreparedStatement pstm = null;
		ResultSet rs;

		Defeito defeito;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "SELECT * FROM os_defeitos " + "WHERE ativo = 'y'";

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				list = new ArrayList();

				while (rs.next()) {
					defeito = new Defeito();
					list.add(defeito);
				}

				return list;
			}
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarDefeitos): "
					+ e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return list;
	}

	public List recuperarDefeitosOS(int idOS) throws SQLException {
		List list = null;

		PreparedStatement pstm = null;
		ResultSet rs;

		Defeito defeito;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			// modificar SQL
			String sql = "SELECT * FROM os_defeitos " + "WHERE ativo = 'y'";

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				list = new ArrayList();

				while (rs.next()) {
					defeito = new Defeito();
					list.add(defeito);
				}

				return list;
			}
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarDefeitos): "
					+ e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return list;
	}

	public Reparo recuperarReparo(int id) throws SQLException {
		Reparo reparo = null;

		return reparo;
	}

	public List recuperarReparos() throws SQLException {
		List list = null;

		PreparedStatement pstm = null;
		ResultSet rs;

		Reparo reparo;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "SELECT * FROM os_reparos " + "WHERE ativo = 'y'";

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				list = new ArrayList();

				while (rs.next()) {
					reparo = new Reparo();
					list.add(reparo);
				}

				return list;
			}
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarReparos): "
					+ e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return list;
	}

	public List recuperarReparosOS(int idOS) throws SQLException {
		List list = null;

		PreparedStatement pstm = null;
		ResultSet rs;

		Reparo reparo;

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			// modificar SQL
			String sql = "SELECT * FROM os_reparos " + "WHERE ativo = 'y'";

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				list = new ArrayList();

				while (rs.next()) {
					reparo = new Reparo();
					list.add(reparo);
				}

				return list;
			}
		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarReparos): "
					+ e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return list;
	}

	public int recuperarQuantidadeOS(int tipo, String tipoOs, int mes, int ano)
			throws SQLException {
		PreparedStatement pstm = null;
		ResultSet rs;

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Calendar dataNow = Calendar.getInstance();
		int mesNow = dataNow.get(Calendar.MONTH) + 1;
		int anoNow = dataNow.get(Calendar.YEAR);

		Date dataVerifyNow = new Date();
		long dataTimeNow = dataVerifyNow.getTime();
		long dataVerificador = 3 * 24 * 60 * 60 * 1000; // tres dias
		long dataVerifyStatus = dataTimeNow - dataVerificador;
		Date dataVerify = new Date(dataVerifyStatus);

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		try {
			String sql = "";

			if (tipo == 0) {
				sql = "SELECT COUNT(*) as qtd FROM os "
						+ "WHERE MONTH(dt_abertura) = " + mes + " "
						+ "AND YEAR(dt_abertura) = " + ano + " "
						+ "AND tipo_os = '" + tipoOs + "'";
			} else if (tipo == 1) {
				if (mes == mesNow && ano == anoNow) {
					sql = "SELECT COUNT(*) as qtd FROM os "
							+ "WHERE DATE(dt_abertura) < DATE('"
							+ dateFormat.format(dataVerify) + "') "
							+ "AND MONTH(dt_abertura) = " + mes + " "
							+ "AND YEAR(dt_abertura) = " + ano + " "
							+ "AND dt_fechamento = '0000-00-00 00:00:00' "
							+ "AND tipo_os = '" + tipoOs + "'";
				} else {
					sql = "SELECT COUNT(*) as qtd FROM os "
							+ "WHERE MONTH(dt_abertura) = " + mes + " "
							+ "AND YEAR(dt_abertura) = " + ano + " "
							+ "AND dt_fechamento = '0000-00-00 00:00:00' "
							+ "AND tipo_os = '" + tipoOs + "'";
				}

			} else if (tipo == 2) {
				sql = "SELECT COUNT(*) as qtd FROM os "
						+ "WHERE MONTH(dt_fechamento) = " + mes + " "
						+ "AND YEAR(dt_fechamento) = " + ano + " "
						+ "AND tipo_os = '" + tipoOs + "'";
			}

			pstm = connection.prepareStatement(sql);
			rs = pstm.executeQuery();

			if (rs != null) {
				rs.last();

				return rs.getInt("qtd");
			}

		} catch (SQLException e) {
			System.out.println("Erro(OSDAO.recuperarQuantidadeOS): "
					+ e.getMessage());
		} finally {
			try {
				if (pstm != null) {
					pstm.close();
				}
				if (connection != null) {
					conexao.fechaConexao(connection);
					conexao = null;
					connection = null;
				}
			} catch (SQLException e) {
				System.out.println("Erro: " + e.getMessage());
			}
		}

		return 0;
	}

	public List<OS> recuperarOSMobile(Usuario usuario, int pageStart)
			throws SQLException, ParseException {
		List<OS> lista = null;
		PreparedStatement stm = null;
		ResultSet rs = null;
		OS os = null;
		Equipamento equipamento = null;
		CheckEquipamento checkEquipamento = null;
		Usuario usuarioAutor;
		Usuario usuarioDest;
		
		pageStart = (pageStart * 10) - 10;
		
		String filtro = "";

		String sql = "SELECT os.id,os.prioridade,os.tipo_os, os.id_check, equip.nome as nome_equipamento,"
				+ " us_aut.nome as autor_nome, us_aut.sobrenome as autor_sobrenome,"
				+ " us_dest.nome as tecnico_nome, us_dest.sobrenome as tecnico_sobrenome,"
				+ " os.dt_anomalia, os.dt_abertura, os.dt_servico, os.dt_fechamento, os.status"
				+ " FROM os os"
				+ " LEFT JOIN equipamentos equip"
				+ " ON os.id_equipamento = equip.id"
				+ " LEFT JOIN usuario us_aut"
				+ " ON os.matricula_usuario_autor = us_aut.matricula"
				+ " LEFT JOIN usuario us_dest"
				+ " ON os.matricula_usuario_dest = us_dest.matricula "
				+ "where os.matricula_usuario_dest = "
				+ usuario.getMatriculaUsuario()
				+ " order by os.dt_abertura desc limit "
				+ pageStart
				+ ","
				+ ManterOSDAO.MAX_LINHAS;
		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		stm = connection.prepareStatement(sql);
		rs = stm.executeQuery();

		lista = new ArrayList<OS>();

		while (rs.next()) {
			os = new OS();
			equipamento = new Equipamento();
			checkEquipamento = new CheckEquipamento();
			usuarioAutor = new Usuario();
			usuarioDest = new Usuario();

			String strDataAnomaliaTemp = "";
			Date dataAnomalia = null;
			String strDataFechamentoTemp = "";
			Date dataFechamento = null;
			String strDataServicoTemp = "";
			Date dataServico = null;

			checkEquipamento.setId(rs.getInt("id_check"));
			equipamento.setNomeEquipamento(rs.getString("nome_equipamento"));
			usuarioAutor.setNomeUsuario(rs.getString("autor_nome"));
			usuarioAutor.setSobrenomeUsuario(rs.getString("autor_sobrenome"));
			usuarioDest.setNomeUsuario(rs.getString("tecnico_nome"));
			usuarioDest.setSobrenomeUsuario(rs.getString("tecnico_sobrenome"));
			strDataAnomaliaTemp = rs.getString("dt_anomalia");
			strDataFechamentoTemp = rs.getString("dt_fechamento");
			strDataServicoTemp = rs.getString("dt_servico");

			if (!strDataAnomaliaTemp.equals("0000-00-00 00:00:00")) {
				dataAnomalia = dateFormat.parse(rs.getString("dt_anomalia"));
			}
			if (!strDataFechamentoTemp.equals("0000-00-00 00:00:00")) {
				dataFechamento = dateFormat
						.parse(rs.getString("dt_fechamento"));
			}
			if (!strDataServicoTemp.equals("0000-00-00 00:00:00")) {
				dataServico = dateFormat.parse(rs.getString("dt_servico"));
			}
			os.setId(rs.getInt("id"));
			os.setTipoOS(rs.getString("tipo_os"));
			os.setCheckEquipamento(checkEquipamento);
			os.setEquipamento(equipamento);
			os.setUsuarioAutor(usuarioAutor);
			os.setUsuarioDest(usuarioDest);
			os.setDataAnomalia(dataAnomalia);
			os.setDataAbertura(dateFormat.parse(rs.getString("dt_abertura")));
			os.setDataFechamento(dataFechamento);
			os.setDataServico(dataServico);
			os.setStatus(rs.getString("status"));
			os.setPrioridade(rs.getInt("prioridade"));

			lista.add(os);
		}

		try {
			if (stm != null) {
				stm.close();
			}
			if (connection != null) {
				conexao.fechaConexao(connection);
				conexao = null;
				connection = null;
			}
		} catch (SQLException e) {
			System.out.println("Erro: " + e.getMessage());
		}

		return lista;

	}

	public int recuperarQtdOSMobile(Usuario usuario) throws SQLException {

		int qtd = 0;
		Statement stm;
		ResultSet rs;
		String sql = "SELECT COUNT(*) from os where os.matricula_usuario_dest = "
				+ usuario.getMatriculaUsuario();

		if (conexao == null || connection == null) {
			conexao = new Conexao();
			connection = conexao.abreConexao();
		}

		stm = connection.createStatement();
		rs = stm.executeQuery(sql);

		while (rs.next()) {
			qtd = rs.getInt("COUNT(*)");
		}

		try {
			if (stm != null) {
				stm.close();
			}
			if (connection != null) {
				conexao.fechaConexao(connection);
				conexao = null;
				connection = null;
			}
		} catch (SQLException e) {
			System.out.println("Erro: " + e.getMessage());
		}
		return qtd;	
		
	}
}