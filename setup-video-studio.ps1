param([string]$PythonExecutable = "$env:LOCALAPPDATA\Programs\Python\Python312\python.exe")
$ErrorActionPreference = 'Stop'
if (!(Test-Path -LiteralPath $PythonExecutable)) { throw 'Pass -PythonExecutable with a working Python 3.12+ path.' }
Push-Location $PSScriptRoot
try {
  & $PythonExecutable -m venv .venv
  if ($LASTEXITCODE -ne 0) { throw 'Python environment creation failed.' }
  & .\.venv\Scripts\python.exe -m pip install -r requirements.txt imageio-ffmpeg
  if ($LASTEXITCODE -ne 0) { throw 'Python dependency installation failed.' }
  Push-Location remotion-composer
  try {
    & npm.cmd ci
    if ($LASTEXITCODE -ne 0) { throw 'Remotion install failed.' }
    & npx.cmd --no-install remotion browser ensure
    if ($LASTEXITCODE -ne 0) { throw 'Render browser installation failed.' }
  } finally { Pop-Location }
  & .\video-studio.ps1 doctor
} finally { Pop-Location }
