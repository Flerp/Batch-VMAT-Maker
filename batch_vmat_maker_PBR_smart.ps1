##Test Variables
$force_backfaces = 1
$force_specular = 0
Get-Childitem *_color.png,*_color.jpg,*_color.tif,*_color.tga,*_color.psd |
ForEach-Object {
	$matname = $_.Name -Replace{..........$}
	$mat_fileextension = $_.extension
	$mat_output_file = "$($_.FullName -Replace{..........$}).vmat"

	$has_ao = Test-Path -Path "$($matname)_ao$($mat_fileextension)"
	$has_rough = Test-Path -Path "$($matname)_rough$($mat_fileextension)"
	$has_trans = Test-Path -Path "$($matname)_trans$($mat_fileextension)"
	$has_metal = Test-Path -Path "$($matname)_metal$($mat_fileextension)"
	$has_normal = Test-Path -Path "$($matname)_normal$($mat_fileextension)"
	$has_selfillum = Test-Path -Path "$($matname)_selfillum$($mat_fileextension)"

	Write-Output "// THIS FILE IS AUTO-GENERATED" | Out-File -encoding ASCII -FilePath $mat_output_file
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "Layer0" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "{" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tshader `"complex.vfx`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#PBR Flags###################################################################################################################################################################
	Write-Output "`t//---- PBR ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	IF ($has_metal -eq 1) {
		(Write-Output "`tF_METALNESS_TEXTURE 1" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	IF ($has_selfillum -eq 1) {
		(Write-Output "`tF_SELF_ILLUM 1" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	IF ($has_metal -eq 1) {
		(Write-Output "`tF_SPECULAR 1" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	elseif ($has_rough -eq 1) {
		(Write-Output "`tF_SPECULAR 1" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	IF ($force_specular -eq 1) {
		(Write-Output "`tF_SPECULAR 1" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#Back Face Rendering#########################################################################################################################################################
	IF ($force_backfaces -eq 1) {
		(Write-Output "`t//---- Rendering ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
		(Write-Output "`tF_RENDER_BACKFACES 1" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
		(Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
#Transparency Flag###########################################################################################################################################################
	IF ($has_trans -eq 1) {
		(Write-Output "`t//---- Translucent ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
		(Write-Output "`tF_TRANSLUCENT 1" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
		(Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
#Ambient Occlusion Settings##################################################################################################################################################
	Write-Output "`t//---- Ambient Occlusion ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_flAmbientOcclusionDirectDiffuse `"0.000`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_flAmbientOcclusionDirectSpecular `"0.000`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	IF ($has_ao -eq 0) {
		(Write-Output "`tTextureAmbientOcclusion `"materials/default/default_ao.tga`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	elseif ($has_ao -eq 1) {
		(Write-Output "`tTextureAmbientOcclusion `"materials/basetexturefiles/$($matname)_ao$($mat_fileextension)`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#Color Map Settings##########################################################################################################################################################
	Write-Output "`t//---- Color ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_flModelTintAmount `"1.000`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_vColorTint `"[1.000000 1.000000 1.000000 0.000000]`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tTextureColor `"materials/basetexturefiles/$($matname)_color$($mat_fileextension)`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#Fade SEttings###############################################################################################################################################################
	Write-Output "`t//---- Fade ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_flFadeExponent `"1.000`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#Fog Settings################################################################################################################################################################
	Write-Output "`t//---- Fog ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_bFogEnabled `"1`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#Lighting Settings###########################################################################################################################################################
	Write-Output "`t//---- Lighting ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_flDirectionalLightmapMinZ `"0.050`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_flDirectionalLightmapStrength `"1.000`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#Metalness Settings##########################################################################################################################################################
	Write-Output "`t//---- Metalness ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	IF ($has_metal -eq 0) {
		(Write-Output "`tg_flMetalness `"0.000`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	elseif ($has_metal -eq 1) {
		(Write-Output "`tTextureMetalness `"materials/basetexturefiles/$($matname)_metal$($mat_fileextension)`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#Normal Settings#############################################################################################################################################################
	Write-Output "`t//---- Normal ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	IF ($has_normal -eq 0) {
		(Write-Output "`tTextureNormal `"materials/default/default_normal.tga`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	elseif ($has_normal -eq 1) {
		(Write-Output "`tTextureNormal `"materials/basetexturefiles/$($matname)_normal$($mat_fileextension)`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#Roughness Settings##########################################################################################################################################################
	Write-Output "`t//---- Roughness ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	IF ($has_rough -eq 0) {
		(Write-Output "`tTextureNormal `"materials/default/default_rough.tga`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	elseif ($has_rough -eq 1) {
		(Write-Output "`tTextureRoughness `"materials/basetexturefiles/$($matname)_rough$($mat_fileextension)`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#Self Illumination Settings##################################################################################################################################################
IF ($has_selfillum -eq 1) {
	(Write-Output "`t//---- Self Illum ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	(Write-Output "`tg_flSelfIllumAlbedoFactor `"1.000`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	(Write-Output "`tg_flSelfIllumBrightness `"0.000`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	(Write-Output "`tg_flSelfIllumScale `"1.000`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	(Write-Output "`tg_vSelfIllumScrollSpeed `"[0.000 0.000]`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	(Write-Output "`tg_vSelfIllumTint `"[1.000000 1.000000 1.000000 0.000000]`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	(Write-Output "`tTextureSelfIllumMask `"materials/default/default_selfillum.tga`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	(Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
}
#Texture Coord Settings######################################################################################################################################################
	Write-Output "`t//---- Texture Coordinates ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_nScaleTexCoordUByModelScaleAxis `"0`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_nScaleTexCoordVByModelScaleAxis `"0`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_vTexCoordOffset `"[0.000 0.000]`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_vTexCoordScale `"[1.000 1.000]`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "`tg_vTexCoordScrollSpeed `"[0.000 0.000]`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
	Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
#Transparency Settings#######################################################################################################################################################
	IF ($has_trans -eq 1) {
		(Write-Output "`t//---- Translucent ----" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
		(Write-Output "`tg_flOpacityScale `"1.000`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
		(Write-Output "`tTextureTranslucency `"materials/basetexturefiles/$($matname)_trans$($mat_fileextension)`"" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
		(Write-Output "" | Out-File -encoding ASCII -FilePath $mat_output_file -Append)
	}
#End of VMAT#################################################################################################################################################################
	Write-Output "}" | Out-File -encoding ASCII -FilePath $mat_output_file -Append
}
Move-Item *.vmat ..\