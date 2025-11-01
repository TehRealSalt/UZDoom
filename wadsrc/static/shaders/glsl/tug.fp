vec4 ProcessTexel()
{
	vec4 base = getTexel(texCoord);
	float lightness = length(base.rgb);
	vec4 inverted = vec4(1.0 - base.rgb, base.a);
	lightness = (lightness * 2.0) - 1.0;
	vec4 final = mix(base, inverted, float(lightness < 0.0));
	return vec4(final.rgb * lightness, final.a);
}
