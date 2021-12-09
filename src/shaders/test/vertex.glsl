uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform vec2 uFrequency;
uniform float uTime;
uniform vec3 uColor;


attribute vec3 position;
attribute vec2 uv;

varying vec2 vUv;
varying float vElevation;



void main() 
{


   vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    

    float elevation = sin(modelPosition.x * uFrequency.x - uTime) / 10.0;
    elevation += sin(modelPosition.y * uFrequency.y - uTime) / 10.0;

    modelPosition.z += elevation;



    // modelPosition.z += aRandom / 10.0;



    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
    gl_Position = projectedPosition;

    vUv = uv;
    vElevation = elevation;

}
