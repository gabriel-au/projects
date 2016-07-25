package br.jus.tst.mobilesite.util;

import java.io.PrintStream;

public class UtilString
{
  private static String fullPath;

  public static String converter(String texto)
  {
/*  13 */     return converter(texto, false);
  }

  public static String converter(String texto, boolean contemQuebraLinha) {
/*  17 */     texto = texto.replaceAll("&", "&amp;");
/*  18 */     texto = texto.replaceAll("Á", "&Aacute;");
/*  19 */     texto = texto.replaceAll("�", "&aacute;");
/*  20 */     texto = texto.replaceAll("�", "&Acirc;");
/*  21 */     texto = texto.replaceAll("�", "&acirc;");
/*  22 */     texto = texto.replaceAll("À", "&Agrave;");
/*  23 */     texto = texto.replaceAll("�", "&agrave;");
/*  24 */     texto = texto.replaceAll("�", "&Aring;");
/*  25 */     texto = texto.replaceAll("å", "&aring;");
/*  26 */     texto = texto.replaceAll("Ã", "&Atilde;");
/*  27 */     texto = texto.replaceAll("�", "&atilde;");
/*  28 */     texto = texto.replaceAll("Ä", "&Auml;");
/*  29 */     texto = texto.replaceAll("ä", "&auml;");
/*  30 */     texto = texto.replaceAll("Æ", "&AElig;");
/*  31 */     texto = texto.replaceAll("æ", "&aelig;");
/*  32 */     texto = texto.replaceAll("É", "&Eacute;");
/*  33 */     texto = texto.replaceAll("�", "&eacute;");
/*  34 */     texto = texto.replaceAll("Ê", "&Ecirc;");
/*  35 */     texto = texto.replaceAll("�", "&ecirc;");
/*  36 */     texto = texto.replaceAll("È", "&Egrave;");
/*  37 */     texto = texto.replaceAll("è", "&egrave;");
/*  38 */     texto = texto.replaceAll("Ë", "&Euml;");
/*  39 */     texto = texto.replaceAll("ë", "&euml;");
/*  40 */     texto = texto.replaceAll("Ð", "&ETH;");
/*  41 */     texto = texto.replaceAll("ð", "&eth;");
/*  42 */     texto = texto.replaceAll("�", "&Iacute;");
/*  43 */     texto = texto.replaceAll("�", "&iacute;");
/*  44 */     texto = texto.replaceAll("Î", "&Icirc;");
/*  45 */     texto = texto.replaceAll("î", "&icirc;");
/*  46 */     texto = texto.replaceAll("Ì", "&Igrave;");
/*  47 */     texto = texto.replaceAll("ì", "&igrave;");
/*  48 */     texto = texto.replaceAll("Ï", "&Iuml;");
/*  49 */     texto = texto.replaceAll("ï", "&iuml;");
/*  50 */     texto = texto.replaceAll("Ó", "&Oacute;");
/*  51 */     texto = texto.replaceAll("�", "&oacute;");
/*  52 */     texto = texto.replaceAll("Ô", "&Ocirc;");
/*  53 */     texto = texto.replaceAll("ô", "&ocirc;");
/*  54 */     texto = texto.replaceAll("Ò", "&Ograve;");
/*  55 */     texto = texto.replaceAll("ò", "&ograve;");
/*  56 */     texto = texto.replaceAll("Ø", "&Oslash;");
/*  57 */     texto = texto.replaceAll("ø", "&oslash;");
/*  58 */     texto = texto.replaceAll("Õ", "&Otilde;");
/*  59 */     texto = texto.replaceAll("�", "&otilde;");
/*  60 */     texto = texto.replaceAll("Ö", "&Ouml;");
/*  61 */     texto = texto.replaceAll("ö", "&ouml;");
/*  62 */     texto = texto.replaceAll("�", "&Uacute;");
/*  63 */     texto = texto.replaceAll("�", "&uacute;");
/*  64 */     texto = texto.replaceAll("Û", "&Ucirc;");
/*  65 */     texto = texto.replaceAll("û", "&ucirc;");
/*  66 */     texto = texto.replaceAll("Ù", "&Ugrave;");
/*  67 */     texto = texto.replaceAll("ù", "&ugrave;");
/*  68 */     texto = texto.replaceAll("Ü", "&Uuml;");
/*  69 */     texto = texto.replaceAll("ü", "&uuml;");
/*  70 */     texto = texto.replaceAll("Ç", "&Ccedil;");
/*  71 */     texto = texto.replaceAll("�", "&ccedil;");
/*  72 */     texto = texto.replaceAll("Ñ", "&Ntilde;");
/*  73 */     texto = texto.replaceAll("ñ", "&ntilde;");
/*  74 */     if (contemQuebraLinha) {
/*  75 */       texto = texto.replaceAll("\\n", "#Q#u#e#b#r#a#L#i#n#h#a##");
/*  76 */       texto = texto.replaceAll("<", "&lt;");
/*  77 */       texto = texto.replaceAll(">", "&gt;");
/*  78 */       texto = texto.replaceAll("#Q#u#e#b#r#a#L#i#n#h#a##", "\n<br>\n");
    } else {
/*  80 */       texto = texto.replaceAll("<", "&lt;");
/*  81 */       texto = texto.replaceAll(">", "&gt;");
    }
/*  83 */     texto = texto.replaceAll("\\\"", "&quot;");
/*  84 */     texto = texto.replaceAll("®", "&reg;");
/*  85 */     texto = texto.replaceAll("©", "&copy;");
/*  86 */     texto = texto.replaceAll("Ý", "&Yacute;");
/*  87 */     texto = texto.replaceAll("ý", "&yacute;");
/*  88 */     texto = texto.replaceAll("Þ", "&THORN;");
/*  89 */     texto = texto.replaceAll("þ", "&thorn;");
/*  90 */     texto = texto.replaceAll("ß", "&szlig;");
/*  91 */     texto = texto.replaceAll("�", "&ordm;");
/*  92 */     return texto;
  }

  public static String getFullPath() {
/*  96 */     return fullPath;
  }
  public static void setFullPath(String fullPath) {
/*  99 */     fullPath = fullPath + "/";
  }

  public static void main(String[] args) {
/* 103 */     System.out.println(converter("\""));
/* 104 */     System.out.println(converter("aaa\naaa"));
/* 105 */     System.out.println(converter("aaa\naaa", true));
  }
}

/* Location:           /Users/Gabriel/Workspace/POCs/Workspaces/workspace.POCS/STJMobileSite/WebContent/WEB-INF/classes/
 * Qualified Name:     br.jus.tst.mobilesite.util.UtilString
 * JD-Core Version:    0.6.0
 */