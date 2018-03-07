
#include <stdlib.h>
#include "stddef.h"
#include "sds.h"
#include "tserror.h"
#include "tsid.h"
#include "tstags.h"


int ts_tagtree_empty(ts_tags * self) {
    self->size = 2;
    self->occupied = 0;
    self->data = malloc(sizeof(ts_tags) * 2);
    return TS_SUCCESS;
}

int ts_tagtree_insert(ts_tags * self, ts_id * id) {
    // we need space for one inner node and one leaf node
    int required = sizeof(ts_tagnode) * 2;

    // make larger if we need space
    if(self->occupied + required > self->size) {
        //  double size up to TS_TAGS_MAXRESIZE aditional slots
        int to_add = self->size > TS_TAGS_MAXRESIZE ? TS_TAGS_MAXRESIZE : self->size;
        self->size += to_add;
        self->data = realloc(self->data, self->size);
    }

    // insert element. 
    //  Place new elements after 'occupied'
    //  increment 'occupied'
    //  update pointers to account for new element
    
}

int ts_tagtree_remove(ts_tags * self, ts_id * id);