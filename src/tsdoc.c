#include "tsdoc.h"
#include "../lib/lmdb/libraries/liblmdb/lmdb.h"
#include "../lib/sds/sds.h"
#include "../lib/fs.c/fs.h"
#include "tsid.h"
#include "tsdb.h"
#include "tserror.h"

#include <stdlib.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdint.h>

int ts_doc_create(ts_doc * self, ts_db * db) {
    self->env = db;

    // get an id
    ts_id_generate(&self->id, db);
    ts_id_string(&(self->id), self->id_str);

    // create file for the document
    self->dir = sdsdup(self->id_str);
    sdsrange(self->dir, 0, 1);

    self->dir = sdscatprintf(sdsempty(), "%s/%s", db->docs, self->dir);
    self->path = sdscatprintf(sdsempty(), "%s/%s", self->dir, self->id_str);

    fs_mkdir(self->dir, 0700);
    fs_open(self->path, "ab+");

    // add entry to 'index' table
    MDB_val empty = {.mv_size = 0, .mv_data = ""};
    ts_db_put(db, "index", self->id_str, &empty);

    return TS_SUCCESS;
}

int ts_doc_delete(ts_doc * self) {

  unlink(self->path);
  fs_rmdir(self->dir);
  ts_db_del(self->env, "index", self->id_str)

  return TD_SUCCESS;
}

int ts_doc_open(ts_doc * self, ts_db * db, ts_id id) {
  self->env = db;
  self->id = id;

  ts_id_string(&(self->id), self->id_str);

  self->dir = sdsdup(self->id_str);
  sdsrange(self->dir, 0, 1);

  self->dir = sdscatprintf(sdsempty(), "%s/%s", db->docs, self->dir);
  self->path = sdscatprintf(sdsempty(), "%s/%s", self->dir, self->id_str);

  return TS_SUCCESS;
}

int ts_doc_close(ts_doc * self) {
  sdsfree(self->dir);
  sdsfree(self->path);
  sdsfree(self->id_str);
}
