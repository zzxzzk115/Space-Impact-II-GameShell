WORKDIR = `pwd`

CC = gcc
CXX = g++
AR = ar
LD = g++
WINDRES = windres

INC = -I /usr/include/SDL
CFLAGS = -pedantic -Wall -fpermissive
RESINC = 
LIBDIR = -L /usr/lib/arm-linux-gnueabihf/
LIB = -lSDLmain -lSDL -lSDL_gfx -lSDL_ttf -lSDL_image -lSDL_mixer  -lpthread
LDFLAGS =

INC_DEBUG = $(INC)
CFLAGS_DEBUG = $(CFLAGS) -pedantic -Wextra -Wall -g
RESINC_DEBUG = $(RESINC)
RCFLAGS_DEBUG = $(RCFLAGS)
LIBDIR_DEBUG = $(LIBDIR)
LIB_DEBUG = $(LIB)
LDFLAGS_DEBUG = $(LDFLAGS)
OBJDIR_DEBUG = obj/Debug
DEP_DEBUG = 
OUT_DEBUG = bin/Debug/Space_Impact_II_GameShell

INC_RELEASE = $(INC)
CFLAGS_RELEASE =  -fexpensive-optimizations -Os -pedantic -Wextra -Wall -fpermissive
RESINC_RELEASE = $(RESINC)
RCFLAGS_RELEASE = $(RCFLAGS)
LIBDIR_RELEASE = $(LIBDIR)
LIB_RELEASE = $(LIB)
LDFLAGS_RELEASE = $(LDFLAGS) -s
OBJDIR_RELEASE = obj/Release
DEP_RELEASE = 
OUT_RELEASE = bin/Release/Space_Impact_II_GameShell

OBJ_DEBUG = $(OBJDIR_DEBUG)/util.o $(OBJDIR_DEBUG)/shotlist.o $(OBJDIR_DEBUG)/scenery.o $(OBJDIR_DEBUG)/saves.o $(OBJDIR_DEBUG)/main.o $(OBJDIR_DEBUG)/audio.o $(OBJDIR_DEBUG)/graphics.o $(OBJDIR_DEBUG)/font.o $(OBJDIR_DEBUG)/enemies.o

OBJ_RELEASE = $(OBJDIR_RELEASE)/util.o $(OBJDIR_RELEASE)/shotlist.o $(OBJDIR_RELEASE)/scenery.o $(OBJDIR_RELEASE)/saves.o $(OBJDIR_RELEASE)/main.o $(OBJDIR_RELEASE)/audio.o $(OBJDIR_RELEASE)/graphics.o $(OBJDIR_RELEASE)/font.o $(OBJDIR_RELEASE)/enemies.o

all: debug release

clean: clean_debug clean_release

before_debug: 
	test -d bin/Debug || mkdir -p bin/Debug
	test -d $(OBJDIR_DEBUG) || mkdir -p $(OBJDIR_DEBUG)

after_debug: 

debug: before_debug out_debug after_debug

out_debug: before_debug $(OBJ_DEBUG) $(DEP_DEBUG)
	$(LD) $(LIBDIR_DEBUG) -o $(OUT_DEBUG) $(OBJ_DEBUG)  $(LDFLAGS_DEBUG) $(LIB_DEBUG)

$(OBJDIR_DEBUG)/util.o: util.c
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c util.c -o $(OBJDIR_DEBUG)/util.o

$(OBJDIR_DEBUG)/shotlist.o: shotlist.c
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c shotlist.c -o $(OBJDIR_DEBUG)/shotlist.o

$(OBJDIR_DEBUG)/scenery.o: scenery.c
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c scenery.c -o $(OBJDIR_DEBUG)/scenery.o

$(OBJDIR_DEBUG)/saves.o: saves.c
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c saves.c -o $(OBJDIR_DEBUG)/saves.o

$(OBJDIR_DEBUG)/main.o: main.c 
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c main.c -o $(OBJDIR_DEBUG)/main.o

$(OBJDIR_DEBUG)/audio.o: audio.c
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c audio.c -o $(OBJDIR_DEBUG)/audio.o

$(OBJDIR_DEBUG)/graphics.o: graphics.c
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c graphics.c -o $(OBJDIR_DEBUG)/graphics.o

$(OBJDIR_DEBUG)/font.o: font.c
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c font.c -o $(OBJDIR_DEBUG)/font.o

$(OBJDIR_DEBUG)/enemies.o: enemies.c
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c enemies.c -o $(OBJDIR_DEBUG)/enemies.o

clean_debug: 
	rm -f $(OBJ_DEBUG) $(OUT_DEBUG)
	rm -rf bin/Debug
	rm -rf $(OBJDIR_DEBUG)

before_release: 
	test -d bin/Release || mkdir -p bin/Release
	test -d $(OBJDIR_RELEASE) || mkdir -p $(OBJDIR_RELEASE)

after_release: 

release: before_release out_release after_release

out_release: before_release $(OBJ_RELEASE) $(DEP_RELEASE)
	$(LD) $(LIBDIR_RELEASE) -o $(OUT_RELEASE) $(OBJ_RELEASE)  $(LDFLAGS_RELEASE) $(LIB_RELEASE)

$(OBJDIR_RELEASE)/util.o: util.c
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c util.c -o $(OBJDIR_RELEASE)/util.o

$(OBJDIR_RELEASE)/shotlist.o: shotlist.c
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c shotlist.c -o $(OBJDIR_RELEASE)/shotlist.o

$(OBJDIR_RELEASE)/scenery.o: scenery.c
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c scenery.c -o $(OBJDIR_RELEASE)/scenery.o

$(OBJDIR_RELEASE)/saves.o: saves.c
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c saves.c -o $(OBJDIR_RELEASE)/saves.o

$(OBJDIR_RELEASE)/main.o: main.c
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c main.c -o $(OBJDIR_RELEASE)/main.o

$(OBJDIR_RELEASE)/audio.o: audio.c
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c audio.c -o $(OBJDIR_RELEASE)/audio.o

$(OBJDIR_RELEASE)/graphics.o: graphics.c
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c graphics.c -o $(OBJDIR_RELEASE)/graphics.o

$(OBJDIR_RELEASE)/font.o: font.c
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c font.c -o $(OBJDIR_RELEASE)/font.o

$(OBJDIR_RELEASE)/enemies.o: enemies.c
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c enemies.c -o $(OBJDIR_RELEASE)/enemies.o

clean_release: 
	rm -f $(OBJ_RELEASE) $(OUT_RELEASE)
	rm -rf bin/Release
	rm -rf $(OBJDIR_RELEASE)

.PHONY: before_debug after_debug clean_debug before_release after_release clean_release

