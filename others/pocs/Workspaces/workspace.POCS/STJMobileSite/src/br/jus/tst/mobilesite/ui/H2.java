package br.jus.tst.mobilesite.ui;

import br.jus.tst.mobilesite.Componente;
import br.jus.tst.mobilesite.util.UtilString;
import java.util.List;

public class H2 extends Componente
{
  private String conteudo;

  public H2(String conteudo)
  {
/* 12 */     this.conteudo = conteudo;
  }

  public String getCode()
  {
/* 17 */     String texto = "<h2>";
/* 18 */     texto = texto + UtilString.converter(this.conteudo);
/* 19 */     texto = texto + "</h2>";
/* 20 */     return texto;
  }

  protected void getMontarItensObrigatoriosOpcionais()
  {
/* 25 */     this.itensOpcionais.add(A.class);
  }
}

/* Location:           /Users/Gabriel/Workspace/POCs/Workspaces/workspace.POCS/STJMobileSite/WebContent/WEB-INF/classes/
 * Qualified Name:     br.jus.tst.mobilesite.ui.H2
 * JD-Core Version:    0.6.0
 */