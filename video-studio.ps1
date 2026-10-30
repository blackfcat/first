param(
  [ValidateSet('doctor','demo','studio','preflight')][string]$Action = 'doctor'
)
$ErrorActionPreference = 'Stop'
$repo = $PSScriptRoot
$python = Join-Path $repo '.venv\Scripts\python.exe'
if (!(Test-Path -LiteralPath $python)) { throw 'Missing project Python environment.' }
$env:PATH = "$repo\.venv\Scripts;$repo\remotion-composer\node_modules\@remotion\compositor-win32-x64-msvc;$env:PATH"
$ffmpeg = & $python -c 'import imageio_ffmpeg; print(imageio_ffmpeg.get_ffmpeg_exe())'
if ($LASTEXITCODE -ne 0) { throw 'FFmpeg dependency is missing.' }
$bin = Join-Path $repo '.venv\Scripts\ffmpeg.exe'
if (!(Test-Path -LiteralPath $bin)) { Copy-Item -LiteralPath $ffmpeg -Destination $bin }
Push-Location $repo
try {
  switch ($Action) {
    doctor {
      & $python --version
      & node --version
      & $bin -version | Select-Object -First 1
      Push-Location (Join-Path $repo 'remotion-composer')
      try { & node ..\scripts\video-doctor.cjs } finally { Pop-Location }
      if ($LASTEXITCODE -ne 0) { throw 'Remotion version check failed.' }
    }
    demo {
      & $python render_demo.py code-to-screen
      if ($LASTEXITCODE -ne 0) { throw 'Demo render failed.' }
    }
    studio {
      Push-Location (Join-Path $repo 'remotion-composer')
      try { & npm.cmd start } finally { Pop-Location }
    }
    preflight {
      & $python -c 'from tools.tool_registry import registry; import json; registry.discover(); print(json.dumps(registry.provider_menu_summary(), ensure_ascii=True, indent=2))'
      if ($LASTEXITCODE -ne 0) { throw 'Provider discovery failed.' }
    }
  }
} finally { Pop-Location }
