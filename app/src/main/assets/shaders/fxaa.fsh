#version 300 es
precision mediump float;
precision mediump int;

/* const float FXAA_SPAN_MAX = 8.0;
const float FXAA_REDUCE_MUL = 1.0/8.0;
const float FXAA_REDUCE_MIN = (1.0/128.0); */

const float FXAA_SPAN_MAX = 8.0;
const float FXAA_REDUCE_MUL = 1.0/8.0;
const float FXAA_REDUCE_MIN = (1.0/128.0);

uniform sampler2D textureSampler;
uniform sampler2D noAAtextureSampler;

// The inverse of the texture dimensions along X and Y
uniform vec2 texcoordOffset;
uniform float exposure;
uniform float gamma;
uniform float sharpenStrength;
uniform float vignetteStrength;

in mediump vec2 vTexCoordOut;
out vec4 fragmentColor;

void main() {

  vec4 noAAcolor = texture(noAAtextureSampler, vTexCoordOut.xy);

  vec3 rgbNW = texture(textureSampler, vTexCoordOut.xy + (vec2(-1.0, -1.0) * texcoordOffset)).xyz;
  vec3 rgbNE = texture(textureSampler, vTexCoordOut.xy + (vec2(+1.0, -1.0) * texcoordOffset)).xyz;
  vec3 rgbSW = texture(textureSampler, vTexCoordOut.xy + (vec2(-1.0, +1.0) * texcoordOffset)).xyz;
  vec3 rgbSE = texture(textureSampler, vTexCoordOut.xy + (vec2(+1.0, +1.0) * texcoordOffset)).xyz;
  vec3 rgbM  = texture(textureSampler, vTexCoordOut.xy).xyz;
	
  vec3 luma = vec3(0.299, 0.587, 0.114);
  float lumaNW = dot(rgbNW, luma);
  float lumaNE = dot(rgbNE, luma);
  float lumaSW = dot(rgbSW, luma);
  float lumaSE = dot(rgbSE, luma);
  float lumaM  = dot( rgbM, luma);
	
  float lumaMin = min(lumaM, min(min(lumaNW, lumaNE), min(lumaSW, lumaSE)));
  float lumaMax = max(lumaM, max(max(lumaNW, lumaNE), max(lumaSW, lumaSE)));
	
  vec2 dir;
  dir.x = -((lumaNW + lumaNE) - (lumaSW + lumaSE));
  dir.y =  ((lumaNW + lumaSW) - (lumaNE + lumaSE));
	
  float dirReduce = max((lumaNW + lumaNE + lumaSW + lumaSE) * (0.25 * FXAA_REDUCE_MUL), FXAA_REDUCE_MIN);
	  
  float rcpDirMin = 1.0/(min(abs(dir.x), abs(dir.y)) + dirReduce);
	
  dir = min(vec2(FXAA_SPAN_MAX,  FXAA_SPAN_MAX), 
        max(vec2(-FXAA_SPAN_MAX, -FXAA_SPAN_MAX), dir * rcpDirMin)) * texcoordOffset;
		
  vec3 rgbA = (1.0/2.0) * (
              texture(textureSampler, vTexCoordOut.xy + dir * (1.0/3.0 - 0.5)).xyz +
              texture(textureSampler, vTexCoordOut.xy + dir * (2.0/3.0 - 0.5)).xyz);
  vec3 rgbB = rgbA * (1.0/2.0) + (1.0/4.0) * (
              texture(textureSampler, vTexCoordOut.xy + dir * (0.0/3.0 - 0.5)).xyz +
              texture(textureSampler, vTexCoordOut.xy + dir * (3.0/3.0 - 0.5)).xyz);
  float lumaB = dot(rgbB, luma);

  vec3 aaColor;

  if((lumaB < lumaMin) || (lumaB > lumaMax)){
    aaColor=rgbA;
  } else {
	aaColor=rgbB;
  }
  
  vec3 composited = noAAcolor.rgb * noAAcolor.a + aaColor * (1.0 - noAAcolor.a);

  // Restore detail softened by FXAA before applying display-space effects.
  vec3 crossBlur = 0.25 * (
      texture(textureSampler, vTexCoordOut + vec2(texcoordOffset.x, 0.0)).rgb +
      texture(textureSampler, vTexCoordOut - vec2(texcoordOffset.x, 0.0)).rgb +
      texture(textureSampler, vTexCoordOut + vec2(0.0, texcoordOffset.y)).rgb +
      texture(textureSampler, vTexCoordOut - vec2(0.0, texcoordOffset.y)).rgb);
  composited += (composited - crossBlur) * sharpenStrength;

  // Filmic ACES approximation followed by an explicit sRGB-style transfer.
  vec3 mapped = composited * exposure;
  mapped = clamp((mapped * (2.51 * mapped + 0.03)) /
                 (mapped * (2.43 * mapped + 0.59) + 0.14), 0.0, 1.0);
  mapped = pow(mapped, vec3(1.0 / max(gamma, 0.001)));

  // Subtle vignette and 8-bit dithering reduce banding in Windlight skies.
  vec2 centered = vTexCoordOut * 2.0 - 1.0;
  float vignette = 1.0 - vignetteStrength * dot(centered, centered);
  float noise = fract(sin(dot(gl_FragCoord.xy, vec2(12.9898, 78.233))) * 43758.5453) - 0.5;
  mapped = clamp(mapped * vignette + noise / 255.0, 0.0, 1.0);

  fragmentColor = vec4(mapped, 1.0);

}
