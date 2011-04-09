package org.mn.plug.idea.xq4idea;

import com.intellij.openapi.fileTypes.FileTypeConsumer;
import com.intellij.openapi.fileTypes.FileTypeFactory;
import org.jetbrains.annotations.NotNull;

/**
 * Filetype factory for the XQuery Language
 *
 * @author Matt Nathan
 */
public class XQueryFileTypeFactory extends FileTypeFactory {
  @Override
  public void createFileTypes(@NotNull FileTypeConsumer consumer) {
    consumer.consume(XQueryFileType.XQUERY_FILE_TYPE, "xqy;xq");
  }
}
