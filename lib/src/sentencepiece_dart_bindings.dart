import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:sentencepiece_dart_bindings/src/sentencepiece_dart_bindings.g.dart';

class SentencePieceTokenizer {
  Pointer<Void> _tokenizer = nullptr;

  SentencePieceTokenizer(Uint8List serializedModelData) {
    var modelPtr = calloc<Char>(serializedModelData.length);
    for (int i = 0; i < serializedModelData.length; i++) {
      modelPtr[i] = serializedModelData[i];
    }
    _tokenizer = sentence_piece_create_processor_from_serialized_model(
        modelPtr, serializedModelData.length);
    calloc.free(modelPtr);
    if (_tokenizer == nullptr) {
      throw Exception("Failed to construct tokenizer. See logs for details");
    }
  }

  List<int> tokenize(String string) {
    var ptr = string.toNativeUtf8();
    var result = sentence_piece_encode(_tokenizer, ptr.cast<Char>());
    calloc.free(ptr);
    var ids = List<int>.of(result.data.asTypedList(result.length));
    sentence_piece_free_int_array(result.data);
    return ids;
  }

  void dispose() {
    sentence_piece_destroy(_tokenizer!);
  }
}
