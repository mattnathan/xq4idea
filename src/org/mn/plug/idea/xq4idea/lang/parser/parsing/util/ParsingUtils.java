package org.mn.plug.idea.xq4idea.lang.parser.parsing.util;

import com.intellij.lang.PsiBuilder;
import org.mn.plug.idea.xq4idea.lang.lexer.XQueryTokenTypes;

/**
 * @author Matt Nathan
 */
public class ParsingUtils {
  public static void skipWs(PsiBuilder builder) {
    while (builder.getTokenType() == XQueryTokenTypes.WHITE_SPACE) {
      builder.advanceLexer();
    }
  }
}
