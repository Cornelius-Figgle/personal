# Ahk & Py class translations

ahk is confusing, just created this to explain it as Python

## Syntax Conversions

| Ahk v2 | Py |
| - | - |
| `__New()` | `__init__()` |
| `class ClassName extends BaseClass` | `class ClassName(BaseClass)` |
| `this.var` | `self.var` |

## Additional Notes

- (`this` does not need to be passed into class methods, unlike `self`)

## Sample Code

```ahk2
class SpAdSkpr_ extends Object {
    __New(some_param) {  ; called when class is invoked
        this.TargetWindow := "ahk_exe Spotify.exe"
        this.ValidWindowTitles := ["Spotify Free", "Frank Joshua"]

        MsgBox(some_param)
    }

    __Delete() {  ; called when class is deleted
    }


    SkipViaRestart() {
        MsgBox("test: " . this.TargetWindow)
    }
}

obj := SpAdSkpr_("arg")
obj.SkipViaRestart()
obj.TargetWindow := "new var"
obj.SkipViaRestart()
```
