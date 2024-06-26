﻿# Make sure the user is not executing this script directly
if(NOT InSDK)
	message(FATAL_ERROR "Use the top-level cmake script!")
endif(NOT InSDK)

set(SDKCGAMEHEADERS
	"${SRCDir}/cgame/animtable.h"
	"${SRCDir}/cgame/cg_camera.h"
	"${SRCDir}/cgame/cg_holster.h"
	"${SRCDir}/cgame/cg_lights.h"
	"${SRCDir}/cgame/cg_local.h"
	"${SRCDir}/cgame/cg_public.h"
	"${SRCDir}/cgame/fx_local.h"
	"${SRCDir}/cgame/tr_types.h"

	"${SRCDir}/game/anims.h"
	"${SRCDir}/game/bg_local.h"
	"${SRCDir}/game/bg_public.h"
	"${SRCDir}/game/bg_saga.h"
	"${SRCDir}/game/bg_strap.h"
	"${SRCDir}/game/bg_vehicles.h"
	"${SRCDir}/game/bg_weapons.h"
	"${SRCDir}/game/q_shared.h"
	"${SRCDir}/game/surfaceflags.h"

	"${SRCDir}/ui/ui_shared.h"

	"${SRCDir}/qcommon/qfiles.h"
	"${SRCDir}/qcommon/tags.h"

	"${SRCDir}/ghoul2/g2.h"
)

set(SDKCGAMESOURCES
	"${SRCDir}/cgame/cg_main.c" # keep this on top (qvm compiler needs VM_Main as the first compiled function)
	"${SRCDir}/cgame/cg_camera.c"
	"${SRCDir}/cgame/cg_consolecmds.c"
	"${SRCDir}/cgame/cg_draw.c"
	"${SRCDir}/cgame/cg_drawtools.c"
	"${SRCDir}/cgame/cg_effects.c"
	"${SRCDir}/cgame/cg_ents.c"
	"${SRCDir}/cgame/cg_event.c"
	"${SRCDir}/cgame/cg_holster.c"
	"${SRCDir}/cgame/cg_info.c"
	"${SRCDir}/cgame/cg_light.c"
	"${SRCDir}/cgame/cg_localents.c"
	"${SRCDir}/cgame/cg_marks.c"
	"${SRCDir}/cgame/cg_newDraw.c"
	"${SRCDir}/cgame/cg_players.c"
	"${SRCDir}/cgame/cg_playerstate.c"
	"${SRCDir}/cgame/cg_predict.c"
	"${SRCDir}/cgame/cg_saga.c"
	"${SRCDir}/cgame/cg_scoreboard.c"
	"${SRCDir}/cgame/cg_servercmds.c"
	"${SRCDir}/cgame/cg_snapshot.c"
	"${SRCDir}/cgame/cg_strap.c"
	"${SRCDir}/cgame/cg_syscalls.c"
	"${SRCDir}/cgame/cg_turret.c"
	"${SRCDir}/cgame/cg_view.c"
	"${SRCDir}/cgame/cg_weaponinit.c"
	"${SRCDir}/cgame/cg_weapons.c"
	"${SRCDir}/cgame/fx_blaster.c"
	"${SRCDir}/cgame/fx_bowcaster.c"
	"${SRCDir}/cgame/fx_bryarpistol.c"
	"${SRCDir}/cgame/fx_demp2.c"
	"${SRCDir}/cgame/fx_disruptor.c"
	"${SRCDir}/cgame/fx_flechette.c"
	"${SRCDir}/cgame/fx_force.c"
	"${SRCDir}/cgame/fx_heavyrepeater.c"
	"${SRCDir}/cgame/fx_rocketlauncher.c"

	"${SRCDir}/game/AnimalNPC.c"
	"${SRCDir}/game/bg_g2_utils.c"
	"${SRCDir}/game/bg_misc.c"
	"${SRCDir}/game/bg_panimate.c"
	"${SRCDir}/game/bg_pmove.c"
	"${SRCDir}/game/bg_saber.c"
	"${SRCDir}/game/bg_saberLoad.c"
	"${SRCDir}/game/bg_saga.c"
	"${SRCDir}/game/bg_slidemove.c"
	"${SRCDir}/game/bg_vehicleLoad.c"
	"${SRCDir}/game/bg_weapons.c"
	"${SRCDir}/game/FighterNPC.c"
	"${SRCDir}/game/q_math.c"
	"${SRCDir}/game/q_shared.c"
	"${SRCDir}/game/SpeederNPC.c"
	"${SRCDir}/game/WalkerNPC.c"
	
	"${SRCDir}/ui/ui_shared.c"
)

set(SDKCGAMEFILES
	${SDKCGAMEHEADERS}
	${SDKCGAMESOURCES}
)

add_library(${SDKCGAME} SHARED ${SDKCGAMEFILES})

# Defines
set(SDKCGAMEDefines ${SDKCGAMEDefines} "_JK2" "CGAME")
#set(SDKCGAMEIncludeDirs ${MVGLOBALIncludeDirs})

set_target_properties(${SDKCGAME} PROPERTIES PREFIX "") # remove "lib" prefix for .so/.dylib files

set_property(TARGET ${SDKCGAME} APPEND PROPERTY COMPILE_DEFINITIONS
  $<$<CONFIG:Debug>:${GlobalDefines} ${SDKCGAMEDefines} ${DebugDefines}>
  $<$<CONFIG:Release>:${GlobalDefines} ${SDKCGAMEDefines} ${ReleaseDefines}>
  $<$<CONFIG:RelWithDebInfo>:${GlobalDefines} ${SDKCGAMEDefines} ${ReleaseDefines}>
)

#set_target_properties(${SDKCGAME} PROPERTIES INCLUDE_DIRECTORIES "${SDKCGAMEIncludeDirs}")
set_target_properties(${SDKCGAME} PROPERTIES PROJECT_LABEL "CGame Module")
