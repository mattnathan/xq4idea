package org.mn.plug.idea.xq4idea.highlight;

import com.intellij.lang.Commenter;

/**
 * @author Matt Nathan
 */
public class XQueryCommenter implements Commenter {
  public String getLineCommentPrefix() {
    return null;
  }

  public String getBlockCommentPrefix() {
    return "(:";
  }

  public String getBlockCommentSuffix() {
    return ":)";
  }

  public String getCommentedBlockCommentPrefix() {
    return "(:";
  }

  public String getCommentedBlockCommentSuffix() {
    return ":)";
  }
}
