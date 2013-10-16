CTAGS = ctags -x >tags
CC = g++
CFLAGS = -g -I.
DEPEND = makedepend $(CFLAGS)

SRCS = dgraph.cpp dijkstra.cpp fheap.cpp
SRCS_ACES = run_aces.cpp
SRCS_FA = run_fullAdaptive.cpp
SRCS_SL = run_southLast.cpp
HEADERS = dgraph.h dijkstra.h fheap.h heap.h

OBJS = $(SRCS:.cpp=.o)
OBJS_ACES = $(SRCS_ACES:.cpp=.o)
OBJS_FA = $(SRCS_FA:.cpp=.o)
OBJS_SL = $(SRCS_SL:.cpp=.o)

all: aces

$(OBJS):
	$(CC) $(CFLAGS) -c $*.cpp

$(OBJS_ACES):
	$(CC) $(CFLAGS) -c $*.cpp

$(OBJS_FA):
	$(CC) $(CFLAGS) -c $*.cpp

$(OBJS_SL):
	$(CC) $(CFLAGS) -c $*.cpp

aces: $(OBJS_ACES) $(OBJS) $(HEADERS)
	$(CC) -o $@ $(OBJS_ACES) $(OBJS)

fullAdaptive: $(OBJS_FA) $(OBJS) $(HEADERS)
	$(CC) -o $@ $(OBJS_FA) $(OBJS)

southLast: $(OBJS_SL) $(OBJS) $(HEADERS)
	$(CC) -o $@ $(OBJS_SL) $(OBJS)

tags: $(SRCS) $(SRCS_ACES) $(SRCS_FA) $(SRCS_SL)
	$(CTAGS) $(SRCS) $(SRCS_ACES) $(SRCS_FA) $(SRCS_SL)

lint: $(SRCS) $(SRCS_ACES) $(SRCS_FA) $(SRCS_SL)
	lint $(CFLAGS) $(SRCS) $(SRCS_ACES) $(SRCS_FA) $(SRCS_SL)

depend: $(SRCS) $(SRCS_ACES) $(SRCS_FA) $(SRCS_SL)
	$(DEPEND) $(SRCS) $(SRCS_ACES) $(SRCS_FA) $(SRCS_SL)

clean: 
	-rm printenv *~ *.o *.bak core tags

# DO NOT DELETE THIS LINE -- make depend depends on it

dgraph.o: dgraph.h dgraph.cpp
dijkstra.o: dijkstra.h dgraph.h heap.h dijkstra.cpp
fheap.o: fheap.h heap.h fheap.cpp
run_aces.o: dgraph.h dijkstra.h fheap.h heap.h run_aces.cpp
run_fullAdaptive.o: dgraph.h dijkstra.h fheap.h heap.h run_fullAdaptive.cpp
run_southLast.o: dgraph.h dijkstra.h fheap.h heap.h run_southLast.cpp
