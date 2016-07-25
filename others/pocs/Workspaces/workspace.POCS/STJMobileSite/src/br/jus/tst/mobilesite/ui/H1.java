package br.jus.tst.mobilesite.ui;

import br.jus.tst.mobilesite.Componente;
import br.jus.tst.mobilesite.util.UtilString;

public class H1 extends Componente
{
  private String conteudo;
  private String style;

  public H1(String conteudo)
  {
/* 13 */     this.conteudo = conteudo;
  }

  public H1(String conteudo, String style) {
/* 17 */     this.conteudo = conteudo;
/* 18 */     this.style = style;
  }

  public String getCode()
  {
/* 23 */     String texto = "<h1";
/* 24 */     if (this.style != null)
/* 25 */       texto = texto + " style=\"" + this.style + "\"";
/* 26 */     texto = texto + ">";
/* 27 */     texto = texto + UtilString.converter(this.conteudo);
/* 28 */     texto = texto + "</h1>";
/* 29 */     return texto;
  }

  protected void getMontarItensObrigatoriosOpcionais()
  {
  }

  public String getConteudo() {
/* 37 */     return this.conteudo;
  }

  public void setConteudo(String conteudo) {
/* 41 */     this.conteudo = conteudo;
  }

  public String getStyle() {
/* 45 */     return this.style;
  }

  public void setStyle(String style) {
/* 49 */     this.style = style;
  }
}

/* Location:           /Users/Gabriel/Workspace/POCs/Workspaces/workspace.POCS/STJMobileSite/WebContent/WEB-INF/classes/
 * Qualified Name:     br.jus.tst.mobilesite.ui.H1
 * JD-Core Version:    0.6.0
 */