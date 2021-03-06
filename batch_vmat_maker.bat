::For loop that echoes the default vmat text into a file
@echo off
FOR /r %%G in (*_color.png,*_color.tif,*_color.psd,*_color.tga,*_color.jpg) do (
echo // THIS FILE IS AUTO-GENERATED >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo Layer0 >> "%%~nG.vmat"
echo { >> "%%~nG.vmat"
echo 	shader "complex.vfx" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Ambient Occlusion ---- >> "%%~nG.vmat"
echo 	g_flAmbientOcclusionDirectDiffuse "0.000" >> "%%~nG.vmat"
echo 	g_flAmbientOcclusionDirectSpecular "0.000" >> "%%~nG.vmat"
echo 	TextureAmbientOcclusion "materials/default/default_ao.tga" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Color ---- >> "%%~nG.vmat"
echo 	g_flModelTintAmount "1.000" >> "%%~nG.vmat"
echo 	g_vColorTint "[1.000000 1.000000 1.000000 0.000000]" >> "%%~nG.vmat"
echo 	TextureColor "materials/basetexturefiles/%%~nG%%~xG" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Fade ---- >> "%%~nG.vmat"
echo 	g_flFadeExponent "1.000" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Fog ---- >> "%%~nG.vmat"
echo 	g_bFogEnabled "1" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Lighting ---- >> "%%~nG.vmat"
echo 	g_flDirectionalLightmapMinZ "0.050" >> "%%~nG.vmat"
echo 	g_flDirectionalLightmapStrength "1.000" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Metalness ---- >> "%%~nG.vmat"
echo 	g_flMetalness "0.000" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Normal ---- >> "%%~nG.vmat"
echo 	TextureNormal "materials/default/default_normal.tga" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Roughness ---- >> "%%~nG.vmat"
echo 	TextureRoughness "materials/default/default_rough.tga" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Texture Coordinates ---- >> "%%~nG.vmat"
echo 	g_nScaleTexCoordUByModelScaleAxis "0" >> "%%~nG.vmat"
echo 	g_nScaleTexCoordVByModelScaleAxis "0" >> "%%~nG.vmat"
echo 	g_vTexCoordOffset "[0.000 0.000]" >> "%%~nG.vmat"
echo 	g_vTexCoordScale "[1.000 1.000]" >> "%%~nG.vmat"
echo 	g_vTexCoordScrollSpeed "[0.000 0.000]" >> "%%~nG.vmat"
echo } >> "%%~nG.vmat"
move %%~nG.vmat ..\%%~nG.vmat
)