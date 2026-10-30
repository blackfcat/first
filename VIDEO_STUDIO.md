# 个人编程动画工作室

本机目录：`D:\codex\first`。通过 Codex 描述视频要求，由 Codex 阅读仓库制作流程、编写动画并渲染 MP4；这不是无人值守的云端生成服务。

默认制作路径为 Remotion + OpenMontage。本仓库已收录 Remotion、FFmpeg、GSAP、Manim 等相关知识，技能文件并不表示所有对应运行时均已安装。

## 使用

直接告诉 Codex，例如：

> 制作一个 30 秒中文二分查找动画，16:9，深色背景，左边展示代码，右边逐步演示数组搜索，输出 MP4。

未指定时采用中文、30 秒、1080p 横屏、30fps、H.264。音频按实际可用工具处理，不会把未配置的付费服务说成已就绪。

## 本机入口

重装时运行 `powershell -ExecutionPolicy Bypass -File .\setup-video-studio.ps1`。可用 `-PythonExecutable` 指定可用的 Python 路径，需先安装 Node.js 22。

```powershell
.\video-studio.ps1 doctor
.\video-studio.ps1 preflight
.\video-studio.ps1 demo
.\video-studio.ps1 studio
```

Python 使用项目 `.venv`，FFmpeg 使用 `imageio-ffmpeg` 提供的本机程序，Remotion 使用 `remotion-composer/node_modules`。不依赖损坏的系统 `py` 启动器。

生成作品位于 `projects/<作品名>/renders/`，不提交大型素材、缓存或密钥。预览仅在本机运行。

本次配置没有付费图片、视频或配音 API 密钥。中文配音尚未配置；可以使用用户提供的音轨，或在后续配置配音供应商。代码、图形、字幕动画及本地 MP4 渲染不需要这些密钥。

为避免国内网络访问 Google Fonts 超时，默认使用本机 Segoe UI / 微软雅黑与 Georgia / 宋体；品牌字体应提供有授权的本地字体文件。

Remotion 固定为 4.0.539。Zod 覆盖为安全补丁 4.6.6；上游 `remotion versions` 仍期望 4.5.4，会报告额外版本提示。`doctor` 检查实际 Remotion 组件版本一致性，是否可渲染以样片验证为准。

## 来源

- Remotion 官方技能：https://github.com/remotion-dev/skills
- OpenMontage 上游：https://github.com/calesthio/OpenMontage
- HyperFrames 候选：https://github.com/heygen-com/hyperframes （未作为本次默认运行时部署）

这些来源不是对原抖音视频四个项目的确认。使用与再分发需遵循各项目许可证；本仓库沿用上游 AGPL-3.0，Remotion 自身许可单独适用。
