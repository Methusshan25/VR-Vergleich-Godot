shader_type spatial;

uniform sampler2D gradient_texture;

void fragment() {
    // Sample the gradient texture
    vec2 uv = UV;  // Use UV coordinates to map the gradient
    vec4 gradient_color = texture(gradient_texture, uv);
    ALBEDO = gradient_color.rgb;
}
