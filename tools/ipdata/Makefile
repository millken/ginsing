TARGET := ipdata 
MYSQL_FLAGS := $(shell mysql_config --cflags)
MYSQL_LIBS := $(shell mysql_config --libs)
CC := g++
SRC := $(wildcard *.c)
OBJ := $(patsubst %.c,%.o,$(SRC))
CFLAGS := -g -w -O2 -fno-stack-protector
$(TARGET):$(OBJ) 
	$(CC) $(CFLAGS) -o $@ $(MYSQL_FLAGS) $(OBJ) $(MYSQL_LIBS)

clean:
	rm -r $(TARGET) $(OBJ)
