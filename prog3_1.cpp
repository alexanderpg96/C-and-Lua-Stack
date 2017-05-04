#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>

#include "lua.hpp"
#include "lualib.h"
#include "lauxlib.h"

using namespace std;

int main(int argc, char** argv) {

    cout << "Assignment #3-3, Alexander Pearson-Goulart, pearsongoulart@gmail.com\n";

    lua_State *L;

    string file = argv[1];

    char buff[256];

    L = luaL_newstate();
    luaL_openlibs(L);

    luaL_dofile(L, file.c_str()); // tells C about the lua file.

    while(1 == 1) {
        luaL_dostring(L, buff); 
    }

    lua_close(L);

}
