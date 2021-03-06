# -*- makefile -*-
#
# This makefile fragment has (default) configuration
# settings for building MCS.

# DO NOT EDIT THIS FILE! Create config.make and override settings
# there.

# Use UTF-8 as the default encoding for compilers
CODEPAGE = 65001

RUNTIME_FLAGS =

ifdef TEST_WITH_INTERPRETER
TEST_RUNTIME_FLAGS = --interpreter
else
TEST_RUNTIME_FLAGS =
endif

TEST_HARNESS = $(topdir)/class/lib/$(PROFILE_DIRECTORY)/$(PARENT_PROFILE)nunit-lite-console.exe
PLATFORM_DEBUG_FLAGS = /debug:portable
# Workaround for https://bugzilla.xamarin.com/show_bug.cgi?id=59967
MCS_FLAGS = /features:peverify-compat /langversion:latest
LIBRARY_FLAGS =
ifndef CFLAGS
CFLAGS = -g -O2
endif
prefix = /usr/local
exec_prefix = $(prefix)
mono_libdir = $(exec_prefix)/lib
sysconfdir = $(prefix)/etc
#RUNTIME = mono
RUNTIME = false
MONO_PATH_TOP = $(topdir)/class/lib/$(PROFILE_DIRECTORY)
MONO_PATH_TESTS = $(MONO_PATH_TOP)/tests
TEST_MONO_PATH = $(MONO_PATH_TOP)$(PLATFORM_PATH_SEPARATOR)$(MONO_PATH_TESTS)$(PLATFORM_PATH_SEPARATOR).
TEST_RUNTIME = MONO_PATH="$(TEST_MONO_PATH)$(PLATFORM_PATH_SEPARATOR)$$MONO_PATH" $(RUNTIME) --debug

# In case you want to add MCS_FLAGS, this lets you not have to
# keep track of the default value

DEFAULT_MCS_FLAGS := $(MCS_FLAGS)
DEFAULT_PROFILE := net_4_x

# You shouldn't need to set these but might on a 
# weird platform.

# CC = cc
# SHELL = /bin/sh
# MAKE = gmake 
