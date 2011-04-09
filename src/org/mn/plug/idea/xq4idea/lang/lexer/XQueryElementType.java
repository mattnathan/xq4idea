package org.mn.plug.idea.xq4idea.lang.lexer;

import com.intellij.psi.tree.IElementType;
import org.mn.plug.idea.xq4idea.XQueryFileType;

/**
 * Default element type for XQuery laguage
 *
 * @author Matt Nathan
 */
public class XQueryElementType extends IElementType {
  public XQueryElementType(@org.jetbrains.annotations.NotNull @org.jetbrains.annotations.NonNls String debugName) {
    super(debugName, XQueryFileType.XQUERY_LAGUAGE);
  }
}
