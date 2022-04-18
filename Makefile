CXXFLAGS += -std=c++11

# Header files and libraries for Google Protocol Buffers
PROTOC = protoc
ifneq ($(PROTOBUF_HOME),)
  PROTOC := $(PROTOBUF_HOME)/bin/protoc
  CXXFLAGS += -I$(PROTOBUF_HOME)/include
  LDFLAGS += -L$(PROTOBUF_HOME)/lib
endif
LIBS += -lprotobuf

all: libaddressbook.so

clean:
	rm -f addressbook.pb.h addressbook.pb.cc libaddressbook.so

libaddressbook.so: addressbook.pb.cc
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(LIBS) -fPIC -shared -o $@ $^

%.pb.cc %.pb.h: %.proto
	$(PROTOC) --cpp_out=$$PWD $<
