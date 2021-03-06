#pragma once

// includes
#include <stdint.h>
#include <stdbool.h>
#include "tsdb.h"

// macros
// an id defaults to 20 bytes long
#define TS_ID_BYTES 20 // Set to 1 for easier debugging
#define TS_ID_BITS TS_ID_BYTES * 8 

// types
typedef uint8_t ts_id[TS_ID_BYTES];


// functions
int ts_id_empty(ts_id * self);
int ts_id_generate(ts_id * self, ts_db * db);
sds ts_id_string(ts_id * self, sds str);
sds ts_id_bit_string(ts_id * self, sds str);
sds ts_id_nbit_string(ts_id * self, sds str, int nbits);
bool ts_id_eq(ts_id * self, ts_id * other);
int ts_id_dup(ts_id * self, ts_id * other);
int ts_id_get_bit(ts_id * self, int index);
int ts_id_set_bit(ts_id * self, int index, int bit);
int ts_id_from_string(ts_id * self, sds str);