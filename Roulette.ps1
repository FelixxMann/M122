    Write-Host "Welcome to Roulette!"
        do {
            $input = Read-Host "Einsatz"
        if ($input -match '^\d+$') {
        $Einsatz = [int]$input
        break  
        } 
        else {
        Write-Host "Bitte geben Sie eine Nummer ein."
        }
} while ($true)

    Write-Host "Ihr Einsatz ist $Einsatz"

Write-Host "Setzen Sie auf eine Zahl zwischen 1-36:"
    [int] $GesetzteZahl =Read-Host
        if ($GesetzteZahl -gt 36)
            {
                do {
                    $GesetzteZahl = Read-Host "Wählen Sie eine Zahl zwischen 1-36"
                if (37 -gt $GesetzteZahl) 
                    {
                     Write-Host "Ihre Zahl ist $GesetzteZahl"
                     break 
                     }
                    }
                until ($37 -gt $GesetzteZahl) 
            }

 do {
    $Farbwahl = Read-Host "Setzten sie auf schwarz oder rot"
    $Farbwahl = $Farbwahl.Trim().ToLower()  
            
        if ($Farbwahl -eq "schwarz") 
                {
                    Write-Host "Sie haben auf schwarz gesetzt."
                    break  
                }
                elseif ($Farbwahl -eq "rot") {
                    Write-Host "Sie haben auf rot gesetzt."
                    break  
                }
                else {
                    Write-Host "Ungültige Eingabe, wählen Sie schwarz oder Rot."
                }
    } until ($Farbwahl -eq "schwarz" -or $Farbwahl -eq "rot")

Write-Host "Sie haben $Einsatz auf $GesetzteZahl und $Farbwahl gesetzt"
Start-Sleep -Seconds 1
Write-Host "!!!! RIEN NE VA PLUS!!!!
Drücken sie ENTER um zu drehen"
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown').Character
Start-Sleep -Seconds 2

$Gewinnernummer = Get-Random -Minimum 1 -Maximum 36
$Farben = "schwarz", "rot"
$Gewinnerfarbe = $Farben | Get-Random
Write-Host "$Gewinnernummer, $Gewinnerfarbe!!"

if ($Gewinnerfarbe -eq $Farbwahl -and $Gewinnernummer -eq $GesetzteZahl)
    {
        $Gewinn = $Einsatz * 72
        Write-Host "Du gewinnst $Gewinn"
    }
elseif ($Gewinnernummer -eq $GesetzteZahl)
    {
        $Gewinn = $Einsatz * 36
        Write-Host "Du gewinnst $Gewinn"
    }
elseif ($Gewinnerfarbe -eq $Farbwahl) 
            {
            $Gewinn = $Einsatz * 2
            Write-Host "Du gewinnst $Gewinn"
             }
    
else {
    Write-Host "Die Bank gewinnt"
    }
            