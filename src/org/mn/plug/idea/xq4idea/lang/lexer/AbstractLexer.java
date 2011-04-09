package org.mn.plug.idea.xq4idea.lang.lexer;

/**
 * Simple implementation of the state stack base needed for lexing.
 *
 * @author Matt Nathan
 */
public abstract class AbstractLexer {
  private final IntStack stack = new IntStack();

  abstract int yystate();

  abstract void yybegin(int state);

  void pushState() {
    pushState(yystate());
  }

  void pushState(int state) {
    stack.push(state);
  }

  void popState() {
    yybegin(stack.pop());
  }
}
