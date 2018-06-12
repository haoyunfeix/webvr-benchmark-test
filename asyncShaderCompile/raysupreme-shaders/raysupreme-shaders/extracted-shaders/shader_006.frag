#version 300 es
                precision mediump float;

                out vec4 fragColor;
                in vec2 texCoord;

                uniform vec2 inResolution;
            // dimensions of the color picker (in range (0,1])
#define CP_WIDTH  0.8
#define CP_HEIGHT 1.0

// position of the color picker (in range [0,1])
// relative to the bottom left corner
#define CP_POS_X 0.2
#define CP_POS_Y 0.0

// relative widths of the color picker widgets (in range (0,1])
#define SV_WIDGET_WIDTH 0.94
#define H_WIDGET_WIDTH  0.05

// dimensions of the circular sat/val marker
#define SAT_VAL_MARKER_OUTER_RADIUS 0.03 * 0.4
#define SAT_VAL_MARKER_INNER_RADIUS 0.025 * 0.4

// thickness of the hue marker
#define VAL_MARKER_THICKNESS 0.005


const int num_color_stops = 6;

uniform vec3 uCoords, uCoords2;
uniform int uCurrent;

// interpolation helpers

vec3 get_color_stop(int i) {
    vec3 result = vec3(0);

    if (i == 0) 	 result = vec3(1.0, 0.0, 0.0);
    else if (i == 1) result = vec3(1.0, 0.0, 1.0);
    else if (i == 2) result = vec3(0.0, 0.0, 1.0);
    else if (i == 3) result = vec3(0.0, 1.0, 1.0);
    else if (i == 4) result = vec3(0.0, 1.0, 0.0);
    else if (i == 5) result = vec3(1.0, 1.0, 0.0);

    return result;

}

vec2 get_sat_val_from_position(in vec2 pos) {

    vec2 result = vec2(0.0);

   	vec2 tl = vec2(0.0, 0.0);
    vec2 bl = vec2(0.0, 0.0);
    vec2 br = vec2(0.0, 1.0);
    vec2 tr = vec2(1.0, 0.0);

    vec2 interp_b = mix(bl, br, pos.x);
    vec2 interp_t = mix(tl, tr, pos.x);

    result = mix(interp_b, interp_t, pos.y);

    return result;
}

vec3 get_hue_from_position(in float pos) {

    vec3 result = vec3(0.0);

    const float frac = 1.0 / float(num_color_stops);

    for (int i = 0; i < num_color_stops; ++i) {

    	if (pos <= frac * float(i + 1)) {

        	int n = i + 1;
        	if (n == num_color_stops) {
            	n = 0;
        	};

        	result = mix(get_color_stop(i), get_color_stop(n), (pos - frac * float(i)) * 1.0 / frac);
        	break;
      	}
    }

    return result;
}

vec3 apply_sat_val_to_color(in vec2 sat_val, in vec3 color) {
	vec3 val = mix(vec3(0.0), vec3(1.0), sat_val.y);
    return mix(val, color, sat_val.x);
}



// drawing functions

vec3 draw_sat_val(in vec2 uv, in vec3 selected_hue, in vec3 selection_position) {

  	vec3 final = vec3(0.0);

	vec2 rel_uv = vec2((uv.x - CP_POS_X) / CP_WIDTH, (uv.y - CP_POS_Y) / CP_HEIGHT);

  	if (rel_uv.x >= 0.0 && rel_uv.x <= 1.0 &&
        rel_uv.y >= 0.0 && rel_uv.y <= 1.0 &&
        rel_uv.x <= SV_WIDGET_WIDTH) {

    	vec2 sat_val = get_sat_val_from_position(vec2(rel_uv.x / SV_WIDGET_WIDTH, rel_uv.y));

    	final = apply_sat_val_to_color(sat_val, selected_hue);

    	// draw selection marker
        float aspect_ratio = inResolution.y / inResolution.x;
        //aspect_ratio = 1.0;

    	float dist = length(
            vec2(rel_uv.x, rel_uv.y * aspect_ratio) -
            vec2(selection_position.x, selection_position.y * aspect_ratio)
        );

    	if (dist <= SAT_VAL_MARKER_OUTER_RADIUS &&
        	dist >= SAT_VAL_MARKER_INNER_RADIUS) {

      		float smoothing = (dist - SAT_VAL_MARKER_INNER_RADIUS) /
        		              (SAT_VAL_MARKER_OUTER_RADIUS - SAT_VAL_MARKER_INNER_RADIUS);

      		smoothing = 1.0 - abs((smoothing * 2.0 - 1.0) * 0.5);

      		final = mix(final, vec3(1.0) - final, smoothing);
    	}
  	}

  	return final;

}

