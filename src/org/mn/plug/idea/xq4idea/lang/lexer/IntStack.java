package org.mn.plug.idea.xq4idea.lang.lexer;

/**
 * Simple integer stack implementation for use holding the parse state stack.
 *
 * @author Matt Nathan
 */
public class IntStack {

  private final int[] values;
  private int size = 0;

  public IntStack() {
    this(256);
  }

  public IntStack(int size) {
    values = new int[size];
  }

  public void push(int val) {
    checkCanPush();
    values[size++] = val;
  }

  public int pop() {
    checkCanPop();
    return values[--size];
  }

  public int peek() {
    checkCanPop();
    return values[size - 1];
  }

  private void checkCanPush() {
    if (size >= values.length - 1) {
      throw new ArrayIndexOutOfBoundsException("Stack is full!");
    }
  }

  private void checkCanPop() {
    if (size == 0) {
      throw new ArrayIndexOutOfBoundsException("Stack is empty!");
    }
  }
}
