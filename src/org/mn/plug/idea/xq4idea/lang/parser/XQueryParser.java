package org.mn.plug.idea.xq4idea.lang.parser;

import com.intellij.lang.ASTNode;
import com.intellij.lang.PsiBuilder;
import com.intellij.lang.PsiParser;
import com.intellij.psi.tree.IElementType;
import org.jetbrains.annotations.NotNull;
import org.mn.plug.idea.xq4idea.lang.lexer.XQueryTokenTypes;

/**
 * @author Matt Nathan
 */
public class XQueryParser implements PsiParser {
  @NotNull
  public ASTNode parse(IElementType root, PsiBuilder builder) {
    PsiBuilder.Marker mark = builder.mark();
    
    parseAll(builder);

    // clean up the rest
    while (!builder.eof()) {
      builder.advanceLexer();
    }
    mark.done(root);
    return builder.getTreeBuilt();
  }

  private static void parseAll(PsiBuilder builder) {
    parseVersionDecl(builder);
  }

  private static void parseVersionDecl(PsiBuilder builder) {
    if (builder.getTokenType() == XQueryTokenTypes.KW_XQUERY) {
      final PsiBuilder.Marker versionDecl = builder.mark();
      builder.advanceLexer();
      if (builder.getTokenType() == XQueryTokenTypes.KW_VERSION) {
        builder.advanceLexer();

      } else {
        builder.error("Expecting \"version\"");
      }
      versionDecl.done(XQueryElementTypes.XQ_VERSION_DECL);
    }
  }

  private static void parseXqComment(PsiBuilder builder) {
    if (builder.getTokenType() == XQueryTokenTypes.XQ_COMMENT_START) {
      int openCount = 1;
      PsiBuilder.Marker comment = builder.mark();
      builder.advanceLexer();
      while (!builder.eof() && openCount > 0) {
        if (builder.getTokenType() == XQueryTokenTypes.XQ_COMMENT_START) {
          openCount++;
        } else if (builder.getTokenType() == XQueryTokenTypes.XQ_COMMENT_END) {
          openCount--;
        }
        builder.advanceLexer();
      }
      comment.done(XQueryElementTypes.XQ_COMMENT);
    }
  }
}
