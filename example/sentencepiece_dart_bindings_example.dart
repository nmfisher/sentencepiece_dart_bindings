import 'dart:ffi';
import 'dart:io';

import 'package:sentencepiece_dart_bindings/sentencepiece_dart_bindings.dart';

void main() {
  var scriptDir = File(Platform.script.toFilePath()).parent.path;
  var tokenizer = SentencePieceTokenizer(
      File("$scriptDir/spm.model.proto").readAsBytesSync());
  print(tokenizer.tokenize("Mein Name ist Nick"));
}
