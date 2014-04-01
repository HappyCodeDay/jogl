//Copyright 2010 JogAmp Community. All rights reserved.

//
// 2-pass shader w/o weight
//

#if __VERSION__ >= 130
  #define varying in
  out vec4 mgl_FragColor;
  #define texture2D texture
#else
  #define mgl_FragColor gl_FragColor
#endif

#include uniforms.glsl
#include varyings.glsl

#define GetSample(texUnit, texCoord, psize, cx, cy, offX, offY) texture2D(texUnit, texCoord + psize *  vec2(cx+offX, cy+offY))

void main (void)
{
    if( 0.0 < gcu_FboTexSize.z ) {

// Quality: allsamples > [flipquad,rgss, quincunx] > poles

        if( 0.0 >= gcu_FboTexSize.w ) {
#include curverenderer01-pass2-vbaa_flipquad3.glsl
        } else {
#include curverenderer01-pass2-vbaa_allsamples_equal.glsl
        }
// #include curverenderer01-pass2-vbaa_flipquad2.glsl
// #include curverenderer01-pass2-vbaa_flipquad.glsl
// #include curverenderer01-pass2-vbaa_rgss.glsl
// #include curverenderer01-pass2-vbaa_quincunx.glsl

// #include curverenderer01-pass2-vbaa_poles_equalweight.glsl
// #include curverenderer01-pass2-vbaa_poles_bilin1.glsl
// #include curverenderer01-pass2-vbaa_poles_propweight1.glsl
// #include curverenderer01-pass2-vbaa_allsamples_prop01.glsl
// #include curverenderer01-pass2-vbaa_fxaa3.glsl

    } else {

#include curverenderer01-pass1-curve-simple.glsl

    }
}