package org.mn.plug.idea.xq4idea.highlight;

import com.intellij.lexer.Lexer;
import com.intellij.openapi.editor.HighlighterColors;
import com.intellij.openapi.editor.SyntaxHighlighterColors;
import com.intellij.openapi.editor.colors.TextAttributesKey;
import com.intellij.openapi.fileTypes.SyntaxHighlighterBase;
import com.intellij.psi.tree.IElementType;
import org.jetbrains.annotations.NotNull;
import org.mn.plug.idea.xq4idea.lang.lexer.XQueryLexer;
import org.mn.plug.idea.xq4idea.lang.lexer.XQueryTokenTypeSets;
import org.mn.plug.idea.xq4idea.lang.lexer.XQueryTokenTypes;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Matt Nathan
 */
public class XQuerySyntaxHighlighter extends SyntaxHighlighterBase {

  private final static Map<IElementType, TextAttributesKey> ATTRIBUTES = new HashMap<IElementType, TextAttributesKey>();

  static {
    ATTRIBUTES.put(XQueryTokenTypes.BAD_CHARACTER, HighlighterColors.BAD_CHARACTER);
    fillMap(ATTRIBUTES, XQueryTokenTypeSets.COMMENTS, SyntaxHighlighterColors.JAVA_BLOCK_COMMENT);
    fillMap(ATTRIBUTES, XQueryTokenTypeSets.KEYWORDS, SyntaxHighlighterColors.KEYWORD);
    fillMap(ATTRIBUTES, XQueryTokenTypeSets.STRING_LITERALS, SyntaxHighlighterColors.STRING);
    fillMap(ATTRIBUTES, XQueryTokenTypeSets.NUMBER_LITERALS, SyntaxHighlighterColors.NUMBER);
  }

  @NotNull
  public Lexer getHighlightingLexer() {
    return new XQueryLexer();
  }

  @NotNull
  public TextAttributesKey[] getTokenHighlights(IElementType tokenType) {
    return pack(ATTRIBUTES.get(tokenType));
  }
}
