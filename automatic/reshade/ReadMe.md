# [<img src="https://cdn.jsdelivr.net/gh/AdmiringWorm/chocolatey-packages@2e8b9eb0b465415e629a31cade96590b4a0960d9/icons/reshade.png" height="48" width="48" /> ![ReShade](https://img.shields.io/chocolatey/v/reshade.svg?label=ReShade&style=for-the-badge)](https://community.chocolatey.org/packages/reshade)

ReShade (https://reshade.me) is an advanced, fully generic post-processing injector for games and video software developed by crosire. Imagine your favorite game with ambient occlusion, real depth of field effects, color correction and more ... ReShade exposes an automated and generic way to access both frame color and depth information (latter is automatically disabled during multiplayer to prevent exploitation) and all the tools to make it happen.

The possibilities are endless! Add advanced depth-edge-detection-driven SMAA antialiasing, screen space ambient occlusion, depth of field effects, chromatic aberration, dynamic film grain, automatic saturation and color correction, cross processing, multi-pass blurring ... you name it.

ReShade features its very own shading language and transcompiler, called ReShade FX. [The syntax is based on HLSL](https://github.com/crosire/reshade-shaders/blob/master/REFERENCE.md), adding useful features designed for developing post-processing-effects: Define and use textures right from the shader code, render to them, change renderstates, retrieve color and depth data, request custom values like timers or key states, ...

And that's not it. Write your shaders just once, they'll work everywhere, regardless of your target being Direct3D or OpenGL: ReShade takes care of compiling them to the right shader model and language.

## Package Parameters

- `/Desktop`: Create a shortcut on the desktop
- `/NoStartMenu`: Disables creation of a shortcut in the start menu

**Example:**
`choco install reshade --params '"/Desktop /NoStartMenu"'`
