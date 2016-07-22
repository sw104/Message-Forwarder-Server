#Variable definitions.
#Compilation variables:
CC = g++
CFLAGS = -g
LDFLAGS = -g
LDLIBS = 
#Directories:
SRCDIR = src/
OBJDIR = obj/
BINDIR = bin/
#File extensions:
SRCEXT = cc
OBJEXT = o
APPEXT = app
#Application name:
APP = server
#Files:
SRCS = $(shell find $(SRCDIR) -name *.$(SRCEXT))
OBJS = $(patsubst $(SRCDIR)%.$(SRCEXT), $(OBJDIR)%.$(OBJEXT), $(SRCS))

#Application linking rules.
all: $(APP)

$(APP) : $(OBJS)
	if [ ! -d "$(BINDIR)" ]; then mkdir $(BINDIR); fi
	$(CC) $(LDFLAGS) -o $(BINDIR)$(APP).$(APPEXT) $(OBJS) $(LDLIBS)

#Object file creation rules.
$(OBJDIR)%.$(OBJEXT) : $(SRCDIR)%.$(SRCEXT)
	if [ ! -d "$(OBJDIR)" ]; then mkdir $(OBJDIR); fi
	$(CXX) $(CFLAGS) -c $< -o $@

#Clean up files.
.PHONY : clean
clean : 
	rm $(OBJS) $(BINDIR)$(APP).$(APPEXT)
