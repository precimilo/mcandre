# Run inside of a Visual Studio command line environment
#
# Example:
#
# C:\>nmake /f Makefile.mf

CC = "cl" # Replace with your compiler
DELETE = "del"
EXECUTABLE = "args.exe"

all: args.c join.h
	$(DELETE) $(EXECUTABLE)
	$(CC) /EHsc /D WIN32 args.c /Fe$(EXECUTABLE)
	$(DELETE) *.obj

clean:
	$(DELETE) $(EXECUTABLE)