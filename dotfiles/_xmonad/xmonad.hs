import XMonad
import XMonad.Config.Gnome
import XMonad.Hooks.SetWMName

main = xmonad gnomeConfig
        { modMask = mod4Mask -- Use Super instead of Alt
        , terminal    = "gnome-terminal"
        , borderWidth = 4
        , startupHook = setWMName "LG3D"
        }
