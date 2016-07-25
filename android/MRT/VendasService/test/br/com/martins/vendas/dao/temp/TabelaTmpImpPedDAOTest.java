package br.com.martins.vendas.dao.temp;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import br.com.martins.vendas.dao.ItemDisponivelDAO;
import br.com.martins.vendas.services.calculodepreco.Item;
import br.com.martins.vendas.util.ConfigUtils;

public class TabelaTmpImpPedDAOTest {

	@BeforeClass
	public static void setUpBeforeClass() {
		ConfigUtils.config();
	}

	@Before
	public void setUp() {
		List<Item> listaItem = ItemDisponivelDAO.listaTodosItensDisponiveis();
		serializaListaItem(listaItem);
		serializaItem(listaItem.get(0));

		for (Item item : listaItem) {
			TabelaTmpImpPedDAO.insereItem(item);
		}
	}

	@After
	public void tearDown() {
		TabelaTmpImpPedDAO.limpaTabela();
	}

	@Test
	public void testObtemItem() {
		// Obtem objeto Item serializado em disco.
		Item item = desserializaItem();
		assertNotNull(item);

		// Insere o Item
		boolean retorno = TabelaTmpImpPedDAO.insereItem(item);
		assertTrue(retorno);

		// Obtem o Item da base
		Item itemDaBase = TabelaTmpImpPedDAO.obtemItem(item.mercadoria.descricao);
		assertNotNull(itemDaBase);

		// Exclui o Item inserido
		retorno = TabelaTmpImpPedDAO.excluiItem(itemDaBase.mercadoria.descricao);
		assertTrue(retorno);
	}

	@Test
	public void testInsereItem() {
		// Obtem objeto Item serializado em disco.
		Item item = desserializaItem();
		assertNotNull(item);

		// Insere o Item
		boolean retorno = TabelaTmpImpPedDAO.insereItem(item);
		assertTrue(retorno);

		// Exclui o Item inserido
		retorno = TabelaTmpImpPedDAO.excluiItem(item.mercadoria.descricao);
		assertTrue(retorno);
	}

	@Test
	public void testAlteraItem() {
		// Obtem objeto Item serializado em disco.
		Item item = desserializaItem();
		assertNotNull(item);

		item.quantidadeMercadoria = 1000;

		boolean retorno = TabelaTmpImpPedDAO.alteraItem(item);
		assertEquals(true, retorno);
		
		// Obtem o Item da base
		Item itemDaBase = TabelaTmpImpPedDAO.obtemItem(item.mercadoria.descricao);
		assertNotNull(itemDaBase);
		
		// Compara os valores
		assertEquals(Integer.valueOf(1000), itemDaBase.quantidadeMercadoria);
	}

	@Test
	public void testObtemTodosItens() {
		List<Item> list = TabelaTmpImpPedDAO.obtemTodosItens();
		assertNotNull(list);
		assertTrue(list.size() > 0);
	}

	@Test
	public void testLimpaTabela() {
		// Obtem todos os dados (backup) e verifica a lista de itens.
		List<Item> listaItensBackup = TabelaTmpImpPedDAO.obtemTodosItens();
		assertNotNull(listaItensBackup);
		assertFalse(listaItensBackup.isEmpty());

		// Limpa a tabela e verifica se ela está realmente sem dados.
		boolean retorno = TabelaTmpImpPedDAO.limpaTabela();
		assertTrue(retorno);

		// Verifica se a tabela esta limpa
		List<Item> listaItem = TabelaTmpImpPedDAO.obtemTodosItens();
		assertTrue(listaItem.size() == 0);
		assertTrue(listaItem.isEmpty());

		// Recupera os Itens na base
		for (Item item : listaItensBackup) {
			retorno = TabelaTmpImpPedDAO.insereItem(item);
			assertTrue(retorno);
		}

		// Verifica se houve a restauracao dos dados
		listaItem = TabelaTmpImpPedDAO.obtemTodosItens();
		assertTrue(listaItem.size() > 0);
		assertFalse(listaItem.isEmpty());
	}

	@Test
	public void testExcluiItem() {
		// Obtem objeto item serializado em disco.
		Item itemBackup = desserializaItem();
		assertNotNull(itemBackup);

		// Exclui o item da base
		boolean resultado = TabelaTmpImpPedDAO.excluiItem(itemBackup.mercadoria.descricao);
		assertTrue(resultado);

		// Obtem o item da base para verificar que nao existe
		Item item = TabelaTmpImpPedDAO.obtemItem(itemBackup.mercadoria.descricao);
		assertNull(item);

		// Insere o item na base novamente
		resultado = TabelaTmpImpPedDAO.insereItem(itemBackup);
		assertTrue(resultado);

		// Obtem o item da base para verificar que existe
		item = TabelaTmpImpPedDAO.obtemItem(itemBackup.mercadoria.descricao);
		assertNotNull(item);
	}

	private static void serializaListaItem(List<Item> listaItem) {
		ObjectOutput objectOutput;
		try {
			objectOutput = new ObjectOutputStream(new FileOutputStream("/mnt/sdcard/listaItem.ser"));
			objectOutput.writeObject(listaItem);
			objectOutput.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "unused", "unchecked" })
	private static List<Item> desserializaListaItem() {
		List<Item> listaItem = null;
		try {
			File file = new File("/mnt/sdcard/listaItem.ser");
			ObjectInputStream in = new ObjectInputStream(new FileInputStream(file));
			listaItem = (List<Item>) in.readObject();
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return listaItem;
	}

	private static void serializaItem(Item item) {
		ObjectOutput objectOutput;
		try {
			objectOutput = new ObjectOutputStream(new FileOutputStream("/mnt/sdcard/item.ser"));
			objectOutput.writeObject(item);
			objectOutput.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private static Item desserializaItem() {
		Item item = null;
		try {
			File file = new File("/mnt/sdcard/item.ser");
			ObjectInputStream in = new ObjectInputStream(new FileInputStream(file));
			item = (Item) in.readObject();
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return item;
	}
	
}