@echo off
TITLE compilazione aviutl-italian-patch

:: Definizione delle variabili per le path
SET MINGW_PATH="Rimpiazzami"
SET AVIUTL_IT_PATH="Rimpiazzami"
SET AVIUTL_EN_PATH="Rimpiazzami"

:: Aggiungi la path di MinGW al PATH di sistema
SET PATH=%MINGW_PATH%;%PATH%

:: Compilazione delle risorse
windres.exe -v --input-format=rc --output-format=coff "%AVIUTL_IT_PATH%\it_resource.rc" -o "%AVIUTL_IT_PATH%\it_resource.res"
gcc -Os -m32 -s -o "%AVIUTL_IT_PATH%\it_mod.aul" -shared -Wl,-s "%AVIUTL_IT_PATH%\it_resource.res"

:: Messaggio di completamento compilazione
echo Compilazione finita!

:: Elimina il file esistente
del "%AVIUTL_EN_PATH%\it_mod.aul"

:: Copia il file compilato nella directory corretta
copy "%AVIUTL_IT_PATH%\it_mod.aul" "%AVIUTL_EN_PATH%\"

:: Messaggio di sostituzione
echo File sostituito!

:: Pausa per visualizzare il risultato
pause
