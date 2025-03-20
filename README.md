# Guided Project - Entwicklung einer VR-Anwendung mit der Godot-Engine
Contributor: Methusshan Elankumaran

In diesem Projekt werden einzelne Basis VR-Features in Unity und Godot umgesetzt, um die beiden Game-Engines zu vergleichen. In diesem Repository befindet sich die Godot-Implementation.
Hierbei sind folgende Features implementiert:
- Greifen von Objekten mit einem Ray und direkter Interaktion
- Bewegung im VR-Raum durch Teleportation und direkter Bewegung
- Nutzung einer UI zur Steuerung der VR-Welt und Einstellugen
   
## Installation von Godot
Um Godot verwenden zu können, muss erstmal der die Godot Engine über folgenden Link heruntergeladen werden. https://godotengine.org/download/windows/
Nach der Installation muss zusätzlich die OpenJDK 17 und Android Studio heruntergeladen werden, um darüber die Android SDK heunterzuladen.
Hierbei muss in Android Studio folgendes heruntergeladen werden.
- Android SDK Platform-Tools 34.0.0 oder neuer
- Android SDK Build-Tools 34.0.0
- Android SDK Platform 34
- Android SDK Command-line Tools
- CMake version 3.10.2.4988404
- NDK version r23c (23.2.8568313)

Nach der Installation der SDKs müssen diese im Editor eingebunden werden. Dafür müssen die Editoreinstellungen unter Editor -> Editoreinstellungen öffnen
Unter Export -> Android muss der Pfad zur heruntergeladenen OpenJDK 17 hinterlegt werden.

Danach muss die Androidbuildvorlage installiert werden. Im Tab Projekt befindet sich der dazugehörige Menüpunkt.
Um die OpenXR Funktionen nutzen zu können, muss außerdem aus dem Asset Library das Godot OpenXR Venders Plugin for Godot 4.3 heruntergeladen werden.

Um eine Anwendung exportieren zu können, müss in unter Projekt -> Export -> Einfügen ein Android Preset erstellt werden. Hierbei muss bei den XR Features das Plugin für die passende VR-Brille aktiviert werden.

## Starten des Projektes auf der Meta Quest

### Ohne Meta Quest Link
Um ein Projekt ohne Quest Link zu starten, muss dieses auf der Brille gebuildet werden. Hierfür muss die Brille mit einem USB-Kabel an den PC angeschlossen werden und den One-Click-Deploy Button drücken. Dieses ist der Button rechts neben den Stop-Button. 
Bei erfolgreichem Build startet die Anwendung daraufhin auf der Brille

### Mit Quest Link
Wenn die Brille über Quest Link mit dem PC verbunden ist, muss in Godot nur der Playbutton gedrückt werden.
