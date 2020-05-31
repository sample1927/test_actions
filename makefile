TARGET = app

SRCS  = $(shell find ./src     -type f -name *.cpp)
HEADS = $(shell find ./include -type f -name *.h)
OBJS = $(SRCS:.cpp=.o)
DEPS = Makefile.depend

INCLUDES = -I./include
CXXFLAGS = 02 -Wall $(INCLUDES)
LDFLAGS = 1m


all: $(TARGET)

$(TARGET): $(OBJS) $(HEDS)
	$(CXX)	$(LDFLAGS)	-o	$@	$(OBJS)

run: all
	@./$(TARGET)

.PHONY: depend clean
depend:
	$(CXX)	$(INCLUDS)	-MM	$(SRCS)	> $(DEPS)
	@sed -i -E "s/^(.+?).o: ([^ ]+?)\1/\2\1.o: \2\1/g"	$(DEPS)

clean:
	$(RM)	$(OBJS)	$(TARGET)

-include $(DEPS)
