#include "SentencePieceTokenizerCApi.h"
#include "sentencepiece_processor.h"

#include <iostream> 


namespace sentencepiece_dart_bindings {

using namespace sentencepiece;

extern "C" {

void sentence_piece_destroy(void* processor) {
	delete static_cast<SentencePieceProcessor*> (processor);
}

void sentence_piece_free_int_array(int32_t* array) {
	free(array);
}

void* const sentence_piece_create_processor_from_serialized_model(const char* serializedModelData, uint32_t length) {
    auto processor = new SentencePieceProcessor();
   
    const std::string str(serializedModelData, length);

    auto status = processor->LoadFromSerializedProto(str);
    
    if (!status.ok()) {
        std::cerr << status.ToString() << std::endl;
        delete processor;
        return nullptr;
    }   
    return processor;
}

Int32Array sentence_piece_encode(void* const processor, const char* input) {
	auto result = (static_cast<SentencePieceProcessor*>(processor))->EncodeAsIds(input);
	return Int32Array { result.data(), (int32_t) result.size() };
}

}

}