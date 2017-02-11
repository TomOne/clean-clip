#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#Include ahk-lib/WinClipAPI.ahk
#Include ahk-lib/WinClip.ahk
#Include ahk-lib/StdOutToVar.ahk

; Press Win key + v to paste the clean HTML into the current window
#v::
  clipboardHTML := WinClip.GetHTML()

  ; Replace one " with two " to properly escape them when passing it to the
  ; clean-html CLI tool
  clipboardHTMLDoubleQuotes := StrReplace(clipboardHTML, """", """""")

  ; Get the content inside the body tag (add the "s" option to match newlines with ".")
  RegExMatch(clipboardHTMLDoubleQuotes, "s)<body>(.*)</body>", match)
  clipboardHTMLBody := match1

  ; Pass the HTML to the CLI tool and enclose it with double quotes
  cleanHTML := StdOutToVar("node clean-html.js " . """" . clipboardHTMLBody . """")

  ; Set the new HTML clipboard content and remove any trailing newlines
  ; to prevent the addition of a non breaking space at the end.
  WinClip.SetHTML(RegExReplace(cleanHTML, "`n$", ""))
  WinClip.Paste()

return
