package org.mn.plug.idea.xq4idea.lang.lexer;

import java.lang.reflect.Field;

/**
 * Simple implementation of the state stack base needed for lexing.
 *
 * @author Matt Nathan
 */
public abstract class AbstractLexer {
  private static final boolean DEBUG = true;
  private int initialState = -1;

  final IntStack stack = new IntStack();

  abstract int yystate();

  abstract void yybegin(int state);

  abstract void yypushback(int chars);

  abstract int yylength();

  abstract int initialState();

  abstract int wordSep();

  abstract int optWordSep();

  private int initialStateImpl() {
    return this.initialState == -1 ? initialState() : initialState;
  }

  void setInitialState(int initialState) {
    this.initialState = initialState;
  }

  void pushState() {
    pushState(yystate());
  }

  void pushState(int state) {
    if (DEBUG) {
      System.err.println(indentString() + "push(" + prettyState(yystate()) + " -> " + prettyState(state) + ");");
    }
    stack.push(state);
  }

  void popState() {
    int pop = stack.pop();
    if (pop == -1) {
      pop = initialStateImpl();
    }
    if (DEBUG) {
      System.err.println(indentString() + "pop-(" + prettyState(yystate()) + " -> " + prettyState(pop) + ");");
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
   * Call this method to setup a repeating loop with possible space between each iteration.
   */
  void optSpaceRepeat() {
    pushState(yystate());
    pushState(optWordSep());
  }

  /**
   * Call this method to setup a repeating loop with guarenteed space between each iteration.
   */
  void spaceRepeat() {
    pushState(yystate());
    pushState(wordSep());
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
   * Surround the given state with before and after. Acts as though you did:
   * <code><pre>
   *   pushOptSpaceThen(after);
   *   pushOptSpaceThen(state);
   *   optSpaceThen(before);
   * </pre></code>
   *
   * @param before The state before state
   * @param state  The state in the middle
   * @param after  The state after state
   */
  void surround(int before, int state, int after) {
    pushOptSpaceThen(after);
    pushOptSpaceThen(state);
    optSpaceThen(before);
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
