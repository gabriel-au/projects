package br.jus.tst.mobilesite.ui;

import br.jus.tst.mobilesite.Componente;
import br.jus.tst.mobilesite.util.UtilString;

public class Script extends Componente
{
  private String fileName;

  public Script(String fileName)
  {
/* 18 */     this.fileName = (UtilString.getFullPath() + fileName);
  }

  public String getCode()
  {
/* 24 */     String texto = "<script type=\"text/javascript\" language=\"javascript\" src=\"" + this.fileName + "\"></script> ";
/* 25 */     return texto;
  }

  protected void getMontarItensObrigatoriosOpcionais()
  {
  }
}

/* Location:           /Users/Gabriel/Workspace/POCs/Workspaces/workspace.POCS/STJMobileSite/WebContent/WEB-INF/classes/
 * Qualified Name:     br.jus.tst.mobilesite.ui.Script
 * JD-Core Version:    0.6.0
 */