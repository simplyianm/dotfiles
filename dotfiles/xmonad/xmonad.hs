import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig

myWorkspaces :: [[Char]]
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

myStartupHook :: X ()
myStartupHook = do
  spawnOn "1" "brave --profile-directory=Default"

  spawnOn "3" "kitty tmux"

  spawnOn "5" "Discord"
  spawnOn "5" "slack"
  spawnOn "5" "keybase-gui"
  spawnOn "5" "signal-desktop"
  spawnOn "5" "telegram-desktop"

  spawn "configure-monitors"

main :: IO ()
main =
  xmonad $
    docks $
      ewmh
        def
          { terminal = "kitty",
            handleEventHook = fullscreenEventHook,
            modMask = mod4Mask,
            workspaces = myWorkspaces,
            startupHook = myStartupHook
          }
        `additionalKeys` [ ((mod1Mask, xK_p), spawn "rofi -show run"),
                           ((mod4Mask, xK_space), spawn "rofi -show calc -modi calc -no-show-match -no-sort"),
                           ((mod1Mask, xK_Delete), spawn "xscreensaver-command -lock"),
                           ((mod1Mask, xK_z), spawn "rofi -show window"),
                           ((mod1Mask .|. shiftMask, xK_p), spawn "rofi-systemd")
                         ]
