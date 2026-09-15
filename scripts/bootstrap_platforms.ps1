param(
  [string]$FlutterExe = "C:\flutter\bin\flutter.bat"
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

if (-not (Test-Path -LiteralPath $FlutterExe -PathType Leaf)) {
  throw "Flutter no encontrado en: $FlutterExe"
}

if (-not (Test-Path -LiteralPath "pubspec.yaml" -PathType Leaf)) {
  throw "Ejecuta este script desde la raiz del repositorio Magyc."
}

if (-not (Test-Path -LiteralPath ".git")) {
  throw "No se detecta un checkout Git."
}

$dirtyTracked = git status --porcelain --untracked-files=no
if ($dirtyTracked) {
  throw "Hay cambios tracked sin commit. Deja el checkout limpio antes de generar plataformas."
}

Write-Host "Generando scaffolding Flutter para Android y Windows..."
& $FlutterExe create --platforms=android,windows --project-name magyc .
if ($LASTEXITCODE -ne 0) {
  throw "flutter create fallo con codigo $LASTEXITCODE"
}

$protectedChanges = git status --porcelain -- lib pubspec.yaml
if ($protectedChanges) {
  Write-Warning "flutter create intento modificar archivos protegidos. Restaurando lib/ y pubspec.yaml."
  git restore --source=HEAD --worktree --staged -- lib pubspec.yaml
  throw "Scaffolding abortado: revisa por que Flutter intento tocar lib/ o pubspec.yaml."
}

if (-not (Test-Path -LiteralPath "android" -PathType Container)) {
  throw "No se genero android/."
}

if (-not (Test-Path -LiteralPath "windows" -PathType Container)) {
  throw "No se genero windows/."
}

Write-Host "Plataformas generadas sin tocar lib/ ni pubspec.yaml."
Write-Host "Siguiente paso: ejecuta scripts\validate.ps1 y despues flutter run."
