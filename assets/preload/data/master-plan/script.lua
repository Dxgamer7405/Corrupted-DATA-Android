function onCreate()

    --funny songname
    makeLuaSprite('songname', 'songnames/masterplan', -580, 280);
    setLuaSpriteScrollFactor('songname', 0, 0);
    setObjectCamera('songname','camOther')
    addLuaSprite('songname', true);
end

function onUpdate()

    if curStep == 1 then
        doTweenX('songname', 'songname', -0, 0.3, linear)
    end
    if curStep == 7 then
        doTweenX('songname', 'songname', -20, 0.1, linear)
    end
    if curStep == 20 then
        doTweenX('songname', 'songname', -580, 0.5, linear)
    end
    if curStep == 25 then
        removeLuaSprite('songname', true);
    end
end