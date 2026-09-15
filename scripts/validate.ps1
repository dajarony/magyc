param(
  [string]$FlutterExe = "C:\flutter\bin\flutter.bat",
  [string]$DartExe = "C:\flutter\bin\dart.bat"
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

foreach ($tool in @($FlutterExe, $DartExe)) {
  if (-not (Test-Path -LiteralPath $tool -PathType Leaf)) {
    throw "Toolchain no encontrado en: $tool"
  }
}

if (-not (Test-Path -LiteralPath "pubspec.yaml" -PathType Leaf)) {
  throw "Ejecuta este script desde la raiz del repositorio Magyc."
}

& $FlutterExe pub get
if ($LASTEXITCODE -ne 0) { throw "flutter pub get fallo." }

& $DartExe format --output=none --set-exit-if-changed lib test
if ($LASTEXITCODE -ne 0) { throw "dart format detecto cambios pendientes." }

& $FlutterExe analyze --fatal-infos --fatal-warnings
if ($LASTEXITCODE -ne 0) { throw "flutter analyze fallo." }

& $FlutterExe test
if ($LASTEXITCODE -ne 0) { throw "flutter test fallo." }

Write-Host "Magyc validado: dependencias, formato, analyzer y tests en verde."
