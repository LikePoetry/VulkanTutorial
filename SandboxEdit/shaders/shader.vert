#version 450

layout(binding = 0) uniform UniformBufferObject {
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;

layout(location = 0) out float near; //0.01
layout(location = 1) out float far; //100
layout(location = 2) out vec3 nearPoint; // nearPoint calculated in vertex shader
layout(location = 3) out vec3 farPoint; // farPoint calculated in vertex shader
layout(location = 4) out mat4 fragView;
layout(location = 8) out mat4 fragProj;

vec3 UnprojectPoint(float x, float y, float z, mat4 view, mat4 projection) {
    mat4 viewInv = inverse(view);
    mat4 projInv = inverse(projection);
    vec4 unprojectedPoint =  viewInv * projInv * vec4(x, y, z, 1.0);
    return unprojectedPoint.xyz / unprojectedPoint.w;
}

void main() {
    near=0.01;
    far=0.5;
    fragView=ubo.view;
    fragProj=ubo.proj;
    nearPoint = UnprojectPoint(inPosition.x, inPosition.y, 0.0, ubo.view, ubo.proj).xyz; // unprojecting on the near plane
    farPoint = UnprojectPoint(inPosition.x, inPosition.y, 1.0, ubo.view, ubo.proj).xyz; // unprojecting on the far plane
    gl_Position =vec4(inPosition, 1.0);
}