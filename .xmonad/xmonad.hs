import XMonad 
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import System.IO

main = do
	xmproc <- spawnPipe "/usr/bin/xmobar /home/robert/.xmobarrc"
	xmonad $ defaultConfig
		{ manageHook = manageDocks <+> manageHook defaultConfig
		, layoutHook = avoidStruts $ layoutHook defaultConfig
		, logHook = dynamicLogWithPP xmobarPP
				{ ppOutput = hPutStrLn xmproc
				, ppTitle = xmobarColor "green" "" . shorten 50
				}
		}
