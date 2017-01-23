SRCDIR := src
INCDIR := include
OBJDIR := obj
OUTDIR := out

SRCS := main.c graph.c
OBJS := $(patsubst %.c,%.o, $(SRCS))
EXE  := main

VPATH := $(SRCDIR)

CWARN := all extra pedantic
CINCLUDES := $(INCDIR)
COPTS := g ggdb O2 std=c99

CFLAGS := $(addprefix -W, $(CWARN)) $(addprefix -, $(COPTS)) -I$(INCDIR)

.PHONY := all depend clean

all: $(EXE) depend

$(EXE): $(OBJS)

depend: .depend

.depend: $(SRCS)
	$(CC) $(CFLAGS) -MM $^ -MF  ./.depend;

include .depend

clean:
	$(RM) $(OBJS)
	$(RM) $(EXE)
