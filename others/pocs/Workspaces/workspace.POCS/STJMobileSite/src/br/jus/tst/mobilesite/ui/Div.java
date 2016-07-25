package br.jus.tst.mobilesite.ui;

import br.jus.stj.mobile.SystemException;
import br.jus.tst.mobilesite.Componente;
import java.util.List;

public class Div extends Componente
{
  private boolean toolbar;
  private String style;
  private String id;

  public Div()
  {
  }

  public Div(String style)
  {
/* 23 */     this.style = style;
  }

  public Div(Texto texto) throws SystemException {
/* 27 */     add(texto);
  }

  public Div(String style, Texto texto) throws SystemException {
/* 31 */     this.style = style;
/* 32 */     add(texto);
  }

  public Div(String style, Componente componente) throws SystemException {
/* 36 */     this.style = style;
/* 37 */     add(componente);
  }

  public Div(boolean toolbar) {
/* 41 */     this.toolbar = toolbar;
  }

  public String getCode()
  {
/* 46 */     String texto = "<div";
/* 47 */     if (this.toolbar)
/* 48 */       texto = texto + " class=\"toolbar\"";
/* 49 */     if (this.style != null)
/* 50 */       texto = texto + " class=\"" + this.style + "\"";
/* 51 */     if (this.id != null)
/* 52 */       texto = texto + " id=\"" + this.id + "\"";
/* 53 */     texto = texto + ">";
/* 54 */     texto = texto + getCodeChild();
/* 55 */     texto = texto + "\n";
/* 56 */     texto = texto + "</div>";
/* 57 */     return texto;
  }

  protected void getMontarItensObrigatoriosOpcionais()
  {
/* 62 */     this.itensOpcionais.add(A.class);
/* 63 */     this.itensOpcionais.add(H1.class);
/* 64 */     this.itensOpcionais.add(H2.class);
/* 65 */     this.itensOpcionais.add(Img.class);
/* 66 */     this.itensOpcionais.add(Ul.class);
/* 67 */     this.itensOpcionais.add(P.class);
/* 68 */     this.itensOpcionais.add(Div.class);
/* 69 */     this.itensOpcionais.add(Texto.class);
/* 70 */     this.itensOpcionais.add(Input.class);
/* 71 */     this.itensOpcionais.add(Form.class);
/* 72 */     this.itensOpcionais.add(Select.class);
/* 73 */     this.itensOpcionais.add(Script.class);
/* 74 */     this.itensOpcionais.add(Br.class);
  }
  public String getId() {
/* 77 */     return this.id;
  }
  public void setId(String id) {
/* 80 */     this.id = id;
  }
}

/* Location:           /Users/Gabriel/Workspace/POCs/Workspaces/workspace.POCS/STJMobileSite/WebContent/WEB-INF/classes/
 * Qualified Name:     br.jus.tst.mobilesite.ui.Div
 * JD-Core Version:    0.6.0
 */