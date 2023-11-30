shader_type spatial;
render_mode unshaded;

//const float PI = 4.0*atan(1.0);

const mat3 cubehelix_mat = mat3(
	vec3(1., -0.14861, +1.78277),
	vec3(1., -0.29227, -0.90649),
	vec3(1., +1.97294, +0.00000));
	
vec3 cubehelix(float x, float start, float rots, float hue, float gamma) {
    float angle = 2.0*PI*(start/3.0+1.0+rots*x);
    x = pow(x, gamma);
    float amp = hue*x*(1.0-x)/2.0;
	vec3 v = vec3(x, amp*cos(angle), amp*sin(angle));
    return clamp(v*cubehelix_mat, 0., 1.);
}

vec2 cmplx_mult(vec2 a, vec2 b) {
	return vec2(a.x*b.x-a.y-b.y, a.x*b.y+a.y*b.x);
}

float modulo_squared(vec2 x) {
	return dot(x,x);
}

//float frac(vec2 z0, vec2 c) {
//    vec2 z = z0;
//    float d2 = 1.0;
//    float m2;
//    for(int i = 0; i < 1024; i++) {
//        d2 *= 4.0*m2;
//        z  = cmplx_mult(z,z) + c;
//        m2 = modulo_squared(z);
//        if (m2 > 1e20) break;
//    }
//    return sqrt(m2/d2)*0.5*log(m2);
//}

float frac( in vec2 c )
{
    float c2 = dot(c, c);
    // skip computation inside M1 - https://iquilezles.org/articles/mset1bulb
    if( 256.0*c2*c2 - 96.0*c2 + 32.0*c.x - 3.0 < 0.0 ) return 0.0;
    // skip computation inside M2 - https://iquilezles.org/articles/mset2bulb
    if( 16.0*(c2+2.0*c.x+1.0) - 1.0 < 0.0 ) return 0.0;

    // iterate
    float di =  1.0;
    vec2 z  = vec2(0.0);
    float m2 = 0.0;
    vec2 dz = vec2(0.0);
    for( int i=0; i<300; i++ )
    {
        if( m2>1024.0 ) { di=0.0; break; }

		// Z' -> 2·Z·Z' + 1
        dz = 2.0*vec2(z.x*dz.x-z.y*dz.y, z.x*dz.y + z.y*dz.x) + vec2(1.0,0.0);
			
        // Z -> Z² + c			
        z = vec2( z.x*z.x - z.y*z.y, 2.0*z.x*z.y ) + c;
			
        m2 = dot(z,z);
    }

    // distance	
	// d(c) = |Z|·log|Z|/|Z'|
	float d = 0.5*sqrt(dot(z,z)/dot(dz,dz))*log(dot(z,z));
	d = (di>0.5)? 0.0: d;
	
    return d;
}

void fragment() {
//	float x = (UV.x-UV.y+1.)/2.;
//	vec2 ps = UV;
//    vec2 ratio = (ps.x > ps.y) ? vec2(ps.y / ps.x, 1) : vec2(1, ps.x / ps.y);
	vec2 uv = (5.*UV-vec2(4,2.5))*2.5;
	float x = frac(uv);
	x = clamp(pow(4.0*x,0.2), 0.0, 1.0);
	vec3 color = cubehelix(x, 0.5, -1.5, 1.0, 1.0);
	ALBEDO = color;
}