import XMonad
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- Talk with xmobar
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce

import XMonad.Layout.OneBig
import XMonad.Layout.Spacing

import XMonad.Actions.CycleWS
import XMonad.Actions.WorkspaceNames

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    ]
    ++

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]


myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

myEventHook = mempty ()

myLogHook :: X()
myLogHook = return ()
  

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "nitrogen --restore"
  spawnOnce "picom --experimental-backends"
  spawnOnce "redshift -P -O 4500"

myLayoutHook = spacingWithEdge 8 $ Tall 1 (3/100) (1/2) ||| OneBig (3/4) (3/4) ||| Full

myKeymaps = [
    --System keymaps
    ("M-q"          , kill),
    ("M-S-q"        , io (exitWith ExitSuccess)),
    ("M-S-r"        , spawn "xmonad --recompile; xmonad --restart"),

    --Application keymaps
    ("M-d"          , spawn "rofi -show drun"           ),
    ("M-<Return>"   , spawn "kitty"                     ),
    ("M-S-<Return>" , spawn "google-chrome-stable"      ),

    --Layout keymaps
    ("M-f"        , sendMessage $ JumpToLayout "Full"),
    ("M-t"        , sendMessage $ JumpToLayout "Tall"),
    ("M-o"        , sendMessage $ JumpToLayout "OneBig 0.75 0.75"),

    --Function keymap
    ("<XF86MonBrightnessUp>"          ,incBrightness ),
    ("<XF86MonBrightnessDown>"        ,decBrightness ),
    ("<XF86AudioRaiseVolume>"           ,raiseVolume ),
    ("<XF86AudioLowerVolume>"           ,lowerVolume )
  ]

myConfig = def {
  terminal           = "kitty",
  focusFollowsMouse  = False,
  workspaces         = myWorkspaces,
 
  borderWidth        = 2,
  modMask            = mod4Mask,

  focusedBorderColor = "#56b6c2",

-- hooks, layouts
  manageHook         = myManageHook,
  handleEventHook    = myEventHook,
  logHook            = myLogHook,
  startupHook        = myStartupHook,
  layoutHook         = myLayoutHook
}

mySB = statusBarProp "xmobar" (workspaceNamesPP xmobarPP)
main = xmonad $ withEasySB mySB defToggleStrutsKey $ myConfig
  `additionalKeysP` myKeymaps


reloadStatusBars :: X ()
reloadStatusBars = do
  killAllStatusBars
  spawnStatusBar "xmobar"

incBrightness = do
  spawn "light -A 10"
  reloadStatusBars

decBrightness = do
  spawn "light -U 10"
  reloadStatusBars

raiseVolume = do
  spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%"

lowerVolume = do
  spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%"
