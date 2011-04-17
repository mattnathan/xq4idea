package org.mn.plug.idea.xq4idea.lang.parser;

import com.intellij.psi.tree.IElementType;
import org.mn.plug.idea.xq4idea.lang.lexer.XQueryElementType;

/**
 * @author Matt Nathan
 */
public interface XQueryElementTypes {
  IElementType XQ_COMMENT = new XQueryElementType("XQ_COMMENT");
  IElementType XQ_VERSION_DECL = new XQueryElementType("XQ_VERSION_DECL");
}
