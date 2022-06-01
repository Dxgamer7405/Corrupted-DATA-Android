function onCreate()
    makeAnimatedLuaSprite('static', 'redx/staticbrr', -440, -250);
    addAnimationByPrefix('static', 'staticbrr', 'staticbrr', 24);
    objectPlayAnimation('static', 'staticbrr', true);
    setLuaSpriteScrollFactor('static', 0, 0);
    scaleObject('static', 2, 2)
    setObjectCamera('static','camOther')

    --funny songname
    makeLuaSprite('songname', 'songnames/truered', -580, 280);
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

    if curStep == 688 or curStep == 1472 or curStep == 2240 or curStep == 3008 then
        objectPlayAnimation('static', 'staticbrr', true);
        addLuaSprite('static', true);
        playSound('staticbrr', 1);
    end

    if curStep == 693 or curStep == 1477 or curStep == 2245 or curStep == 3013 then
       removeLuaSprite('static', false);
    end

end