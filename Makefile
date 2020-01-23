SOURCES=ptr.ml ptr-c.c crc.ml list2.ml expandarray.ml c_part.c \
	unicode.ml unicode-c.c threadpool.ml types.ml p.ml pack.ml \
	mp3read.ml mp3write.ml mp3info.ml mp3framehuffman-c.c \
	mp3framehuffman.ml mp3frameutils-c.c mp3frameutils.ml mp3queue.ml \
	mp3packer.ml
RESULT=mp3packer
THREADS=yes

OCAMLFLAGS="-unsafe-string"

SYSTEM := $(shell ocamlc -config 2>/dev/null | grep system | sed 's/system: //')

ifeq ($(SYSTEM),$(filter $(SYSTEM),mingw mingw64))
  MINGW=1
endif
ifeq ($(SYSTEM),win32)
  MSVC=1
endif
ifeq ($(SYSTEM),macosx)
  MACOSX=1
endif

ARCH := $(shell ocamlc -config 2>/dev/null | grep architecture | sed 's/architecture: //')

CFLAGS=-O2
LIBS=str

ifeq ($(SYSTEM),win32)
	LIBS := $(LIBS) unix Shell32.lib
else
	ifneq (, $(shell which ocamlopt.opt))
		OCAMLOPT=ocamlopt.opt
	endif # ifneq (, $(shell which ocamlopt.opt))
	ifeq ($(ARCH), amd64)
		CFLAGS := $(CFLAGS) -mfpmath=sse -msse4.1
		ifeq ($(SYSTEM),macosx)
			CFLAGS := $(CFLAGS) -arch x86_64
		endif # ifeq ($(SYSTEM),macosx)
	endif # ifeq ($(ARCH), amd64)
endif # ifneq ($(SYSTEM),win32)




	

all: nc

-include OCamlMakefile
