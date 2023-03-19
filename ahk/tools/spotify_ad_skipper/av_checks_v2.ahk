; Original v1 code from here: https://www.autohotkey.com/boards/viewtopic.php?t=41872
; Started to be converted to v2
;   using a converter by mmikeww (via GitHub: https://github.com/mmikeww/AHK-v2-script-converter)
;   and my mediocre AHK knowledge
; Never finished, am just compiling the v1 script in a sandbox

Loop
	MsgBox(IsAudioPlaying())

Esc::ExitApp()
  
  
  
IsAudioPlaying() {
	global

	AudioLevel := 0.0
	VA_IAudioMeterInformation_GetPeakValue(VA_GetAudioMeter(), &AudioLevel)
	return (Round(AudioLevel, 4) > 0)
}

; ---------------------------------------------------------
; VA code credited to Lexikos, I merely cut it down to the minimum I needed

VA_GetAudioMeter(device_desc:="playback") {
	global
	if !(device := VA_GetDevice(device_desc))
		return 0
	VA_IMMDevice_Activate(device, "{C02216F6-8C67-4B5B-9D00-D008E73E0064}", 7, 0, &audioMeter)
	ObjRelease(device)
	return audioMeter
}

VA_GetDevice(device_desc:="playback") {
	global
	static CLSID_MMDeviceEnumerator := "{BCDE0395-E52F-467C-8E3D-C4579291692E}"        , IID_IMMDeviceEnumerator := "{A95664D2-9614-4F35-A746-DE8DB63617E6}"
	if !(deviceEnumerator := ComObject(CLSID_MMDeviceEnumerator, IID_IMMDeviceEnumerator))
		return 0
	
	device := 0
	
	if VA_IMMDeviceEnumerator_GetDevice(deviceEnumerator, device_desc, &device) = 0
		Goto("VA_GetDevice_Return")
	
	if isInteger(device_desc) {
		m2 := device_desc
		if (m2 >= 4096) ; Probably a device pointer, passed here indirectly via VA_GetAudioMeter or such.
		{
			ObjAddRef(device := m2)
			Goto("VA_GetDevice_Return")
		}
	}
	else
		RegExMatch(device_desc, "(.*?)\s*(?::(\d+))?$", &m)
	
	if (m1 ~= "^(?i:playback|p)$")
		m1 := "", flow := 0 ; eRender
	else     if (m1 ~= "^(?i:capture|c)$")
		m1 := "", flow := 1 ; eCapture
	else if (m1 . m2) = ""  ; no name or number specified
		m1 := "", flow := 0 ; eRender (default)
	else
		flow := 2 ; eAll
	
	if (m1 . m2) = "" {  ; no name or number (maybe "playback" or "capture")
		VA_IMMDeviceEnumerator_GetDefaultAudioEndpoint(deviceEnumerator, flow, 0, &device)
		Goto("VA_GetDevice_Return")
	}

	VA_IMMDeviceEnumerator_EnumAudioEndpoints(deviceEnumerator, flow, 1, &devices)
	
	if (m1 = "") {
		VA_IMMDeviceCollection_Item(devices, m2-1, &device)
		Goto("VA_GetDevice_Return")
	}
	
	VA_IMMDeviceCollection_GetCount(devices, &count)
	index := 0
	Loop &count
		if VA_IMMDeviceCollection_Item(devices, A_Index-1, &device) = 0
			if InStr(VA_GetDeviceName(device), m1) && (m2 = "" || ++index = m2)
				Goto("VA_GetDevice_Return")
			else
				ObjRelease(device), device:=0

	VA_GetDevice_Return:
		ObjRelease(deviceEnumerator)
		if devices
			ObjRelease(devices)
		
		Return(device) ; may be 0
}

VA_GetDeviceName(device) {
	global
	static PKEY_Device_FriendlyName
	if !VarSetStrCapacity(&PKEY_Device_FriendlyName) ; V1toV2: if 'PKEY_Device_FriendlyName' is NOT a UTF-16 string, use 'PKEY_Device_FriendlyName := Buffer()'
		VarSetStrCapacity(&PKEY_Device_FriendlyName, 20)        ,VA_GUID(&PKEY_Device_FriendlyName :="{A45C254E-DF1C-4EFD-8020-67D146A850E0}")        ,NumPut("UPtr", 14, PKEY_Device_FriendlyName, 16) ; V1toV2: if 'PKEY_Device_FriendlyName' is NOT a UTF-16 string, use 'PKEY_Device_FriendlyName := Buffer(20)'
	VarSetStrCapacity(&prop, 16) ; V1toV2: if 'prop' is NOT a UTF-16 string, use 'prop := Buffer(16)'
	VA_IMMDevice_OpenPropertyStore(device, 0, &store)
	; store->GetValue(.., [out] prop)
	DllCall(NumGet(NumGet(store+0, "UPtr")+5*A_PtrSize, "UPtr"), "ptr", store, "ptr", PKEY_Device_FriendlyName, "ptr", prop)
	ObjRelease(store)
	VA_WStrOut(&deviceName := NumGet(prop, 8))
	return deviceName
}

VA_WStrOut(&str) {
	global
	str := StrGet(ptr := str, "UTF-16")
	DllCall("ole32\CoTaskMemFree", "ptr", "ptr")  ; FREES THE STRING.
}
VA_GUID(&guid_out, guid_in:="%guid_out%") {
	global
	if (guid_in == "%guid_out%")
		guid_in :=   guid_out
	if isInteger(guid_in)
		return guid_in
	guid_out := Buffer(16, 0) ; V1toV2: if 'guid_out' is a UTF-16 string, use 'VarSetStrCapacity(&guid_out, 16)'
	DllCall("ole32\CLSIDFromString", "wstr", guid_in, "ptr", guid_out)
	return &guid_out
}
VA_IMMDevice_OpenPropertyStore(this, Access, &Properties) {
	global
	return DllCall(NumGet(NumGet(this+0, "UPtr")+4*A_PtrSize, "UPtr"), "ptr", this, "uint", Access, "ptr*", &Properties)
}
VA_IMMDevice_Activate(this, iid, ClsCtx, ActivationParams, &Interface) {
	global
	return DllCall(NumGet(NumGet(this+0, "UPtr")+3*A_PtrSize, "UPtr"), "ptr", this, "ptr", VA_GUID(&iid), "uint", ClsCtx, "uint", ActivationParams, "ptr*", &Interface)
}
VA_IMMDeviceEnumerator_GetDevice(this, id, &Device) {
	global
	return DllCall(NumGet(NumGet(this+0, "UPtr")+5*A_PtrSize, "UPtr"), "ptr", this, "wstr", id, "ptr*", &Device)
}
VA_IMMDeviceEnumerator_GetDefaultAudioEndpoint(this, DataFlow, Role, &Endpoint) {
	global
	return DllCall(NumGet(NumGet(this+0, "UPtr")+4*A_PtrSize, "UPtr"), "ptr", this, "int", DataFlow, "int", Role, "ptr*", &Endpoint)
}
VA_IMMDeviceEnumerator_EnumAudioEndpoints(this, DataFlow, StateMask, &Devices) {
	global
	return DllCall(NumGet(NumGet(this+0, "UPtr")+3*A_PtrSize, "UPtr"), "ptr", this, "int", DataFlow, "uint", StateMask, "ptr*", &Devices)
}
VA_IMMDeviceCollection_GetCount(this, &Count) {
	global
	return DllCall(NumGet(NumGet(this+0, "UPtr")+3*A_PtrSize, "UPtr"), "ptr", this, "uint*", &Count)
}
VA_IMMDeviceCollection_Item(this, Index, &Device) {
	global
	return DllCall(NumGet(NumGet(this+0, "UPtr")+4*A_PtrSize, "UPtr"), "ptr", this, "uint", Index, "ptr*", &Device)
}
VA_IAudioMeterInformation_GetPeakValue(this, &Peak) {
	global
	return DllCall(NumGet(NumGet(this+0, "UPtr")+3*A_PtrSize, "UPtr"), "ptr", this, "float*", &Peak)
}