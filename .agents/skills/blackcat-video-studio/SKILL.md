---
name: blackcat-video-studio
description: 为用户制作编程动画、算法演示、代码打字和技术讲解视频，使用本机 blackfcat/first 的 OpenMontage 与 Remotion，交付 MP4。
---

# Personal video studio

Local repository: `D:/codex/first`. Remote: `https://github.com/blackfcat/first`.

Read `AGENTS.md` and `AGENT_GUIDE.md` in that repository, then the relevant pipeline manifest and director skills. Use `animation` for custom motion graphics and algorithm explainers; use `screen-demo` for terminal/UI demonstrations. The existing `.agents/skills/remotion-best-practices` and `synthetic-screen-recording` describe frame-driven animations and terminal authoring.

Run `powershell -ExecutionPolicy Bypass -File D:/codex/first/video-studio.ps1 preflight` to discover actual capabilities. Use `.venv/Scripts/python.exe`, not the broken system Python launcher. Add `.venv/Scripts` to the current process PATH for FFmpeg when calling tools directly.

User preference: complete video production from a natural-language brief with reasonable defaults and minimal interruption. Defaults when unspecified: Chinese text, 30 seconds, 1920x1080, 30fps, H.264 MP4, Remotion, custom scene design for hero work. Explain significant creative assumptions briefly. Respect an explicit duration, aspect ratio, or style in each request. Record full-run authorization in the decision log when the user's request actually grants it; do not misrepresent human approval.

Local rendering requires no paid generation API. Discover narration/music capability before promising audio. Do not treat Codex subscription credentials as API keys. Paid image/video/voice services require configured provider credentials and authorized spend. If audio is unavailable and requested, surface that limitation before production; do not silently omit it.

Store each production under `projects/<slug>/`, including artifacts, source, assets and `renders/final.mp4`. Preserve the pipeline checkpoint and review contracts. Check key frames for readable text, overlaps and pacing; verify duration, dimensions, decoding and audio when present. Return the actual local MP4 link, and a thumbnail when useful. A rendering smoke test is not proof that a new requested film is complete.

Environment verification: `powershell -ExecutionPolicy Bypass -File D:/codex/first/video-studio.ps1 doctor`.
Curated test render: same command with `demo`.
Interactive preview: same command with `studio`.
