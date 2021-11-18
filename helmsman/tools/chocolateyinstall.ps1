$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/Praqma/helmsman/releases/download/v3.7.7/helmsman_3.7.7_windows_amd64.tar.gz'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'helmsman*'

  checksum      = '7696fedf5a907ffe3e28a5bba1776aa03a0a8f39da3f5fb218491d4655f29175'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
$tarFile = Get-ChildItem -File -Path $packageArgs.unzipLocation -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $tarFile.FullName -destination $packageArgs.unzipLocation

Remove-Item $toolsDir\*.tar