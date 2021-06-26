--[[
           _                          
          | |                         
      ___ | |__    __ _  _ __    ___  
     / __|| '_ \  / _` || '_ \  / _ \ 
    | (__ | | | || (_| || |_) || (_) |
     \___||_| |_| \__,_|| .__/  \___/ 
                        | |           
                        |_|           

    https://blast.hk/members/112329/
    https://vk.com/amid24
        
]]

--[[
           _                          
          | |                         
      ___ | |__    __ _  _ __    ___  
     / __|| '_ \  / _` || '_ \  / _ \ 
    | (__ | | | || (_| || |_) || (_) |
     \___||_| |_| \__,_|| .__/  \___/ 
                        | |           
                        |_|           

    https://blast.hk/members/112329/
    https://vk.com/amid24
        
]]

script_name('Separated VIP chat by chapo')
script_properties('work-in-pause')

local blacklistedwords = {
    'авотхуй',
    'ахуеть',
    'безпезды',
    'безпизды',
    'бля',
    'блябуду',
    'бляди',
    'блядиада',
    'блядина',
    'блядище',
    'блядский',
    'блядства',
    'блядство',
    'блядушник',
    'блядь',
    'блядью',
    'блять',
    'взъебну',
    'взъебнул',
    'взъебнуть',
    'впизду',
    'впиздячил',
    'вхуярил',
    'вхуярило',
    'вхуярить',
    'выблядок',
    'выебал',
    'выебать',
    'выебон',
    'гад',
    'гадина',
    'гандон',
    'гандон',
    'гандонище',
    'гандоша',
    'гнида',
    'говнюк',
    'голоёбица',
    'гомодрила',
    'гондон',
    'далбаёбина',
    'дебил',
    'дебилойд',
    'дерьмо',
    'дибил',
    'доебался',
    'долбаеп',
    'долбоёб',
    'долбоеб',
    'допизды',
    'дохуя',
    'дура',
    'дурак',
    'дурачина',
    'дурень',
    'ебало',
    'ебальник',
    'ебанёт',
    'ебанат',
    'ебанатик',
    'ебанатство',
    'ебанет',
    'ебанешь',
    'ебанул',
    'ебануться',
    'ебаныйврот',
    'ебанько',
    'ебарь',
    'ебасос',
    'ебать',
    'ебашит',
    'ебашить',
    'ебенить',
    'ебистика',
    'еблан',
    'еблище',
    'еблищу',
    'ебну',
    'ебнул',
    'ебнули',
    'ебнуть',
    'ебнуться',
    'ебсти',
    'ёб',
    'ёбарь',
    'ёбля',
    'ёбнуть',
    'жидоёб',
    'заебал',
    'заебался',
    'заебательский',
    'заебать',
    'заебаться',
    'заебешься',
    'заебись',
    'заеблось',
    'заебнуться',
    'заебца',
    'залупа',
    'залупается',
    'залупаюсь',
    'залупился',
    'злоебучий',
    'идиот',
    'идиотина',
    'изъебнулся',
    'козлоёбина',
    'лох',
    'лохудра',
    'лошара',
    'лошок',
    'манда',
    'мандавошка',
    'матерщинник',
    'мозгоёб',
    'мудаг',
    'мудак',
    'мудила',
    'мудиле',
    'мудило',
    'мудоеб',
    'мудя',
    'мудям',
    'наебал',
    'наебщик',
    'невъебенно',
    'невъебенный',
    'нецензурщина',
    'объебал',
    'однохуйственно',
    'опёздл',
    'опездл',
    'опизденел',
    'опизденело',
    'отпиздил',
    'отпиздить',
    'отхуярить',
    'отъёбанный',
    'отъебали',
    'отъебать',
    'охуевать',
    'охуевший',
    'охуеть',
    'пёзды',
    'падла',
    'педик',
    'педрила',
    'педриле',
    'педрилко',
    'педрило',
    'педрилу',
    'пендос',
    'переебал',
    'пидар',
    'пидараз',
    'пидарас',
    'пидарюка',
    'пидор',
    'пидораз',
    'пидорас',
    'пидр',
    'пизда',
    'пиздабол',
    'пиздакрыл',
    'пиздализ',
    'пиздануть',
    'пиздатый',
    'пиздеть',
    'пиздец',
    'пиздецкий',
    'пиздил',
    'пиздить',
    'пиздобратия',
    'пиздоватизм',
    'пиздоватый',
    'пиздовать',
    'пиздокрыл',
    'пиздос',
    'пиздуй',
    'пиздун',
    'пиздюлина',
    'пизды',
    'пиндос',
    'подиканахуй',
    'подъебка',
    'поебать',
    'поебень',
    'поебота',
    'поеботина',
    'попизде',
    'попиздили',
    'похуизм',
    'похуй',
    'похую',
    'пошелнахуй',
    'пошелпопизде',
    'придурок',
    'проебал',
    'распиздон',
    'распиздяй',
    'скотоёб',
    'скотоебина',
    'сосихуй',
    'сосихуйский',
    'спиздил',
    'сракохуй',
    'страхоёбище',
    'страхуилина',
    'сука',
    'сучара',
    'сучонок',
    'сцуко',
    'тупарылый',
    'тупица',
    'тупышка',
    'уёбище',
    'уебан',
    'уебать',
    'уебистче',
    'урод',
    'уродец',
    'уродина',
    'ушлепок',
    'хитровыебанная',
    'хитровыебанный',
    'хуёво',
    'хуевато',
    'хуеглот',
    'хуегрыз',
    'хуем',
    'хуеплет',
    'хуепутало',
    'хуесос',
    'хуета',
    'хуетень',
    'хуи',
    'хуило',
    'хуита',
    'хуй',
    'хуйвам',
    'хуйвамвсем',
    'хуйвот',
    'хуйли',
    'хуйлище',
    'хуйложу',
    'хуйморжовый',
    'хуйнуть',
    'хуйня',
    'хуйтам',
    'хуйтебе',
    'хулинадо',
    'хулисмотришь',
    'хуя',
    'хуяк!',
    'хуякс',
    'хуярил',
    'хуярить',
    'хуячить',
    'чмо',
    'чмошник',
    'чмырь',
    'eblo',
    'huhuy',
    'hui',
    'huy',
    'fuck',
    'pidor',
    'pizda',
    'pizdec',
    'ueban',
    'zalupa',
}

local imgui = require('imgui')
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local sampev = require 'lib.samp.events'
local inicfg = require 'inicfg'

local directIni = 'SeparatedVIPChatByChapo.ini'
local ini = inicfg.load(inicfg.load({
    lastmessages = {
        enabled = true,
        fontsize = 9,
        font = 'Tahoma',
        lines = 5,
        posX = 50,
        posY = 300,
    },
    main = {
        enabled = true,
        show_new = true,
        renderlast = true,
        maxlines = 50,
        vipsend = true,
        showtime = false,
        show_ads = true,
        allow_edit = true,
        search = true,
        antimat = 1,
        admins = false,
    },
    pos = {
        x = 0,
        y = 50,
    },
    size = {
        x = 800,
        y = 150,
    },
    color_back = {
        r = 0,
        g = 0,
        b = 0,
        a = 0.5,
    },
    color_scroll = {
        r = 0,
        g = 0,
        b = 0,
        a = 0.5,
    },
    color_scroll_p = {
        r = 1,
        g = 0,
        b = 0.3,
        a = 0.5,
    },
    color_vipsend_input = {
        r = 0,
        g = 0,
        b = 0,
        a = 0.5,
    },
    color_vipsend_button = {
        r = 1,
        g = 0,
        b = 0.3,
        a = 0.5,
    },
    color_vipsend_text = {
        r = 1,
        g = 1,
        b = 1,
        a = 1,
    },
    color_ads = {           --цвет объявлений
        r = 0,
        g = 0,
        b = 0,
        a = 1,
    },
    color_tag_vip = {       --цвет тега "[VIP]"
        r = 0.39,
        g = 0.58,
        b = 0.93,
        a = 1,
    },
    color_tag_premium = {   --цвет тега "[PREMIUM]"
        r = 0.95,
        g = 0.27,
        b = 0.99,
        a = 1,
    },
    color_vr_msg = {        --цвет сообщения в вип чате
        r = 1,
        g = 1,
        b = 1,
        a = 1,
    },
    color_admins = {        --цвет сообщения в вип чате
        r = 1,
        g = 0.31,
        b = 0.31,
        a = 1,
    },
    
}, directIni))
inicfg.save(ini, directIni)



local tag = '{ff004d}['..thisScript().name..']:{ffffff} '

--==[ADS]==--
--local list_ads = {}
local show_ads = imgui.ImBool(ini.main.show_ads)
--local ads_mode = imgui.ImInt(ini.ads.mode) --0 - default chat, 1 - vip chat, 2 - room

--==[LAST MESSAGES]==--
local last_lines = imgui.ImInt(ini.lastmessages.lines)
local showlast = imgui.ImBool(ini.lastmessages.enabled)
local last_font = imgui.ImBuffer(ini.lastmessages.font, 256)
local last_fontsize = imgui.ImInt(ini.lastmessages.fontsize)
local font = renderCreateFont(last_font.v, last_fontsize.v, 5)
local last_posX = imgui.ImInt(ini.lastmessages.posX)
local last_posY = imgui.ImInt(ini.lastmessages.posY)
local last_same = imgui.ImBool(false)
local last_editing = false

--==[MAIN SETTINGS]==--
local enabled = imgui.ImBool(ini.main.enabled)
local settings = imgui.ImBool(false)
local window = imgui.ImBool(false)
local admins = imgui.ImBool(ini.main.admins)
local antimat = imgui.ImInt(ini.main.antimat)

local show_new = imgui.ImBool(ini.main.show_new)

local search = imgui.ImBool(ini.main.search)
local search_input = imgui.ImBuffer(256)


local maxLines = imgui.ImInt(ini.main.maxlines)
local showlast = imgui.ImBool(ini.main.renderlast)
local showtime = imgui.ImBool(ini.main.showtime)

--==[POSITION]==--
local posX = imgui.ImInt(ini.pos.x)
local posY = imgui.ImInt(ini.pos.y)

--==[LINE EDITOR]==--
local edit_text = imgui.ImBuffer(256)
local edit_window = imgui.ImBool(false)
local allow_edit = imgui.ImBool(ini.main.allow_edit)

--==[VIP SEND]==--
local vipsend = imgui.ImBool(ini.main.vipsend)
local vipsend_input = imgui.ImBuffer(129)
local vipsend_lastinput = ''

--==[SIZE]==--
local sizeX = imgui.ImInt(ini.size.x)
local sizeY = imgui.ImInt(ini.size.y)

--==[COLORS]==--
local color_back = imgui.ImFloat4(ini.color_back.r, ini.color_back.g, ini.color_back.b, ini.color_back.a)
local color_scroll = imgui.ImFloat4(ini.color_scroll.r, ini.color_scroll.g, ini.color_scroll.b, ini.color_scroll.a)
local color_scroll_p = imgui.ImFloat4(ini.color_scroll_p.r, ini.color_scroll_p.g, ini.color_scroll_p.b, ini.color_scroll_p.a)
local color_vipsend_input = imgui.ImFloat4(ini.color_vipsend_input.r, ini.color_vipsend_input.g, ini.color_vipsend_input.b, ini.color_vipsend_input.a)
local color_vipsend_button = imgui.ImFloat4(ini.color_vipsend_button.r, ini.color_vipsend_button.g, ini.color_vipsend_button.b, ini.color_vipsend_button.a)
local color_vipsend_text = imgui.ImFloat4(ini.color_vipsend_text.r, ini.color_vipsend_text.g, ini.color_vipsend_text.b, ini.color_vipsend_text.a)

--==[CHAT COLORS]==--
local color_ads = imgui.ImFloat4(ini.color_ads.r, ini.color_ads.g, ini.color_ads.b, ini.color_ads.a)
local color_tag_vip = imgui.ImFloat4(ini.color_tag_vip.r, ini.color_tag_vip.g, ini.color_tag_vip.b, ini.color_tag_vip.a)
local color_tag_premium = imgui.ImFloat4(ini.color_tag_premium.r, ini.color_tag_premium.g, ini.color_tag_premium.b, ini.color_tag_premium.a)
local color_vr_msg = imgui.ImFloat4(ini.color_vr_msg.r, ini.color_vr_msg.g, ini.color_vr_msg.b, ini.color_vr_msg.a)

local color_admins = imgui.ImFloat4(ini.color_admins.r, ini.color_admins.g, ini.color_admins.b, ini.color_admins.a)

local chat = {'Здесь будут отображатся сообщения из VIP чата'}
local lastmsg = {'', ''}

local hex_color_ads = '{ffffff}'
local hex_color_color_tag_vip = '{ffffff}'
local hex_color_color_tag_premium = '{ffffff}'
local hex_color_vr_msg = '{ffffff}'

function join_argb(a, r, g, b)
    local argb = b  -- b
    argb = bit.bor(argb, bit.lshift(g, 8))  -- g
    argb = bit.bor(argb, bit.lshift(r, 16)) -- r
    argb = bit.bor(argb, bit.lshift(a, 24)) -- a
    return argb
end
  
function explode_argb(argb)
    local a = bit.band(bit.rshift(argb, 24), 0xFF)
    local r = bit.band(bit.rshift(argb, 16), 0xFF)
    local g = bit.band(bit.rshift(argb, 8), 0xFF)
    local b = bit.band(argb, 0xFF)
    return a, r, g, b
end

local russian_characters = {
    [168] = 'Ё', [184] = 'ё', [192] = 'А', [193] = 'Б', [194] = 'В', [195] = 'Г', [196] = 'Д', [197] = 'Е', [198] = 'Ж', [199] = 'З', [200] = 'И', [201] = 'Й', [202] = 'К', [203] = 'Л', [204] = 'М', [205] = 'Н', [206] = 'О', [207] = 'П', [208] = 'Р', [209] = 'С', [210] = 'Т', [211] = 'У', [212] = 'Ф', [213] = 'Х', [214] = 'Ц', [215] = 'Ч', [216] = 'Ш', [217] = 'Щ', [218] = 'Ъ', [219] = 'Ы', [220] = 'Ь', [221] = 'Э', [222] = 'Ю', [223] = 'Я', [224] = 'а', [225] = 'б', [226] = 'в', [227] = 'г', [228] = 'д', [229] = 'е', [230] = 'ж', [231] = 'з', [232] = 'и', [233] = 'й', [234] = 'к', [235] = 'л', [236] = 'м', [237] = 'н', [238] = 'о', [239] = 'п', [240] = 'р', [241] = 'с', [242] = 'т', [243] = 'у', [244] = 'ф', [245] = 'х', [246] = 'ц', [247] = 'ч', [248] = 'ш', [249] = 'щ', [250] = 'ъ', [251] = 'ы', [252] = 'ь', [253] = 'э', [254] = 'ю', [255] = 'я',
}
function string.rlower(s)
    s = s:lower()
    local strlen = s:len()
    if strlen == 0 then return s end
    s = s:lower()
    local output = ''
    for i = 1, strlen do
        local ch = s:byte(i)
        if ch >= 192 and ch <= 223 then -- upper russian characters
            output = output .. russian_characters[ch + 32]
        elseif ch == 168 then -- Ё
            output = output .. russian_characters[184]
        else
            output = output .. string.char(ch)
        end
    end
    return output
end

function main()
    while not isSampAvailable() do wait(200) end
    sampAddChatMessage(tag..'загружен!', -1)
    sampRegisterChatCommand('svip', function()
        settings.v = not settings.v
    end)
    testColor()
    imgui.Process = false
    window.v = true  --show window
    while true do
        wait(0)
        imgui.Process = window.v
        if window.v or settings.v then imgui.Process = true else imgui.Process = false end
        if enabled.v then
            if sampIsChatInputActive() then
                --window.v = true
                if show_new.v then 
                    window.v = true 
                else 
                    window.v = false 
                    rposX, rposY = last_posX.v, last_posY.v
                        
                    for i = last_lines.v - 1, 0, -1 do
                        if chat[#chat - i] ~= nil then
                            renderFontDrawText(font, chat[#chat - i], rposX, rposY, 0xFFFFFFFF, 0x90000000)
                            rposY = rposY + 18
                        end
                    end
                end
            else
                window.v = false 
                
                if not isGamePaused() and showlast.v then
                    
                    lines = ''
                    --cposX, cposY, csizeX = getChatParams()
                    --rposX, rposY = cposX + posX.v, cposY + posY.v

                    if not last_editing then
                        rposX, rposY = last_posX.v, last_posY.v
                        
                        for i = last_lines.v - 1, 0, -1 do
                            if chat[#chat - i] ~= nil then
                                renderFontDrawText(font, chat[#chat - i], rposX, rposY, 0xFFFFFFFF, 0x90000000)
                                rposY = rposY + 18
                            end
                        end
                    else
                        lines = 'строка 1\nстрока 2\nстрока 3\nстрока 4\nстрока 5'

                        rposX, rposY = getCursorPos()
                        if wasKeyPressed(1) then
                            save()
                            sampAddChatMessage(tag..'положение X: '..rposX..', Y: '..rposY..' сохранено!', -1)
                            last_editing = false
                            last_posX.v, last_posY.v = rposX, rposY
                        end
                        if wasKeyPressed(2) then last_editing = false end

                        for i = last_lines.v - 1, 0, -1 do
                            if chat[#chat - i] ~= nil then
                                renderFontDrawText(font, chat[#chat - i], rposX, rposY, 0xFFFFFFFF, 0x90000000)
                                rposY = rposY + 18
                            end
                        end

                    end
                    

                    
                end
            end
        else
            window.v = false 
        end
    end
end

function imgui.OnDrawFrame()
    if settings.v then
        
        --posX, posY, sizeX = getChatParams()
        imgui.SetNextWindowPos(imgui.ImVec2(500, 500), imgui.Cond.FirstUseEver)
        imgui.SetNextWindowSize(imgui.ImVec2(325, 350), imgui.Cond.FirstUseEver)
        --imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(color_back.v[1], color_back.v[2], color_back.v[3], color_back.v[4]))
        imgui.Begin('Separated VIP Chat settings', settings)

        imgui.Checkbox(u8'Включить', enabled)
        imgui.Checkbox(u8'Отображать новый чат при открытом чате', show_new)
        imgui.Checkbox(u8'Отображать время', showtime)
        imgui.Checkbox(u8'Перемещать действия админов в новый чат', admins)
        imgui.Checkbox(u8'Перемещать объявления в новый чат', show_ads)
        imgui.Checkbox(u8'Разрешить редактирование строк (ЛКМ)', allow_edit)
        imgui.Checkbox(u8'Отображать строку поиска', search)

        imgui.Spacing()
        
        

        --imgui.Spacing(); imgui.Separator(); imgui.SameLine(); imgui.CenterTextColoredRGB('Положение относительно поля ввода')
        

        if imgui.CollapsingHeader(u8'Цвета') then
            if show_new.v then
                imgui.ColorEdit4(u8'Цвет фона', color_back, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
                imgui.ColorEdit4(u8'Цвет скроллбара', color_scroll, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
                imgui.ColorEdit4(u8'Цвет ползунка', color_scroll_p, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
                imgui.Separator()
            end
            imgui.ColorEdit4(u8'Цвет объявлений', color_ads, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
            imgui.ColorEdit4(u8'Цвет тега "VIP"', color_tag_vip, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
            imgui.ColorEdit4(u8'Цвет тега "PREMIUM"', color_tag_premium, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
            if admins.v then
                imgui.Separator()
                imgui.ColorEdit4(u8'Цвет действий админов', color_admins, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
            end

            
            --imgui.ColorEdit4(u8'Цвет после тега', color_vr_msg, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)

            imgui.NewLine()
        end


        if show_new.v then
            if imgui.CollapsingHeader(u8'Размер') then
                imgui.PushItemWidth(175)
                imgui.Text(u8'Кол-во строк: ') imgui.SameLine() imgui.SetCursorPosX(100) imgui.InputInt(u8'##Количество строк', maxLines) imgui.SameLine() if imgui.Button('C##linesm', imgui.ImVec2(20, 20)) then maxLines.v = 50 end
                imgui.Text(u8'Размер X: ') imgui.SameLine() imgui.SetCursorPosX(100) imgui.SliderInt('##Xsize', sizeX, 1, 1500) imgui.SameLine() if imgui.Button('C##sizex', imgui.ImVec2(20, 20)) then sizeX.v = 800 end
                imgui.Text(u8'Размер Y: ') imgui.SameLine() imgui.SetCursorPosX(100) imgui.SliderInt('##Ysize', sizeY, 1, 700) imgui.SameLine()  if imgui.Button('C##sizey', imgui.ImVec2(20, 20)) then sizeY.v = 200 end
                imgui.PopItemWidth()
                imgui.NewLine()
            end


            if imgui.CollapsingHeader(u8'Положение относительно поля ввода') then
                imgui.PushItemWidth(175)
                imgui.Text(u8'Положение X: ') imgui.SameLine() imgui.SetCursorPosX(100) imgui.SliderInt('##Xpos', posX, -100, 1000) imgui.SameLine() if imgui.Button('C##posex', imgui.ImVec2(20, 20)) then posX.v = 0 end --imgui.InputInt(u8'X', posX)
                imgui.Text(u8'Положение Y: ') imgui.SameLine() imgui.SetCursorPosX(100) imgui.SliderInt('##Ypos', posY, -100, 1000) imgui.SameLine() if imgui.Button('C##posey', imgui.ImVec2(20, 20)) then posY.v = 50 end --imgui.InputInt(u8'Y', posY)
                imgui.PopItemWidth()
                imgui.NewLine()
            end
            if imgui.CollapsingHeader(u8'Отправка в вип чат') then
                imgui.Checkbox(u8'Cтрока отправки сообщения в вип чат', vipsend)
                if vipsend.v then
                    imgui.ColorEdit4(u8'Цвет поля ввода', color_vipsend_input, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
                    imgui.ColorEdit4(u8'Цвет кнопки', color_vipsend_button, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
                    imgui.ColorEdit4(u8'Цвет текста', color_vipsend_text, imgui.ColorEditFlags.NoInputs + imgui.ColorEditFlags.AlphaBar)
                end
                imgui.NewLine()
            end
        end

        winsize = imgui.GetWindowSize()
        if imgui.CollapsingHeader(u8'Последние сообщения') then
            imgui.Checkbox(u8'Отображать последние сообщения', showlast)

            imgui.PushItemWidth(175)
            imgui.Text(u8'Шрифт: ')         imgui.SameLine(); imgui.SetCursorPosX(110) if imgui.InputText(u8'##Шрифт', last_font) then changefont() end
            imgui.Text(u8'Размер шрифта: ') imgui.SameLine(); imgui.SetCursorPosX(110) if imgui.InputInt(u8'##Размер шрифта', last_fontsize) then changefont() end
            imgui.Text(u8'Кол-во строк: ')  imgui.SameLine(); imgui.SetCursorPosX(110) imgui.InputInt(u8'##Кол-во строк', last_lines) 
            imgui.PopItemWidth()
            
            imgui.SetCursorPosX(5)
            winsize = imgui.GetWindowSize()

            if imgui.Button(u8'Изменить положение', imgui.ImVec2(winsize.x - 10, 20)) then
                last_editing = true
                sampAddChatMessage(tag..'ЛКМ для сохранения, ПКМ для отмены', -1)
            end
            imgui.NewLine()
        end

        
        imgui.Separator()
        imgui.SetCursorPosX(5)
       
        

        if imgui.Button(u8'Сохранить настройки', imgui.ImVec2(winsize.x - 10, 20)) then save(); settings.v = false end
        imgui.CenterTextColoredRGB('Автор: {ff004d}chapo')

        imgui.End()
        --imgui.PopStyleColor()
    end
    if window.v then
        curwsizex = sizeX.v
        curwsizey = sizeY.v
        cposX, cposY, csizeX = getChatParams()
        imgui.SetNextWindowPos(imgui.ImVec2(cposX + posX.v, cposY + posY.v), imgui.Cond.Always)
        imgui.SetNextWindowSize(imgui.ImVec2(sizeX.v, sizeY.v), imgui.Cond.Always)


        --BACK
        imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(color_back.v[1], color_back.v[2], color_back.v[3], color_back.v[4]))

        --SCROLL
        imgui.PushStyleColor(imgui.Col.ScrollbarBg, imgui.ImVec4(color_scroll.v[1], color_scroll.v[2], color_scroll.v[3], color_scroll.v[4]))
        imgui.PushStyleColor(imgui.Col.ScrollbarGrab, imgui.ImVec4(color_scroll_p.v[1], color_scroll_p.v[2], color_scroll_p.v[3], color_scroll_p.v[4]))
        imgui.PushStyleColor(imgui.Col.ScrollbarGrabHovered, imgui.ImVec4(color_scroll_p.v[1], color_scroll_p.v[2], color_scroll_p.v[3], color_scroll_p.v[4]))
        imgui.PushStyleColor(imgui.Col.ScrollbarGrabActive, imgui.ImVec4(color_scroll_p.v[1], color_scroll_p.v[2], color_scroll_p.v[3], color_scroll_p.v[4]))
        imgui.PushStyleColor(imgui.Col.Separator, imgui.ImVec4(color_scroll_p.v[1], color_scroll_p.v[2], color_scroll_p.v[3], color_scroll_p.v[4]))



        --imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(color_back.v[1], color_back.v[2], color_back.v[3], color_back.v[4]))
        --imgui.PushStyleColor(imgui.Col.WindowBg, imgui.ImVec4(color_back.v[1], color_back.v[2], color_back.v[3], color_back.v[4]))


        imgui.Begin('ChatWindow', window, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoMove)
            if search.v then
                imgui.SetCursorPos(imgui.ImVec2(5, 5))

                imgui.Text(u8'Поиск: '); imgui.SameLine()
                searchTextSize = imgui.CalcTextSize(u8'Поиск: ')

                imgui.PushItemWidth(sizeX.v - 15 - searchTextSize.x)
                if imgui.InputText('##searchinput', search_input) then search_input.v:find(search_input.v:gsub("%p", "%%%1")) end
                imgui.PopItemWidth()
                
                imgui.Separator()

                imgui.SetCursorPos(imgui.ImVec2(5, 30))
            else
                imgui.SetCursorPos(imgui.ImVec2(5, 5))
            end

            if vipsend.v and not search.v then
                imgui.BeginChild('chat', imgui.ImVec2(sizeX.v - 10, sizeY.v - 35), false)
            elseif vipsend.v and search.v then
                imgui.BeginChild('chat', imgui.ImVec2(sizeX.v - 10, sizeY.v - 35 - 25), false)
            elseif not vipsend.v and search.v then
                imgui.BeginChild('chat', imgui.ImVec2(sizeX.v - 10, sizeY.v - 35), false)
            elseif not vipsend.v and not search.v then
                imgui.BeginChild('chat', imgui.ImVec2(sizeX.v - 10, sizeY.v - 12), false)
            end
            
                for i = 1, #chat do
                    --if showtime.v then time = os.date('[%H:%M:%S] ') else time = '' end
                    --[[
                    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0, 0, 0, 0))
                    imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(1, 1, 1, 1))
                    if imgui.Button(u8'•', imgui.ImVec2(20, 20)) then 
                        imgui.BeginTooltip()
                            imgui.Text('sad')
                        imgui.EndTooltip()

                    end
                    imgui.PopStyleColor(2)
                    imgui.SameLine()
                    ]]
                    if search.v and string.len(search_input.v) ~= 0 then 
                        if string.find(u8(chat[i]), search_input.v, 1, true) then
                            imgui.TextColoredRGB(u8(chat[i]))
                        end
                    else
                        imgui.TextColoredRGB(u8(chat[i]))
                    end 
                    
                    if allow_edit.v then
                        if imgui.IsItemClicked(0) then imgui.OpenPopup(u8'Управление строкой'); edit_window.v = true; edit_text.v = u8(chat[i]) end

                        if imgui.BeginPopupModal(u8'Управление строкой', edit_window, imgui.WindowFlags.NoResize) then
                            imgui.SetWindowSize(imgui.ImVec2(300, 150))
                            imgui.SetCursorPosX(5)
                            imgui.PushItemWidth(290)
                            if imgui.InputText('##edit_text', edit_text) then chat[i] = u8:decode(edit_text.v) end
                            imgui.PopItemWidth()

                            imgui.SetCursorPos(imgui.ImVec2(5, 100)); if imgui.Button(u8'Скопировать текст в буффер обмена', imgui.ImVec2(290, 20)) then setClipboardText(u8:decode(edit_text.v)) end
                            imgui.SetCursorPos(imgui.ImVec2(5, 125)); if imgui.Button(u8'Закрыть', imgui.ImVec2(290, 20)) then imgui.CloseCurrentPopup(); edit_window.v = false end

                            imgui.EndPopup()
                        end
                    end

                    imgui.SetScrollHere()
                end
            imgui.EndChild()

            if vipsend.v then
                imgui.PushStyleColor(imgui.Col.FrameBg, imgui.ImVec4(color_vipsend_input.v[1], color_vipsend_input.v[2], color_vipsend_input.v[3], color_vipsend_input.v[4]))
                imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(color_vipsend_button.v[1], color_vipsend_button.v[2], color_vipsend_button.v[3], color_vipsend_button.v[4]))
                imgui.PushStyleColor(imgui.Col.Text, imgui.ImVec4(color_vipsend_text.v[1], color_vipsend_text.v[2], color_vipsend_text.v[3], color_vipsend_text.v[4]))

                imgui.InputText('##vipsend_msg_input', vipsend_input)
                imgui.SameLine()
                if imgui.Button(u8'Отправить') then sampSendChat(u8:decode('/vr '..vipsend_input.v)); vipsend_lastinput = vipsend_input.v; vipsend_input.v = '' end
                imgui.SameLine()
                if imgui.Button(u8'Последнее сообщение') then vipsend_input.v = vipsend_lastinput end

                imgui.PopStyleColor(3)
            end


        imgui.End()

        imgui.PopStyleColor(6)
    end
end

function testColor()
    hex_color_ads = join_argb(color_ads.v[4] * 255, color_ads.v[1] * 255, color_ads.v[2] * 255, color_ads.v[3] * 255)
    hex_color_color_tag_vip = join_argb(color_tag_vip.v[4] * 255, color_tag_vip.v[1] * 255, color_tag_vip.v[2] * 255, color_tag_vip.v[3] * 255)
    hex_color_color_tag_premium = join_argb(color_tag_premium.v[4] * 255, color_tag_premium.v[1] * 255, color_tag_premium.v[2] * 255, color_tag_premium.v[3] * 255)
    hex_color_vr_msg = join_argb(color_vr_msg.v[4] * 255, color_vr_msg.v[1] * 255, color_vr_msg.v[2] * 255, color_vr_msg.v[3] * 255)

    hex_color_admins = join_argb(color_admins.v[4] * 255, color_admins.v[1] * 255, color_admins.v[2] * 255, color_admins.v[3] * 255)
    
    
end

function changefont()
    showlast.v = false
    renderReleaseFont(font)
    font = renderCreateFont(last_font.v, last_fontsize.v, 5)
    showlast.v = true
end

--[22:30:02] Объявление: В баре 87 отдыхает много людей.Ждем вас!. Отправил: Artem_Neiman[257] Тел. 3434444
--[22:30:02] Отредактировал сотрудник СМИ [ LS ] : Feleciano_Barroso[642]

function sampev.onSendCommand(text)
    if text:find('/vr (.+)') then
        msg = text:match('/vr (.+)')
        for i = 1, #blacklistedwords do
            if text:find(blacklistedwords[i]) then 
                if antimat.v == 1 then
                    --замена мата на ***
                    nomat = ''
                    for i = 1, string.len(blacklistedwords[i]) do nomat = nomat..'*' end
                    result = text:gsub(blacklistedwords[i], nomat)

                    return nomat
                elseif antimat.v == 2 then
                    --отмена отправки
                    sampAddChatMessage(tag..'сообщение "'..msg..'" не было отправлено', -1)
                    return false
                end
                
               
            end
        end
    end
end

function sampev.onServerMessage(color, text)
    if enabled.v then
        hex_color_ads = join_argb(color_ads.v[4] * 255, color_ads.v[1] * 255, color_ads.v[2] * 255, color_ads.v[3] * 255)
        hex_color_color_tag_vip = join_argb(color_tag_vip.v[4] * 255, color_tag_vip.v[1] * 255, color_tag_vip.v[2] * 255, color_tag_vip.v[3] * 255)
        hex_color_color_tag_premium = join_argb(color_tag_premium.v[4] * 255, color_tag_premium.v[1] * 255, color_tag_premium.v[2] * 255, color_tag_premium.v[3] * 255)
        hex_color_vr_msg = join_argb(color_vr_msg.v[4] * 255, color_vr_msg.v[1] * 255, color_vr_msg.v[2] * 255, color_vr_msg.v[3] * 255)
        hex_color_admins = join_argb(color_admins.v[4] * 255, color_admins.v[1] * 255, color_admins.v[2] * 255, color_admins.v[3] * 255)

        if text:find('%[VIP%] {FFFFFF}.+%[%d+%]: (.+)') or  text:find('%[PREMIUM%] {FFFFFF}.+%[%d+%]: (.+)') or text:find('%[ADMIN%] {FFFFFF}.+%[%d+%]: (.+)') then --да да, и снова я гений регулярок

            hex_color_color_tag_vip = string.sub(bit.tohex(hex_color_color_tag_vip), 3, 8) 
            hex_color_color_tag_premium = string.sub(bit.tohex(hex_color_color_tag_premium), 3, 8) 
            hex_color_vr_msg = string.sub(bit.tohex(hex_color_vr_msg), 3, 8) 
            --sampAddChatMessage('col1 = '..col1)
            gtext = text:gsub('{6495ED}',  '{'..hex_color_color_tag_vip..'}')
            gtext = gtext:gsub('{F345FC}', '{'..hex_color_color_tag_premium..'}')
            gtext = gtext:gsub('{ffffff}', '{'..hex_color_vr_msg..'}')

            if showtime.v then time = os.date('[%H:%M:%S] ') else time = '' end
            textWithColor = '{'..hex_color_vr_msg..'}'..time..gtext
            if #chat >= maxLines.v then
                table.remove(chat, 1)
            end
            table.insert(chat, #chat + 1, textWithColor)

            --ГОВНОКОД, НО Я ЗАЕБАЛСЯ ЭТО ДЕЛАТЬ
            lastmsg[5 - 1] = lastmsg[5]
            lastmsg[5] = text
            return false
        end

        
        if admins.v then
            if text:find('Администратор .+%[%d+%] кикнул игрока .+%[%d+%]%. Причина%: .+') or text:find('Администратор .+%[%d+%] выдал предупреждение игроку .+') or text:find('Администратор .+%[%d+%] забанил игрока .+%[%d+%] на .+ дней. Причина%: .+') or text:find('Администратор .+%[%d+%] заглушил игрока .+%[%d+%] на .+ минут%. Причина%: .+') or text:find('Администратор .+%[%d+%] посадил игрока .+%[%d+%] в деморган на .+ минут%. Причина%: .+') then
                if showtime.v then time = os.date('[%H:%M:%S] ') else time = '' end
                hex_color_vr_msg = string.sub(bit.tohex(hex_color_vr_msg), 3, 8) 
                textWithColor = '{'..bit.tohex(hex_color_admins)..'}'..time..text

               

                if #chat >= maxLines.v then
                    table.remove(chat, 1)
                end
                table.insert(chat, #chat + 1, textWithColor)
                return false
            end
        end
        
        

        --GOVNOCODE
        if show_ads.v then 
            if text:find('Отредактировал сотрудник СМИ') or text:find("Объявление:") then
                hex_color_ads = string.sub(bit.tohex(hex_color_ads), 3, 8) 
                

                if showtime.v then time = os.date('[%H:%M:%S] ') else time = '' end
                textWithColor = '{'..hex_color_ads..'}'..time..text
                if #chat >= maxLines.v then
                    table.remove(chat, 1)
                end
                table.insert(chat, #chat + 1, textWithColor)
            
                --ГОВНОКОД, НО Я ЗАЕБАЛСЯ ЭТО ДЕЛАТЬ
                lastmsg[5 - 1] = lastmsg[5]
                lastmsg[5] = text
                return false
            end
        end
    end
end

function save()
    ini.main.enabled = enabled.v
    ini.main.showtime = showtime.v
    ini.main.show_ads = show_ads.v
    ini.main.admins = admins.v
    ini.main.show_new = show_new.v
    --==[LAST MESSAGES]==--
    ini.lastmessages.lines = last_lines.v
    ini.lastmessages.enabled = showlast.v
    ini.lastmessages.font = last_font.v
    ini.lastmessages.fontsize = last_fontsize.v
    ini.lastmessages.posX = last_posX.v
    ini.lastmessages.posY = last_posY.v
    ini.main.renderlast = showlast.v

    ini.main.allow_edit = allow_edit.v

    --==[MAIN WINDOW]==--
    ini.pos.x = posX.v
    ini.pos.y = posY.v
    ini.size.x = sizeX.v
    ini.size.y = sizeY.v
    ini.main.maxlines = maxLines.v

    ini.main.vipsend = vipsend.v

    ini.color_back.r, ini.color_back.g, ini.color_back.b, ini.color_back.a = color_back.v[1], color_back.v[2], color_back.v[3], color_back.v[4]
    ini.color_scroll.r, ini.color_scroll.g, ini.color_scroll.b, ini.color_scroll.a = color_scroll.v[1], color_scroll.v[2], color_scroll.v[3], color_scroll.v[4]
    ini.color_scroll_p.r, ini.color_scroll_p.g, ini.color_scroll_p.b, ini.color_scroll_p.a = color_scroll_p.v[1], color_scroll_p.v[2], color_scroll_p.v[3], color_scroll_p.v[4]
    ini.color_vipsend_input.r, ini.color_vipsend_input.g, ini.color_vipsend_input.b, ini.color_vipsend_input.a = color_vipsend_input.v[1], color_vipsend_input.v[2], color_vipsend_input.v[3], color_vipsend_input.v[4]
    ini.color_vipsend_button.r, ini.color_vipsend_button.g, ini.color_vipsend_button.b, ini.color_vipsend_button.a = color_vipsend_button.v[1], color_vipsend_button.v[2], color_vipsend_button.v[3], color_vipsend_button.v[4]
    ini.color_vipsend_text.r, ini.color_vipsend_text.g, ini.color_vipsend_text.b, ini.color_vipsend_text.a = color_vipsend_text.v[1], color_vipsend_text.v[2], color_vipsend_text.v[3], color_vipsend_text.v[4]
    
    --==[CHAT COLORS]==--
    ini.color_ads.r, ini.color_ads.g, ini.color_ads.b, ini.color_ads.a = color_ads.v[1], color_ads.v[2], color_ads.v[3], color_ads.v[4]
    ini.color_tag_vip.r, ini.color_tag_vip.g, ini.color_tag_vip.b, ini.color_tag_vip.a = color_tag_vip.v[1], color_tag_vip.v[2], color_tag_vip.v[3], color_tag_vip.v[4]
    ini.color_tag_premium.r, ini.color_tag_premium.g, ini.color_tag_premium.b, ini.color_tag_premium.a = color_tag_premium.v[1], color_tag_premium.v[2], color_tag_premium.v[3], color_tag_premium.v[4]
    ini.color_vr_msg.r, ini.color_vr_msg.g, ini.color_vr_msg.b, ini.color_vr_msg.a = color_vr_msg.v[1], color_vr_msg.v[2], color_vr_msg.v[3], color_vr_msg.v[4]
    ini.color_admins.r, ini.color_admins.g, ini.color_admins.b, ini.color_admins.a = color_admins.v[1], color_admins.v[2], color_admins.v[3], color_admins.v[4]

    inicfg.save(ini, directIni)
end

function getChatParams()
    local in1 = sampGetInputInfoPtr()
    local in1 = getStructElement(in1, 0x8, 4)
    local in2 = getStructElement(in1, 0x8, 4)
    local in3 = getStructElement(in1, 0xC, 4)
    local posY = in3 + 50
    local posX = in2 
    local inputSizeX = getStructElement(in1, 0x10, 4)
    return posX, posY, inputSizeX
end

function applyTheme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
  
  
    style.WindowPadding = ImVec2(6, 4)
    style.WindowRounding = 5.0
    style.FramePadding = ImVec2(5, 2)
    style.FrameRounding = 3.0
    style.ItemSpacing = ImVec2(7, 5)
    style.ItemInnerSpacing = ImVec2(1, 1)
    style.TouchExtraPadding = ImVec2(0, 0)
    style.IndentSpacing = 6.0
    style.ScrollbarSize = 12.0
    style.ScrollbarRounding = 16.0
    style.GrabMinSize = 20.0
    style.GrabRounding = 2.0
  
    style.WindowTitleAlign = ImVec2(0.5, 0.5)

    
    colors[clr.Border] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.WindowBg] = ImVec4(0.13, 0.14, 0.17, 1.00)
    colors[clr.FrameBg] = ImVec4(0.200, 0.220, 0.270, 0.85)
    colors[clr.TitleBg] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.TitleBgActive] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.Button] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.ButtonHovered] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.Separator] = ImVec4(1, 0, 0.3, 1.00)
    --CollapsingHeader
    colors[clr.Header] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.HeaderHovered] = ImVec4(0.68, 0, 0.2, 0.86)
    colors[clr.HeaderActive] = ImVec4(1, 0.24, 0.47, 1.00)
    colors[clr.CheckMark] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.ModalWindowDarkening] = ImVec4(0.200, 0.220, 0.270, 0.73)

    colors[clr.ScrollbarBg] = ImVec4(0.200, 0.220, 0.270, 0.85)
    colors[clr.ScrollbarGrab] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.ScrollbarGrabHovered] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.ScrollbarGrabActive] = ImVec4(1, 0, 0.3, 1.00)

    colors[clr.ButtonActive] = ImVec4(1, 0, 0.3, 1.00)
    
end
applyTheme()

function imgui.TextColoredRGB(text, render_text) -- нужное (наверно)
    local max_float = imgui.GetWindowWidth()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end

            local length = imgui.CalcTextSize(w)
            if render_text == 2 then
                imgui.NewLine()
                imgui.SameLine(max_float / 2 - ( length.x / 2 ))
            elseif render_text == 3 then
                imgui.NewLine()
                imgui.SameLine(max_float - length.x - 5 )
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], text[i])
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(w) end


        end
    end

    render_text(text)
end

function imgui.TextQuestion(text)
    imgui.SameLine()
    imgui.TextDisabled('?')
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(450)
        imgui.TextUnformatted(text)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

function imgui.CenterTextColoredRGB(text)
    local width = imgui.GetWindowWidth()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local textsize = w:gsub('{.-}', '')
            local text_width = imgui.CalcTextSize(u8(textsize))
            imgui.SetCursorPosX( width / 2 - text_width .x / 2 )
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else
                imgui.Text(u8(w))
            end
        end
    end
    render_text(text)
end

