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

  abstract int xmlWordSep();

  abstract int optXmlWordSep();

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
      System.err.println(indentString(1) + "pop-(" + prettyState(yystate()) + " -> " + prettyState(pop) + ");");
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
    pushOptSpaceThen(yystate());
  }

  /**
   * Call this method to setup a repeating loop with guarenteed space between each iteration.
   */
  void spaceRepeat() {
    pushSpaceThen(yystate());
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
   * Call this method to setup state ready to accept a non-optional space or comment.
   *
   * @param state The state to go to after finding characters that aren't space or comment
   */
  void xmlSpaceThen(int state) {
    pushState(state);
    yybegin(xmlWordSep());
  }

  /**
   * Call this method to setup state ready to accept an optional space or comment.
   *
   * @param state The state to go to after finding characters that aren't space or comment
   */
  void optXmlSpaceThen(int state) {
    pushState(state);
    yybegin(optXmlWordSep());
  }

  /**
   * Call this method to setup a repeating loop with possible space between each iteration.
   */
  void optXmlSpaceRepeat() {
    pushOptXmlSpaceThen(yystate());
  }

  /**
   * Call this method to setup a repeating loop with guarenteed space between each iteration.
   */
  void xmlSpaceRepeat() {
    pushXmlSpaceThen(yystate());
  }

  /**
   * Push a state onto the stack making sure space will appear before it
   *
   * @param state The state to end up in
   */
  void pushXmlSpaceThen(int state) {
    pushState(state);
    pushState(xmlWordSep());
  }

  /**
   * Push a state onto the stack that can appear with optional space will before it
   *
   * @param state The state to end up in
   */
  void pushOptXmlSpaceThen(int state) {
    pushState(state);
    pushState(optXmlWordSep());
  }

  /**
   * Start a list. This is in the form (initialState (repeaterState)*)
   *
   * @param initialState  The initial state
   * @param repeaterState The repeater state
   */
  void startList(int initialState, int repeaterState) {
    pushOptSpaceThen(repeaterState);
    optSpaceThen(initialState);
  }

  /**
   * Start a list. This is in the form (initialState (repeaterState)*)
   *
   * @param initialState  The initial state
   * @param repeaterState The repeater state
   */
  void pushList(int initialState, int repeaterState) {
    pushOptSpaceThen(repeaterState);
    pushOptSpaceThen(initialState);
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
    undo();
    yybegin(state);
  }

  /**
   * Retry matching again from the next state up the stack.
   */
  void retry() {
    undo();
    popState();
  }

  /**
   * Rollback the scanner state
   */
  void undo() {
    yypushback(yylength());
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
    return indentString(0);
  }

  private String indentString(int offset) {
    StringBuilder buf = new StringBuilder();
    for (int i = stack.size() + offset; i > 0; i--) {
      buf.append("| ");
    }
    return buf.toString();
  }
}
