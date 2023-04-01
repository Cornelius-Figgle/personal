# Ahk & Py class translations

ahk is confusing, just created this to explain it as Python

| Ahk v2 | Py |
| - | - |
| `__New()` | `__init__()` |
| `class ClassName extends BaseClass` | `class ClassName(BaseClass)` |
| `this.var` | `self.var` (`this` does not need to be passed into class methods, unlike `self`) |

```ahk2
class SpAdSkpr_ extends Object {
    __New() {  ; called when class is invoked
        this.TargetWindow := "ahk_exe spotify.exe"
        this.ValidWindowTitles := ["Spotify Free", "Frank Joshua"]
    }

    __Delete() {  ; called when class is deleted
    }


    SkipViaRestart() {
        MsgBox("test: " . this.TargetWindow)
    }
}

obj := SpAdSkpr_()
obj.SkipViaRestart()
obj.TargetWindow := "new var"
obj.SkipViaRestart()
```
