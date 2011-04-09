package org.mn.plug.idea.xq4idea.lang.psi;

import com.intellij.extapi.psi.PsiFileBase;
import com.intellij.openapi.fileTypes.FileType;
import com.intellij.psi.FileViewProvider;
import org.jetbrains.annotations.NotNull;
import org.mn.plug.idea.xq4idea.XQueryFileType;

/**
 * @author Matt Nathan
 */
public class XQueryFileImpl extends PsiFileBase {
  public XQueryFileImpl(@NotNull FileViewProvider viewProvider) {
    super(viewProvider, XQueryFileType.XQUERY_LAGUAGE);
  }

  @NotNull
  public FileType getFileType() {
    return XQueryFileType.XQUERY_FILE_TYPE;
  }
}
