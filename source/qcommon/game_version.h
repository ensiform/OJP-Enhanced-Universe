// Copyright (C) 2000-2002 Raven Software, Inc.
//
#include "../win32/AutoVersion.h"

// Current version of the multi player game
#ifdef _DEBUG
	#define	Q3_VERSION		"(debug)OJP Enhanced Universe: v"VERSION_STRING_DOTTED
#elif defined FINAL_BUILD
	#define	Q3_VERSION		"OJP Enhanced Universe: v"VERSION_STRING_DOTTED
#else
	#define	Q3_VERSION		"(internal)OJP Enhanced Universe: v"VERSION_STRING_DOTTED
#endif

//end
