function onStartCountdown()
    setProperty('health', 2)
end
    
function onUpdate(elapsed)
    function onMoveCamera(focus)
        if focus == 'boyfriend' then
            -- called when the camera focus on boyfriend
        elseif focus == 'dad' then
            setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
        end
    end
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/60)
    setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 0.6))
    noteTweenX(defaultPlayerStrumX0, 4, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 0) * 300), 0.001)
    noteTweenX(defaultPlayerStrumX1, 5, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 1) * 300), 0.001)
    noteTweenX(defaultPlayerStrumX2, 6, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 2) * 300), 0.001)
    noteTweenX(defaultPlayerStrumX3, 7, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + 3) * 300), 0.001)
    noteTweenY('defaultPlayerStrumY0', 4, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 0) * 300), 0.001)
    noteTweenY('defaultPlayerStrumY1', 5, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 1) * 300), 0.001)
    noteTweenY('defaultPlayerStrumY2', 6, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 2) * 300), 0.001)
    noteTweenY('defaultPlayerStrumY3', 7, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + 3) * 300), 0.001)
    noteTweenX('fake1', 0, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (4) * 2) * 300), 0.001)
    noteTweenX('fake2', 1, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (5) * 2) * 300), 0.001)
    noteTweenX('fake3', 2, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (6) * 2) * 300), 0.001)
    noteTweenX('fake4', 3, ((screenWidth / 2) - (157 / 2)) + (math.sin((currentBeat) + (7) * 2) * 300), 0.001)
    noteTweenY('defaultFPlayerStrumY0', 0, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (4) * 2) * 300), 0.001)
    noteTweenY('defaultFPlayerStrumY1', 1, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (5) * 2) * 300), 0.001)
    noteTweenY('defaultFPlayerStrumY2', 2, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (6) * 2) * 300), 0.001)
    noteTweenY('defaultFPlayerStrumY3', 3, ((screenHeight / 2) - (157 / 2)) + (math.cos((currentBeat) + (7) * 2) * 300), 0.001)
    noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 50*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 350 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)
		noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 50*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 350 + 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)

		noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + 50*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + 350 - 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)
		noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + 50*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
		noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + 350 - 2000*math.sin((currentBeat+8*0.25)*math.pi), 3)
    setPropertyFromClass('ClientPrefs', 'downScroll', true)
    function opponentNoteHit(id, direction, noteType, isSustainNote)
    cameraShake(game, 0.015, 0.2)
    cameraSetTarget('dad')
    characterPlayAnim('gf', 'scared', true)
    doTweenZoom('camerazoom','camGame',1.05,0.15,'quadInOut')
    setProperty('health', getProperty('health') - 1 * ((getProperty('health')/22))/6)
    end
    function goodNoteHit(id, direction, noteType, isSustainNote)
    cameraSetTarget('boyfriend')
    end
    function noteMiss(direction)
    setProperty('health', getProperty('health') + 0.025)
    end
    function noteMissPress(direction)
    setProperty('health', getProperty('health') + 0.025)
    end
end