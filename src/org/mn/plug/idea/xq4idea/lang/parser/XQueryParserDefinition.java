package org.mn.plug.idea.xq4idea.lang.parser;

import com.intellij.extapi.psi.ASTWrapperPsiElement;
import com.intellij.lang.ASTNode;
import com.intellij.lang.ParserDefinition;
import com.intellij.lang.PsiParser;
import com.intellij.lexer.Lexer;
import com.intellij.openapi.project.Project;
import com.intellij.psi.FileViewProvider;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiFile;
import com.intellij.psi.tree.IFileElementType;
import com.intellij.psi.tree.TokenSet;
import org.jetbrains.annotations.NotNull;
import org.mn.plug.idea.xq4idea.XQueryFileType;
import org.mn.plug.idea.xq4idea.lang.lexer.XQueryLexer;
import org.mn.plug.idea.xq4idea.lang.lexer.XQueryTokenTypeSets;
import org.mn.plug.idea.xq4idea.lang.psi.XQueryFileImpl;

/**
 * @author Matt Nathan
 */
public class XQueryParserDefinition implements ParserDefinition {

  private static final IFileElementType XQ_FILE_TYPE = new IFileElementType("XQuery", XQueryFileType.XQUERY_LAGUAGE);

  @NotNull
  public Lexer createLexer(Project project) {
    return new XQueryLexer();
  }

  public PsiParser createParser(Project project) {
    return new XQueryParser();
  }

  public IFileElementType getFileNodeType() {
    return XQ_FILE_TYPE;
  }

  @NotNull
  public TokenSet getWhitespaceTokens() {
    return XQueryTokenTypeSets.WHITESPACES;
  }

  @NotNull
  public TokenSet getCommentTokens() {
    return XQueryTokenTypeSets.COMMENTS;
  }

  @NotNull
  public TokenSet getStringLiteralElements() {
    return XQueryTokenTypeSets.STRING_LITERALS;
  }

  @NotNull
  public PsiElement createElement(ASTNode node) {
    return new ASTWrapperPsiElement(node);
  }

  public PsiFile createFile(FileViewProvider viewProvider) {
    return new XQueryFileImpl(viewProvider);
  }

  public SpaceRequirements spaceExistanceTypeBetweenTokens(ASTNode left, ASTNode right) {
    return SpaceRequirements.MAY;
  }
}
