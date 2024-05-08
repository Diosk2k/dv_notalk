-- PMA NO TALK WHILE DEAD
--
local isDead = false

-- Funktion zum Deaktivieren der Proximity-Überprüfung, wenn ein Spieler tot ist
function DisableProximityWhenDead()
    exports['pma-voice']:overrideProximityCheck(function(player)
        -- Dies deaktiviert die Möglichkeit des Spielers, jemanden "anzuvisieren", wenn er spricht
        return false
    end)
end

-- Funktion zum Zurücksetzen der Proximity-Überprüfung, wenn ein Spieler wiederbelebt wird
function ResetProximityCheck()
    exports['pma-voice']:resetProximityCheck()
end

-- Event-Handler für den Tod eines Spielers
AddEventHandler('esx:onPlayerDeath', function(data)
    isDead = true
    DisableProximityWhenDead()
end)

-- Event-Handler für die Wiederbelebung eines Spielers
AddEventHandler('esx:onPlayerSpawn', function(spawn)
    if isDead then
        isDead = false
        ResetProximityCheck()
    end
end)
