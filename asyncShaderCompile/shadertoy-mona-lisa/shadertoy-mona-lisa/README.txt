In Chrome, on a beefy Windows workstation with AMD GPU and ANGLE's D3D11 backend:
webgl2 context created
Shader 000: 12538.2ms - shader compilation and program link

fxc.exe /T vs_5_0 /Fo output.fx extracted-shaders\shader_000_vert.hlsl
fxc.exe /T ps_5_0 /Fo output.fx extracted-shaders\shader_000_frag.hlsl
Takes a huge amount of time.

dxc.exe -T vs_6_0 -Fo output.dx extracted-shaders\shader_000_vert.hlsl
dxc.exe -T ps_6_0 -Fo output.dx extracted-shaders\shader_000_frag.hlsl
Quite fast.
