# Make sure the user is not executing this script directly
if(NOT InSDK)
	message(FATAL_ERROR "Use the top-level cmake script!")
endif(NOT InSDK)

set(SDKUIHEADERS
	"${SRCDir}/cgame/animtable.h"
	"${SRCDir}/ui/keycodes.h"
	"${SRCDir}/ui/ui_force.h"
	"${SRCDir}/ui/ui_local.h"
	"${SRCDir}/ui/ui_public.h"
	"${SRCDir}/cgame/tr_types.h"

	"${SRCDir}/game/anims.h"
	"${SRCDir}/game/bg_local.h"
	"${SRCDir}/game/bg_public.h"
	"${SRCDir}/game/bg_saga.h"
	"${SRCDir}/game/bg_strap.h"
	"${SRCDir}/game/bg_weapons.h"
	"${SRCDir}/game/q_shared.h"
	"${SRCDir}/game/surfaceflags.h"

	"${SRCDir}/ui/ui_shared.h"

	"${SRCDir}/qcommon/qfiles.h"
	"${SRCDir}/qcommon/tags.h"

	"${SRCDir}/ghoul2/g2.h"
)

set(SDKUISOURCES
	"${SRCDir}/ui/ui_main.c" # keep this on top (qvm compiler needs VM_Main as the first compiled function)
	"${SRCDir}/ui/ui_atoms.c"
	"${SRCDir}/ui/ui_force.c"
	"${SRCDir}/ui/ui_gameinfo.c"
	"${SRCDir}/ui/ui_saber.c"
	"${SRCDir}/ui/ui_shared.c"
	"${SRCDir}/ui/ui_syscalls.c"

	"${SRCDir}/game/bg_misc.c"
	"${SRCDir}/game/bg_saga.c"
	"${SRCDir}/game/bg_vehicleLoad.c"
	"${SRCDir}/game/bg_weapons.c"
	"${SRCDir}/game/q_math.c"
	"${SRCDir}/game/q_shared.c"
)

set(SDKUIFILES
	${SDKUIHEADERS}
	${SDKUISOURCES}
)

add_library(${SDKUI} SHARED ${SDKUIFILES})

# Defines
set(SDKUIDefines ${SDKUIDefines} "_JK2" "UI_EXPORTS")
#set(SDKUIIncludeDirs ${MVGLOBALIncludeDirs})

set_target_properties(${SDKUI} PROPERTIES PREFIX "") # remove "lib" prefix for .so/.dylib files

set_property(TARGET ${SDKUI} APPEND PROPERTY COMPILE_DEFINITIONS
  $<$<CONFIG:Debug>:${GlobalDefines} ${SDKUIDefines} ${DebugDefines}>
  $<$<CONFIG:Release>:${GlobalDefines} ${SDKUIDefines} ${ReleaseDefines}>
  $<$<CONFIG:RelWithDebInfo>:${GlobalDefines} ${SDKUIDefines} ${ReleaseDefines}>
)

#set_target_properties(${SDKUI} PROPERTIES INCLUDE_DIRECTORIES "${SDKUIIncludeDirs}")
set_target_properties(${SDKUI} PROPERTIES PROJECT_LABEL "UI Module")
