package br.jus.tst.mobilesite.ui;

import br.jus.tst.mobilesite.Componente;

public class Input extends Componente
{
  public static final String INPUT_TEXT = "text";
  public static final String INPUT_BUTTON = "button";
  public static final String INPUT_SUBMIT = "submit";
  public static final String INPUT_PASSWORD = "password";
  public static final String INPUT_HIDDEN = "hidden";
  private String type;
  private String name;
  private String id;
  private String value;
  private String clazz;
  private String size;

  public Input(String type, String name)
  {
/*  28 */     this.type = type;
/*  29 */     this.name = name;
  }

  public Input(String type, String name, String value) {
/*  33 */     this.type = type;
/*  34 */     this.name = name;
/*  35 */     this.value = value;
  }

  public Input(String type, String name, String clazz, String value, String size) {
/*  39 */     this.type = type;
/*  40 */     this.name = name;
/*  41 */     this.clazz = clazz;
/*  42 */     this.value = value;
/*  43 */     this.size = size;
  }

  public String getCode()
  {
/*  48 */     if (this.id == null)
/*  49 */       this.id = this.name;
/*  50 */     if (this.value == null)
/*  51 */       this.value = "";
/*  52 */     String texto = "<input";
/*  53 */     texto = texto + " type=\"" + this.type + "\"";
/*  54 */     texto = texto + " name=\"" + this.name + "\"";
/*  55 */     texto = texto + " id=\"" + this.id + "\"";
/*  56 */     texto = texto + " value=\"" + this.value + "\"";
/*  57 */     if (this.clazz != null)
/*  58 */       texto = texto + " class=\"" + this.clazz + "\"";
/*  59 */     if (this.size != null)
/*  60 */       texto = texto + " size=\"" + this.size + "\"";
/*  61 */     texto = texto + " />";
/*  62 */     return texto;
  }

  protected void getMontarItensObrigatoriosOpcionais()
  {
  }

  public String getType() {
/*  70 */     return this.type;
  }

  public void setType(String type) {
/*  74 */     this.type = type;
  }

  public String getName() {
/*  78 */     return this.name;
  }

  public void setName(String name) {
/*  82 */     this.name = name;
  }

  public String getId() {
/*  86 */     return this.id;
  }

  public void setId(String id) {
/*  90 */     this.id = id;
  }

  public String getValue() {
/*  94 */     return this.value;
  }

  public void setValue(String value) {
/*  98 */     this.value = value;
  }

  public String getClazz() {
/* 102 */     return this.clazz;
  }

  public void setClazz(String clazz) {
/* 106 */     this.clazz = clazz;
  }
  public String getSize() {
/* 109 */     return this.size;
  }
  public void setSize(String size) {
/* 112 */     this.size = size;
  }
}

/* Location:           /Users/Gabriel/Workspace/POCs/Workspaces/workspace.POCS/STJMobileSite/WebContent/WEB-INF/classes/
 * Qualified Name:     br.jus.tst.mobilesite.ui.Input
 * JD-Core Version:    0.6.0
 */