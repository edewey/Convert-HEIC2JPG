$files = Get-ChildItem -Filter *.heic

New-Item -Name HEIC2JPG -ItemType directory

foreach($file in $files) {
    $newJPGFile = $file -Replace '\.heic$', '.jpg'
    magick $file HEIC2JPG\$newJPGFile
    Write-Host "Converted $file to HEIC2JPG\$newJPGFile"
}