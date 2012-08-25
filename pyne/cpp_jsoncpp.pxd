"""C++ wrapper for jsoncpp."""
from libc.string cimport const_char
cimport std

cdef extern from "json/json.h" namespace "Json":
    cdef enum ValueType:
        nullValue,
        intValue,      
        uintValue,     
        realValue,     
        stringValue,   
        booleanValue,  
        arrayValue,    
        objectValue 

    cdef cppclass Value:
        Value null

        Value() except +
        Value(ValueType) except +
        Value(char *) except +
        Value(std.string) except +
        Value(double) except +
        Value(int) except +
        Value(bint) except +
        Value(bint, enum) except +
        Value(Value &) except +

        const_char * asCString() except +
        std.string asString() except +
        int asInt() except +
        #uint asUInt() except +
        #double int asInt64() except +
        #double uint asUInt64() except +
        float asFloat() except +
        double asDouble() except +
        bint asBool() except +

        bint isNull() except +
        bint isBool() except +
        bint isInt() except +
        bint isUInt() except +
        bint isIntegral() except +
        bint isDouble() except +
        bint isNumeric() except +
        bint isString() except +
        bint isArray() except +
        bint isObject() except +
        ValueType type() except +

        Value get(int, Value) except +
        Value get(std.string, Value) except +
        Value & operator[](int) except +
        Value & operator[](std.string) except +
        Value & operator[](const_char *) except +
        void swap(Value &) except +
        #Value & operator=(Value &) except +
        Value removeMember(std.string) except +
        Value removeMember(const_char *) except +

        bint isMember(std.string) except +
        bint isMember(const_char *) except +

        int size() except +
        void resize(int) except +

    cdef cppclass Reader:
        Reader() except +
        bint parse(std.string, Value) except +
        bint parse(std.string, Value, bint) except +