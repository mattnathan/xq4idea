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
  /**
   * Creates a language file type for the specified language.
   *
   * @param language The language used in the files of the type.
   */
  protected XQueryFileType(@NotNull Language language) {
    super(language);
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
    return "xqy";
  }

  public Icon getIcon() {
    return XQueryIcons.XQUERY_ICON_16x16;
  }
}
