function onCreate()

    makeLuaSprite('sign', 'redx/notfinalsign', 340, -100)
    setLuaSpriteScrollFactor('sign', 0, 0)
    scaleObject('sign', 0.8, 0.8)
    addLuaSprite('sign', true)
    setObjectCamera('sign','camOther')

    --funny songname
    makeLuaSprite('songname', 'songnames/carnivorous', -580, 280);
    setLuaSpriteScrollFactor('songname', 0, 0);
    setObjectCamera('songname','camOther')
    addLuaSprite('songname', true);
end

function onUpdate()

    if curStep == 1 then
        doTweenY('sign', 'sign', 20, 0.6, linear)
        doTweenX('songname', 'songname', -0, 0.3, linear)
    end

    if curStep == 5 then
        doTweenY('sign', 'sign', -590, 0.8, linear)
    end
    if curStep == 7 then
        doTweenX('songname', 'songname', -30, 0.1, linear)
    end
    if curStep == 20 then
        doTweenX('songname', 'songname', -580, 0.5, linear)
        removeLuaSprite('sign', true)
    end
    if curStep == 25 then
        removeLuaSprite('songname', true);
    end
end