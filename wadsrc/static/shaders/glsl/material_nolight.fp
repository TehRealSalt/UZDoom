/*
** material_nolight.fp
**
**
**
**---------------------------------------------------------------------------
**
** Copyright 2018-2025 GZDoom Maintainers and Contributors
** Copyright 2025-2026 UZDoom Maintainers and Contributors
**
** SPDX-License-Identifier: GPL-3.0-or-later
**
**---------------------------------------------------------------------------
**
*/

vec3 ProcessMaterialLight(Material material, vec3 color)
{
	vec3 frag = SnapApplyLight(material.Base.rgb, color);
	return SnapApplyDynamicLight(frag, desaturate(uDynLightColor).rgb);
}
