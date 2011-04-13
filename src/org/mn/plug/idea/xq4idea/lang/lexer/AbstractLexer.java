package org.mn.plug.idea.xq4idea.lang.lexer;

import java.lang.reflect.Field;

/**
 * Simple implementation of the state stack base needed for lexing.
 *
 * @author Matt Nathan
 */
public abstract class AbstractLexer {
  private static final boolean DEBUG = true;

  final IntStack stack = new IntStack();

  abstract int yystate();

  abstract void yybegin(int state);

  abstract void yypushback(int chars);

  abstract int yylength();

  abstract int initialState();

  abstract int wordSep();

  abstract int optWordSep();

  void pushState() {
    pushState(yystate());
  }

  void pushState(int state) {
    if (DEBUG) {
      System.err.println(indentString() + "push(" + prettyState(state) + ");");
    }
    stack.push(state);
  }

  void popState() {
    int pop = stack.pop();
    if (pop == -1) {
      pop = initialState();
    }
    if (DEBUG) {
      System.err.println(indentString() + "pop-(" + prettyState(pop) + ");");
    }
    yybegin(pop);
  }

  /**
   * Call this method to setup state ready to accept a non-optional space or comment.
   *
   * @param state The state to go to after finding characters that aren't space or comment
   */
  void spaceThen(int state) {
    pushState(state);
    yybegin(wordSep());
  }

  /**
   * Call this method to setup state ready to accept an optional space or comment.
   *
   * @param state The state to go to after finding characters that aren't space or comment
   */
  void optSpaceThen(int state) {
    pushState(state);
    yybegin(optWordSep());
  }

  /**
   * Push a state onto the stack making sure space will appear before it
   *
   * @param state The state to end up in
   */
  void pushSpaceThen(int state) {
    pushState(state);
    pushState(wordSep());
  }

  /**
   * Push a state onto the stack that can appear with optional space will before it
   *
   * @param state The state to end up in
   */
  void pushOptSpaceThen(int state) {
    pushState(state);
    pushState(optWordSep());
  }

  /**
   * Resets the scanner state and trys matching again with the given state
   *
   * @param state The state to move to after resetting the scanner
   */
  void retryAs(int state) {
    yypushback(yylength());
    yybegin(state);
  }

  /**
   * Retry matching again from the next state up the stack.
   */
  void retry() {
    yypushback(yylength());
    popState();
  }

  private String prettyState(int state) {
    try {
      for (Field field : getClass().getDeclaredFields()) {
        field.setAccessible(true);
        if (field.getInt(null) == state && !field.getName().startsWith("ZZ")) {
          return field.getName();
        }
      }
    } catch (IllegalAccessException e) {
      System.err.println("ERROR: " + e);
      // degrade gracefully
    }
    return "[" + state + "]";
  }

  private String indentString() {
    StringBuilder buf = new StringBuilder();
    for (int i = stack.size(); i > 0; i--) {
      buf.append("| ");
    }
    return buf.toString();
  }
}
