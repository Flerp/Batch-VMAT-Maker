@echo off
:menu
::Main menu selection. Uses keys 1-4
cls
echo Batch VMAT Maker
echo ===========================================================================
echo =                                                                         =
Echo =    1.) CREATE BASIC VMAT FILES                                          =
echo =                                                                         =
echo =    2.) CREATE PBR VMAT FILES                                            =
echo =                                                                         =
echo ===========================================================================
echo =                                                                         =
echo =    3.) CLEANUP UNCOMPILED VMAT FILES                                    =
echo =                                                                         =
echo ===========================================================================
echo =                                                                         =
echo =    4.) CLOSE BATCH VMAT MAKER                                           =
echo =                                                                         =
echo ===========================================================================
CHOICE /N /C:1234 /M "Enter Corresponding Menu choice (1, 2, 3, 4)"
IF ERRORLEVEL ==4 exit
IF ERRORLEVEL ==3 GOTO cleanup_uncompiled
IF ERRORLEVEL ==2 GOTO batch_vmat_pbr
IF ERRORLEVEL ==1 GOTO batch_vmat

:errorcatch1
goto error

:batch_vmat
cls
::For loop that echoes the default vmat text into a file
@echo off
FOR /r %%G in (*.png,*.tif,*.psd,*.tga,*.jpg) do (
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

goto menu

:errorcatch2
goto error

:batch_vmat_pbr
cls
::For loop that echoes the default vmat text into a file
@echo off
FOR /r %%G in (*_color.png,*_color.tif,*_color.psd,*_color.tga,*_color.jpg) do (
echo // THIS FILE IS AUTO-GENERATED >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo Layer0 >> "%%~nG.vmat"
echo { >> "%%~nG.vmat"
echo 	shader "complex.vfx" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- PBR ---- >> "%%~nG.vmat"
echo 	F_METALNESS_TEXTURE 1 >> "%%~nG.vmat"
echo 	F_SPECULAR 1 >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Ambient Occlusion ---- >> "%%~nG.vmat"
echo 	g_flAmbientOcclusionDirectDiffuse "0.000" >> "%%~nG.vmat"
echo 	g_flAmbientOcclusionDirectSpecular "0.000" >> "%%~nG.vmat"
echo 	TextureAmbientOcclusion "materials/basetexturefiles/%%~nG_ao%%~xG" >> "%%~nG.vmat"
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
echo 	TextureMetalness "materials/basetexturefiles/%%~nG_metal%%~xG" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Normal ---- >> "%%~nG.vmat"
echo 	TextureNormal "materials/basetexturefiles/%%~nG_normal%%~xG" >> "%%~nG.vmat"
echo. >> "%%~nG.vmat"
echo 	//---- Roughness ---- >> "%%~nG.vmat"
echo 	TextureRoughness "materials/basetexturefiles/%%~nG_rough%%~xG" >> "%%~nG.vmat"
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

goto menu

:errorcatch3
goto error

:cleanup_uncompiled
cls
for %%g in (..\*.vmat) do (IF EXIST ..\%%~ng.vmat_c (echo true) else (del %%g))
goto menu

:errorcatch4
goto error

:error
echo ================================================================================================
echo =          Script broke, press any key to return to menu and check your texture files          =
echo ================================================================================================
pause >nul
goto menu