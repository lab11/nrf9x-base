# Included folders and source files for building nrf applications
# Included by Configuration.mk

# Ensure that this file is only included once
ifndef INCLUDES_MAKEFILE
INCLUDES_MAKEFILE = 1


# ---- This repo's files
REPO_HEADER_PATHS += $(NRF_BASE_DIR)/lib/
REPO_HEADER_PATHS += $(dir $(wildcard $(NRF_BASE_DIR)/drivers/*/))
REPO_HEADER_PATHS += $(dir $(wildcard $(NRF_BASE_DIR)/lib/*/))
# ---- Create variables for Configuration use

# Flags for compiler
HEADER_INCLUDES = $(addprefix -I,$(SDK_HEADER_PATHS)) $(addprefix -I,$(REPO_HEADER_PATHS)) $(addprefix -I,$(BOARD_HEADER_PATHS)) $(addprefix -I,$(APP_HEADER_PATHS))
LINKER_INCLUDES = $(addprefix -L,$(SDK_LINKER_PATHS)) $(addprefix -L,$(BOARD_LINKER_PATHS))
SDK_DEFINES = $(addprefix -D,$(SDK_VARS)) $(addprefix -D,$(BOARD_VARS)) $(addprefix -D,$(APP_VARS)) $(PARAMS_DEFINE)

# Directories make searches for prerequisites
VPATH = $(SDK_SOURCE_PATHS) $(REPO_SOURCE_PATHS) $(BOARD_SOURCE_PATHS) $(APP_SOURCE_PATHS)

SOURCES = $(notdir $(APP_SOURCES)) $(notdir $(BOARD_SOURCES)) $(notdir $(SDK_SOURCES))
PBSRCS = $(filter %.proto,$(SOURCES))
PBOPTS = $(filter %.options,$(SOURCES))
PBGENS = $(PBSRCS:.proto=.pb.c) $(PBSRCS:.proto=.pb.h)
CSOURCES = $(filter %.c,$(SOURCES))
CSOURCES += $(filter %.c,$(PBGENS))
OBJS = $(addprefix $(BUILDDIR), $(CSOURCES:.c=.o))
DEBUG_OBJS = $(addprefix $(BUILDDIR), $(CSOURCES:.c=.o-debug))
DEPS = $(addprefix $(BUILDDIR), $(CSOURCES:.c=.d))

SOURCES_AS = $(notdir $(SDK_AS)) $(notdir $(BOARD_AS)) $(notdir $(APP_AS))
OBJS_AS = $(addprefix $(BUILDDIR), $(SOURCES_AS:.S=.os))
DEBUG_OBJS_AS = $(addprefix $(BUILDDIR), $(SOURCES_AS:.S=.os-debug))

endif

