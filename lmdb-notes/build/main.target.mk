# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := main
DEFS_Debug := \
	'-DNODE_GYP_MODULE_NAME=main' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-D_GLIBCXX_USE_C99_MATH' \
	'-DBUILDING_NODE_EXTENSION' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x

INCS_Debug := \
	-I/data/data/com.termux/files/home/.node-gyp/5.6.0/include/node \
	-I/data/data/com.termux/files/home/.node-gyp/5.6.0/src \
	-I/data/data/com.termux/files/home/.node-gyp/5.6.0/deps/uv/include \
	-I/data/data/com.termux/files/home/.node-gyp/5.6.0/deps/v8/include

DEFS_Release := \
	'-DNODE_GYP_MODULE_NAME=main' \
	'-D_LARGEFILE_SOURCE' \
	'-D_FILE_OFFSET_BITS=64' \
	'-D_GLIBCXX_USE_C99_MATH' \
	'-DBUILDING_NODE_EXTENSION'

# Flags passed to all source files.
CFLAGS_Release := \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-O3 \
	-ffunction-sections \
	-fdata-sections \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++0x

INCS_Release := \
	-I/data/data/com.termux/files/home/.node-gyp/5.6.0/include/node \
	-I/data/data/com.termux/files/home/.node-gyp/5.6.0/src \
	-I/data/data/com.termux/files/home/.node-gyp/5.6.0/deps/uv/include \
	-I/data/data/com.termux/files/home/.node-gyp/5.6.0/deps/v8/include

OBJS := \
	$(obj).target/$(TARGET)/main.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-rdynamic

LDFLAGS_Release := \
	-rdynamic

LIBS := \
	-llog

$(obj).target/main.node: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/main.node: LIBS := $(LIBS)
$(obj).target/main.node: TOOLSET := $(TOOLSET)
$(obj).target/main.node: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,solink_module)

all_deps += $(obj).target/main.node
# Add target alias
.PHONY: main
main: $(builddir)/main.node

# Copy this to the executable output path.
$(builddir)/main.node: TOOLSET := $(TOOLSET)
$(builddir)/main.node: $(obj).target/main.node FORCE_DO_CMD
	$(call do_cmd,copy)

all_deps += $(builddir)/main.node
# Short alias for building this executable.
.PHONY: main.node
main.node: $(obj).target/main.node $(builddir)/main.node

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/main.node