vec3 draw_hue(in vec2 uv, in vec3 selection_position) {

  	vec3 final = vec3(0.0);

    vec2 rel_uv = vec2((uv.x - CP_POS_X) / CP_WIDTH, (uv.y - CP_POS_Y) / CP_HEIGHT);

  	if (rel_uv.x >= 0.0 && rel_uv.x <= 1.0 &&
        rel_uv.y >= 0.0 && rel_uv.y <= 1.0 &&
        1.0 - rel_uv.x <= H_WIDGET_WIDTH) {

		final = get_hue_from_position(rel_uv.y);

    	// draw selection marker
    	float dist = abs(rel_uv.y - selection_position.z);

    	if (dist <= VAL_MARKER_THICKNESS) {
      		final = vec3(1.0) - final;
    	}
  	}

  	return final;

}

void main()
{
	vec2 uv = texCoord;//fragCoord.xy / iResolution.xy;

    vec3 final_color = vec3(0.0);

    // draw color picker

    // selected_position.xy : relative xy coords of selection in sat/val widget
    // selected_position.z  : relative y coord of selection in hue widget
    vec3 selection_position;
    vec3 off_position;

    if ( uCurrent == 0 ) {
        selection_position = uCoords;
        off_position = uCoords2;
    } else {
        selection_position = uCoords2;
        off_position = uCoords;
    }

    // --- Selected Color

    vec3 selected_hue = get_hue_from_position(selection_position.z);

    vec2 sat_val = get_sat_val_from_position(
        vec2(selection_position.x / SV_WIDGET_WIDTH, selection_position.y)
    );

    vec3 selected_color = apply_sat_val_to_color(sat_val, selected_hue);

    // --- Off Color

    vec3 off_hue = get_hue_from_position(off_position.z);

    sat_val = get_sat_val_from_position(
        vec2(off_position.x / SV_WIDGET_WIDTH, off_position.y)
    );

    vec3 off_color = apply_sat_val_to_color(sat_val, off_hue);

    // ---

    final_color += draw_sat_val(uv, selected_hue, selection_position);
    final_color += draw_hue(uv, selection_position);

    // draw colorized windows
    vec3 tl = vec3(0);//texture(iChannel1, (uv - vec2(0.0, 0.5)) * 2.0).rgb;
    vec3 tr = vec3(0);//texture(iChannel2, (uv - vec2(0.5, 0.5)) * 2.0).rgb;
    vec3 br = vec3(0);//texture(iChannel3, (uv - vec2(0.5, 0.0)) * 2.0).rgb;

    // replace green by selected color
    float dist_to_green = length(vec3(0.0, 1.0, 0.0) - tl);
    tl = mix(selected_color, tl, dist_to_green);

    dist_to_green = length(vec3(0.0, 1.0, 0.0) - tr);
    tr = mix(selected_color, tr, dist_to_green);

    // colorize with selected color
    br *= selected_color;

    // if (uv.x <= 0.5 && uv.y >= 0.5) final_color = tl;
    // else if (uv.x > 0.5 && uv.y >= 0.5) final_color = tr;
    // else if (uv.x > 0.5 && uv.y < 0.5) final_color = br;

    if (uv.x <= CP_POS_X ) {
        if ( uCurrent == 0 ) {
            if ( uv.y >= 0.5 ) final_color = selected_color;
            else
            if ( uv.y <= 0.5 ) final_color = off_color;

            if ( uv.x >= CP_POS_X - 0.0025 && uv.y >= 0.5 ) final_color = vec3( 0.5 );
        } else {
            if ( uv.y >= 0.5 ) final_color = off_color;
            else
            if ( uv.y <= 0.5 ) final_color = selected_color;

            if ( uv.x >= CP_POS_X - 0.0025 && uv.y <= 0.5 ) final_color = vec3( 0.5 );
        }

        if ( uv.y >= 0.49005 && uv.y < 0.5005 ) final_color = vec3( 0.5 );
    }


    fragColor = vec4(final_color, 1.0);
}

