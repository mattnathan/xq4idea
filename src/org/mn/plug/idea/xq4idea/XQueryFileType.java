package org.mn.plug.idea.xq4idea;

import com.intellij.lang.Language;
import com.intellij.openapi.fileTypes.LanguageFileType;
import org.jetbrains.annotations.NotNull;

import javax.swing.*;

/**
 * Filetype for the XQuery language
 *
 * @author Matt Nathan
 */
public class XQueryFileType extends LanguageFileType {
  public static final XQueryFileType XQUERY_FILE_TYPE = new XQueryFileType();
  public static final Language XQUERY_LAGUAGE = XQUERY_FILE_TYPE.getLanguage();
  private static final String DEFAULT_EXTENSION = "xqy";

  private XQueryFileType() {
    super(new XQueryLanguage());
  }

  @NotNull
  public String getName() {
    return "XQuery";
  }

  @NotNull
  public String getDescription() {
    return "XQuery files";
  }

  @NotNull
  public String getDefaultExtension() {
    return DEFAULT_EXTENSION;
  }

  public Icon getIcon() {
    return XQueryIcons.XQUERY_ICON_16x16;
  }
}
