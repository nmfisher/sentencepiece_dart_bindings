#include <stdint.h>


struct Int32Array 
{
    int32_t* data;
    int32_t length;
};

typedef struct Int32Array Int32Array;

void sentence_piece_destroy(void* processor);

void sentence_piece_free_int_array(int32_t* array);

void* const sentence_piece_create_processor_from_serialized_model(const char* serializedModelData, uint32_t length);

Int32Array sentence_piece_encode(void* const processor, const char* input);