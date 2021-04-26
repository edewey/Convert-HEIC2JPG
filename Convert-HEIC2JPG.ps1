param (
    [parameter](mandatory = true, position = 1)]
    [string]$convertFromDir
)

$files = Get-ChildItem -Path $convertFromDir -Filter *.heic

$convertedDir = New-Item -Name HEIC2JPG -Path $convertFromDir -ItemType directory

foreach($file in $files) {
    $newJPGFile = $file -Replace '\.heic$', '.jpg'
    magick $convertFromDir\$file $convertedDir\$newJPGFile
    Write-Host "Converted $convertFromDir\$file to $convertedDir\$newJPGFile"
}
