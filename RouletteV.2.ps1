Write-Host "Welcome to Roulette"
Start-Sleep -Seconds 0.5
[int] $Balance = 50 

Write-Host "Ihr Start Guthaben beträgt $Balance"
Start-Sleep -Seconds 0.5

do {
    $Item = Read-Host "Setzen sie auf eine Zahl, Farbe, Gerade Zahl, Ungerade Zahl, Linie oder Drittel"
    $Item = $Item.Trim().ToLower()  # Convert input to lowercase and remove leading/trailing spaces

            
        if ($Item -eq "zahl") 
        {
            do {
                $ChosenNummber = Read-Host "Wählen Sie eine Zahl zwischen 1-36"
                     if (37 -gt $ChosenNummber) 
                            {
                                 Write-Host "Ihre Zahl ist $ChosenNummber"
                                 $ChosenNummber = $ChosenItem
                                break 
                            }
                        }
                 
            until ($37 -gt $ChosenNummber) 
            
        }     
        
         if ($Item -eq "farbe") {
            do {
                $Farbwahl = Read-Host "Setzten sie auf schwarz oder rot"
                $Farbwahl = $Farbwahl.Trim().ToLower()  # Convert input to lowercase and remove leading/trailing spaces
                
                        
                    if ($Farbwahl -eq "schwarz") 
                            {
                            Write-Host "Sie haben auf schwarz gesetzt."
                            $Farbwahl = $ChosenItem
                                break  # Break the loop if Black is chosen
                            }
                    elseif ($Farbwahl -eq "rot") {
                                Write-Host "Sie haben auf rot gesetzt."
                                $Farbwahl = $ChosenItem
                                break  # Break the loop if Red is chosen
                            }
                    else {
                                Write-Host "Ungültige Eingabe, wählen Sie schwarz oder Rot."
                            }
                } until ($Farbwahl -eq "schwarz" -or $Farbwahl -eq "rot")
                    
                }
                
                
} until ($Item -eq "zahl" -or $Item -eq "farbe" -or $Item)

do {
    $Input = Read-Host "Wie viel wollen Sie setzten"
    if ($input -match '^\d+$') 
            { 
             $Bet = [int]$input
                if ($Bet -gt $Balance)
                    {
                        do {
                            $Bet = Read-Host "Ihr Guthaben beträgt $Balance. Wählen sie einen Betrag innerhalb ihres Budget"
                                 if ($Balance -gt $Bet -or $Balance -eq $Bet) 
                                    {
                                         Write-Host "Sie setzten $Bet auf $ChosenItem"
                                         break 
                                     }  
                            } 
                        until ($Blance+1 -gt $Bet) 
                    }
                else {
                     Write-Host "Sie setzten $Bet auf $ChosenItem"
                    }
            $Bet = [int]$input
            break  
             } 
    }
until ($Balance -gt $Bet -and $Bet -match '^\d+$')    
    



                