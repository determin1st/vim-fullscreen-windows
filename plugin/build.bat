@echo off

set FILENAME=gvim-maximize
set FILE32=%FILENAME%-32
set FILE64=%FILENAME%-64

:: have to have both SDK and VS
set SDK=D:\soft\DEV\ms-windows-sdk-10
set SDKINC=%SDK%\Include\10.0.20348.0
set SDKLIB=%SDK%\Lib\10.0.20348.0
set VS=D:\soft\DEV\ms-visual-studio-10
:: include directories
:: VS should go after SDK
set INC=
::set INC=%INC% /FI "%VS%\VC\include\intrin.h"
set INC=%INC% /I "%SDKINC%\um"
set INC=%INC% /I "%SDKINC%\shared"
set INC=%INC% /I "%SDKINC%\winrt"
set INC=%INC% /I "%VS%\VC\include"
set INC=%INC% /I "%VS%\VC\atlmfc\include"
:: predefined macros
set MAC32=
set MAC32=%MAC32% /D _M_IX86=1
set MAC32=%MAC32% /D _WIN32=1
set MAC64=
set MAC64=%MAC64% /D _M_AMD64=1
set MAC64=%MAC64% /D _WIN64=1
:: compiler options
set OPT=
set OPT=/c /MD /Os /X /clang:-std=c17
set OPT=%OPT% /clang:-Wno-nonportable-include-path
set OPT=%OPT% /clang:-Wno-implicit-int
set OPT=%OPT% /clang:-Wno-pragma-pack
set OPT=%OPT% /clang:-Wno-microsoft-anon-tag
set OPT=%OPT% /clang:-Wno-ignored-pragma-intrinsic
set OPT=%OPT% -fms-compatibility -fms-extensions
set OPT=%OPT% -fmsc-version=1600
set OPT=%OPT% -ferror-limit=5
set OPT32=%OPT% --target=i686-pc-windows-msvc
set OPT32=%OPT32% /o %FILE32%
set OPT64=%OPT% --target=amd64-pc-windows-msvc
set OPT64=%OPT64% /o %FILE64%

clang-cl %OPT32% %MAC32% %INC% %FILENAME%.c
clang-cl %OPT64% %MAC64% %INC% %FILENAME%.c

set LIB32=
set LIB32=%LIB32% /libpath:"%VS%\VC\lib"
set LIB32=%LIB32% /libpath:"%VS%\VC\atlmfc\lib"
set LIB32=%LIB32% /libpath:"%SDKLIB%\um\x86"
set LIB64=
set LIB64=%LIB64% /libpath:"%VS%\VC\lib\amd64"
set LIB64=%LIB64% /libpath:"%VS%\VC\atlmfc\lib\amd64"
set LIB64=%LIB64% /libpath:"%SDKLIB%\um\x64"
set OPT=
set OPT=%OPT% /dll
:: lets put all libraries explicitly,
:: default for example includes OLDNAMES.LIB,
:: you may read that shit: https://devblogs.microsoft.com/oldnewthing/20200730-00/?p=104021
:: from chineese agent, he also puts a link to ms docs
:: telling howto disable it, but i banned that network
:: because it serves as ms telemetry, anyway its not needed,
:: may be replaced with MSVCRT.LIB
set OPT=%OPT% /nodefaultlib
:: default entry may have initializer,
:: memory manager and a whole bunch of other stuff
set OPT=%OPT% /noentry
:: filealign sets the distance between code and data,
:: defaults are from 512 bytes to 4KB
set OPT=%OPT% /filealign:512
set OPT=%OPT% /lldignoreenv
set OPT32=%OPT% /machine:x86
set OPT32=%OPT32% /out:%FILE32%.dll
set OPT64=%OPT% /machine:x64
set OPT64=%OPT64% /out:%FILE64%.dll

lld-link %LIB32% %OPT32% %FILE32%.obj @build.txt
lld-link %LIB64% %OPT64% %FILE64%.obj @build.txt

:: cleanup
del *.obj *.lib

