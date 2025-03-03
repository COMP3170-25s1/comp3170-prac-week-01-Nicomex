#version 410

uniform vec3 u_colour;			// colour as a 3D vector (r,g,b)
uniform vec2 u_screenSize;  	// screen dimensions in pixels

layout(location = 0) out vec4 o_colour;	// output to colour buffer

void main() { //Fragcoord is the location of each pixel. it runs like a loop 
   vec2 p = gl_FragCoord.xy / u_screenSize;   // scale p into range (0,0) to (1,1) (p) pixel
   vec2 v = abs(p - vec2(0.5, 0.5));    // calculate distance to midpoint
   float d = v.x + v.y;     
  
  float red = p.y;
  float blue = 1-p.y;
  float green = p.x;
  vec3 finalColour = vec3(red,green,blue);
  
   if (d < 0.4) {
      o_colour = vec4(u_colour.rgb + finalColour, 1);
   }
   else {
      o_colour = vec4(0.5,0,0.5,1); // BLACK
   }
}