# sentencepiece_dart_bindings

Dart bindings for the SentencePiece library.

Written from scratch but credit to an [https://github.com/Sid911/sentencepiece_dart](earlier implementation).

## Usage

```
var modelFile = File("$scriptDir/spm.model.proto");
var modelData = modelFile.readAsBytesSync();
var tokenizer = SentencePieceTokenizer(modelData);
tokenizer.tokenize("Some string");
```
This uses the newer `native_assets` package, so you will need to run your script (or your Flutter app) wiht the `--enable-experiment=native-assets` flag.

On MacOS, you will need to manually set your `DYLD_LIBRARY_PATH` to `native/lib/macos/`.
