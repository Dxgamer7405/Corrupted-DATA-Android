local nogf = true
local followchars = true;
local del = 0;
local del2 = 0;
local xx = 310;
local yy = 660;
local xx2 = 730;
local yy2 = 790;
local ofs = 30;
local chosen = 0;
local memex = 0;
local memey = 0;
local rotator = 0;

function onCreate()
	-- background shit
	makeLuaSprite('bg', 'redx/back', -770, 60)
    setLuaSpriteScrollFactor('bg', 1, 1)
    scaleObject('bg', 1, 1)
	
	makeLuaSprite('screens', 'redx/screens', -770, 60)
    setLuaSpriteScrollFactor('screens', 1, 1)
    scaleObject('screens', 1, 1)

    makeLuaSprite('vignette', 'redx/vignette', -770, 60)
    setLuaSpriteScrollFactor('vignette', 1, 1)
    scaleObject('vignette', 1, 1)
	
	makeAnimatedLuaSprite('screenTL', 'redx/ScreenTopLeft', -744, 60)
	addAnimationByPrefix('screenTL','static1','static',24,true)
	objectPlayAnimation('screenTL','static1',false)
	setLuaSpriteScrollFactor('screenTL', 1, 1)
	scaleObject('screenTL', 1, 1)
	
	makeAnimatedLuaSprite('screenBL', 'redx/ScreenBottomLeft', -763, 549)
	addAnimationByPrefix('screenBL','static2','static',24,true)
	objectPlayAnimation('screenBL','static2',false)
	setLuaSpriteScrollFactor('screenBL', 1, 1)
	scaleObject('screenBL', 1, 1)
	
	makeAnimatedLuaSprite('screenTR', 'redx/ScreenTopRight', 1287, 60)
	addAnimationByPrefix('screenTR','static3','static',24,true)
	objectPlayAnimation('screenTR','static3',false)
	setLuaSpriteScrollFactor('screenTR', 1, 1)
	scaleObject('screenTR', 1, 1)
	
	makeAnimatedLuaSprite('screenBR', 'redx/ScreenBottomRight', 1431, 548)
	addAnimationByPrefix('screenBR','static4','static',24,true)
	objectPlayAnimation('screenBR','static4',false)
	setLuaSpriteScrollFactor('screenBR', 1, 1)
	scaleObject('screenBR', 1, 1)
	
	makeAnimatedLuaSprite('screenM', 'redx/ScreenMiddle', -49, 60)
	addAnimationByPrefix('screenM','static5','static',24,true)
	objectPlayAnimation('screenM','static5',false)
	setLuaSpriteScrollFactor('screenM', 1, 1)
	scaleObject('screenM', 1, 1)

    if not lowQuality then

    end

    addLuaSprite('bg', false);
	addLuaSprite('screenTL',false);
	addLuaSprite('screenBL',false);
	addLuaSprite('screenTR',false);
	addLuaSprite('screenBR',false);
	addLuaSprite('screenM',false);
    addLuaSprite('screens', false);
    addLuaSprite('vignette', true);
	
	setObjectOrder('bg', 1);
    setObjectOrder('screenTL', 2);
    setObjectOrder('screenBL', 3);
    setObjectOrder('screenTR', 4);
    setObjectOrder('screenBR', 5);
    setObjectOrder('screenM', 6);
	-- this is where the meme image goes
    setObjectOrder('screens', 8);
	setObjectOrder('dadGroup', 9);
    setObjectOrder('boyfriend', 10);
	setObjectOrder('vignette', 11);

end

function onGameOver()
    setProperty('health', -500);
    math.randomseed(os.clock()/4.0)
    local num = math.random(1,16)
    local name = tostring(num)
    playSound('redxdeathlines/' .. name, 1, 'deathquote')
end

function onUpdate(elapsed)
    if nogf == true then
        setProperty('gf.alpha', 0)
    end
    if alpha == true then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    end
	if getProperty('dad.animation.curAnim.name') ~= 'idle' or getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
        setProperty('defaultCamZoom', 0.7)	
		xx = 220
		yy = 640
		xx2 = 830
		yy2 = 890
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
             if getProperty('dad.animation.curAnim.name') == 'Im_god' then
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
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
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