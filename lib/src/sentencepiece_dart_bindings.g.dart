// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
// ignore_for_file: type=lint
import 'dart:ffi' as ffi;

@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(
    symbol: 'sentence_piece_destroy',
    assetId:
        'package:sentencepiece_dart_bindings/sentencepiece_dart_bindings.dart')
external void sentence_piece_destroy(
  ffi.Pointer<ffi.Void> processor,
);

@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Int32>)>(
    symbol: 'sentence_piece_free_int_array',
    assetId:
        'package:sentencepiece_dart_bindings/sentencepiece_dart_bindings.dart')
external void sentence_piece_free_int_array(
  ffi.Pointer<ffi.Int32> array,
);

@ffi.Native<ffi.Pointer<ffi.Void> Function(ffi.Pointer<ffi.Char>, ffi.Uint32)>(
    symbol: 'sentence_piece_create_processor_from_serialized_model',
    assetId:
        'package:sentencepiece_dart_bindings/sentencepiece_dart_bindings.dart')
external ffi.Pointer<ffi.Void>
    sentence_piece_create_processor_from_serialized_model(
  ffi.Pointer<ffi.Char> serializedModelData,
  int length,
);

@ffi.Native<Int32Array Function(ffi.Pointer<ffi.Void>, ffi.Pointer<ffi.Char>)>(
    symbol: 'sentence_piece_encode',
    assetId:
        'package:sentencepiece_dart_bindings/sentencepiece_dart_bindings.dart')
external Int32Array sentence_piece_encode(
  ffi.Pointer<ffi.Void> processor,
  ffi.Pointer<ffi.Char> input,
);

final class Int32Array extends ffi.Struct {
  external ffi.Pointer<ffi.Int32> data;

  @ffi.Int32()
  external int length;
}