set VULKAN_PATH=%VULKAN_SDK%

%VULKAN_PATH%/Bin/glslc.exe shader.vert -o vert.spv
%VULKAN_PATH%/Bin/glslc.exe shader.frag -o frag.spv

pause
