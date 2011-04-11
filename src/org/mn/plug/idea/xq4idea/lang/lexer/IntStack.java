package org.mn.plug.idea.xq4idea.lang.lexer;

/**
 * Simple integer stack implementation for use holding the parse state stack.
 *
 * @author Matt Nathan
 */
public class IntStack {

  private int[] values;
  private int size = 0;

  public IntStack() {
    this(128);
  }

  public IntStack(int size) {
    values = new int[size];
  }

  public void push(int val) {
    checkCanPush();
    values[size++] = val;
  }

  public int pop() {
    return checkCanPop() ? values[--size] : -1;
  }

  public int peek() {
    return checkCanPop() ? values[size - 1] : -1;
  }

  private void checkCanPush() {
    if (size >= values.length - 1) {
      if (size < (Integer.MAX_VALUE >> 1)) {
        int[] newStack = new int[values.length << 1];
        System.arraycopy(values, 0, newStack, 0, size);
        values = newStack;
        System.err.println("Growing stack: " + size + " -> " + values.length);
      } else {
        throw new ArrayIndexOutOfBoundsException("Stack is full!");
      }
    }
  }

  private boolean checkCanPop() {
    return size > 0;
  }
}
