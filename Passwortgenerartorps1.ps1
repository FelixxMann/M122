Write-Host "Geben sie die Anfroderungen für ihr Passwort ein"
do {
    $Input1 = Read-Host "Passwortlänge (Zahl)"
    if ($Input1 -match '^\d+$') 
        {
            $PwLength = [int]$Input1
            break
        } 
else    {
            Write-Host "Bitte geben Sie eine Nummer ein."
        }
    } 
while ($true)

 do {
    $BigandSmall = Read-Host "Gross- und kleinschreibung (Ja/Nein)"
    $BigandSmall = $BigandSmall.Trim().ToLower()

        if ($BigandSmall -eq "ja") 
                {
                    $BigandSmall = "ja"
                    break
                }
        elseif ($BigandSmall -eq "nein") 
                {
                    $BigandSmall = "nein"
                    break
                }
        else {
                    Write-Host "Ungültige Eingabe, schreiben sie Ja oder Nein."
                }
    } 
until ($BigandSmall -eq "ja" -or $BigandSmall -eq "nein")

do {
    $Nummbers = Read-Host "Nummern (Ja/Nein)"
    $Nummbers = $Nummbers.Trim().ToLower() 

        if ($Nummbers -eq "ja") 
                {
                    $Nummbers = "ja"
                    break
                }
        elseif ($Nummbers -eq "nein") 
                {
                    $Nummbers = "nein"
                    break
                }
        else {
                    Write-Host "Ungültige Eingabe, schreiben sie Ja oder Nein."
                }
    } 
until ($Nummbers -eq "ja" -or $Nummbers -eq "nein")

do {
    $SpecialCharakters = Read-Host "Sonderzeichen (Ja/Nein)"
    $SpecialCharakters = $SpecialCharakters.Trim().ToLower()

        if ($SpecialCharakters -eq "ja") 
                {
                    $SpecialCharakters = "ja"
                    break 
                }
        elseif ($SpecialCharakters -eq "nein") 
                {
                    $SpecialCharakters = "nein"
                    break
                }
        else {
                    Write-Host "Ungültige Eingabe, schreiben sie Ja oder Nein."
                }
    } 
until ($SpecialCharakters -eq "ja" -or $SpecialCharakters -eq "nein")


Write-Host 
  "Ihre Passworteinstellungen sind:
    Länge: $PwLength
    Gross- und Kleinschreibung: $BigandSmall
    Nummern: $Nummbers
    Sonderzeichen: $SpecialCharakters
  "

  do { 
        Write-Host "Drücken Sie Enter, um Ihr Passwort zu generieren"
        $null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown').Character
        Start-Sleep -Seconds 2

        if ($BigandSmall -eq "ja", $Nummbers -eq "ja", $SpecialCharakters -eq "ja")
           {
                {
                
                    $characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz123456789.,;:!?+*%&/=-_'"
                    $randomIndex = Get-Random -Minimum 0 -Maximum $characters.Length
                    $randomLetter = $characters[$randomIndex]
                    return $randomLetter
                }

                $anzahlBuchstaben = $PwLength
                $Password = -join (1..$anzahlBuchstaben | ForEach-Object { Get-RandomLetter })
                Write-Host "Ihr Passwort ist $Password"
            }
        elseif ($BigandSmall -eq "ja")
            { 
            function Get-RandomLetter 
                {
                    $characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                    $randomIndex = Get-Random -Minimum 0 -Maximum $characters.Length
                    $randomLetter = $characters[$randomIndex]
                    return $randomLetter
                }

                $anzahlBuchstaben = $PwLength
                $Password = -join (1..$anzahlBuchstaben | ForEach-Object { Get-RandomLetter })
                Write-Host "Ihr Passwort ist $Password"
            break
            }
        elseif ($Nummbers -eq "ja")
            { 
            function Get-RandomLetter 
                {
                    $characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789"
                    $randomIndex = Get-Random -Minimum 0 -Maximum $characters.Length
                    $randomLetter = $characters[$randomIndex]
                    return $randomLetter
                }

                $anzahlBuchstaben = $PwLength
                $Password = -join (1..$anzahlBuchstaben | ForEach-Object { Get-RandomLetter })
                Write-Host "Ihr Passwort ist $Password"
            break
            }
    else {  
            function Get-RandomLetter {
                $characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                $randomIndex = Get-Random -Minimum 0 -Maximum $characters.Length
                $randomLetter = $characters[$randomIndex]
                return $randomLetter
            }
    
            $anzahlBuchstaben = $PwLength
            $Password = -join (1..$anzahlBuchstaben | ForEach-Object { Get-RandomLetter })
            Write-Host "Ihr Passwort ist $Password"
            break        
        }
    }
    
until ($Password -eq [string])



