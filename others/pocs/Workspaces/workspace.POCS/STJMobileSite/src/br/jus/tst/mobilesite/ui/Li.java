package br.jus.tst.mobilesite.ui;

import br.jus.tst.mobilesite.Componente;
import br.jus.tst.mobilesite.util.UtilString;
import java.util.List;

public class Li extends Componente
{
  private String conteudo;

  public Li(String conteudo)
  {
/* 18 */     this.conteudo = conteudo;
  }

  public String getCode()
  {
/* 23 */     String texto = "<li>";
/* 24 */     texto = texto + UtilString.converter(this.conteudo);
/* 25 */     texto = texto + "</li>";
/* 26 */     return texto;
  }

  protected void getMontarItensObrigatoriosOpcionais()
  {
/* 31 */     this.itensOpcionais.add(A.class);
/* 32 */     this.itensOpcionais.add(P.class);
  }
}

/* Location:           /Users/Gabriel/Workspace/POCs/Workspaces/workspace.POCS/STJMobileSite/WebContent/WEB-INF/classes/
 * Qualified Name:     br.jus.tst.mobilesite.ui.Li
 * JD-Core Version:    0.6.0
 */