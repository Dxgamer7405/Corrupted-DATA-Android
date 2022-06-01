local xx = 830;
local yy = 870;
local xx2 = 1130;
local yy2 = 870;
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;
local twos = 0;
local camcounter = 0;
local nogf = true

function onCreate()
	-- background shit
	makeLuaSprite('sky', 'sonix/sky', -370, -270);
    setLuaSpriteScrollFactor('sky', .1, .1);
    scaleObject('sky', .9, .9)

    makeLuaSprite('hills', 'sonix/hills', -810, -210);
    setLuaSpriteScrollFactor('hills', .5, .4);
    scaleObject('hills', 1.2, 1.2)

    makeLuaSprite('lush', 'sonix/lush', -105, 810);
    setLuaSpriteScrollFactor('lush', 1, 1);
    scaleObject('lush', .9, .9);

    makeLuaSprite('trees', 'sonix/trees', -45, 190);
    setLuaSpriteScrollFactor('trees', 1, 1);
    scaleObject('trees', .8, .8);

    makeLuaSprite('floor', 'sonix/grassfloor', -115, 960);
    setLuaSpriteScrollFactor('floor', 1, 1);
    scaleObject('floor', .9, .9);

    makeLuaSprite('grass', 'sonix/grassnshit', -185, 110);
    setLuaSpriteScrollFactor('grass', 1.1, 1.2);
    scaleObject('grass', 1, 1);

    if not lowQuality then

    end

    addLuaSprite('sky', false);
    addLuaSprite('hills', false);
    addLuaSprite('lush', false);
    addLuaSprite('trees', false);
    addLuaSprite('floor', false);
    addLuaSprite('grass', true);

end

function onUpdate()
	currentBeat = (getSongPosition()/1000)*(bpm/120)
	doTweenX('snowfall', 'snow', -1150 -180 * math.sin((currentBeat * 0.30) * math.pi), 0.001)
	if getProperty('snow.y') == -400 then
		setProperty('snow.y', -5460)
		doTweenY('downfall', 'snow', -400, 30)
	end

    if nogf == true then
        setProperty('gf.alpha', 0)
    end
    if alpha == true then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    end
	
	
	if spin == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end
	

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
	end
end