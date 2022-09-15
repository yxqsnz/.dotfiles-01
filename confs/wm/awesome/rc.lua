local logger = require('core.logger')('Setup')
print([[                      :::!~!!!!!:.
                  .xUHWH!! !!?M88WHX:.
                .X*#M@$!!  !X!M$$$$$$WWx:.
               :!!!!!!?H! :!$!$$$$$$$$$$8X:
              !!~  ~:~!! :~!$!#$$$$$$$$$$8X:
             :!~::!H!<   ~.U$X!?R$$$$$$$$MM!
             ~!~!!!!~~ .:XW$$$U!!?$$$$$$RMM!
               !:~~~ .:!M"T#$$$$WX??#MRRMMM!
               ~?WuxiW*`   `"#$$$$8!!!!??!!!
             :X- M$$$$       `"T#$T~!8$WUXU~
            :%`  ~#$$$m:        ~!~ ?$$$$$$
          :!`.-   ~T$$$$8xx.  .xWW- ~""##*"
.....   -~~:<` !    ~?T#$$@@W@*?$$      /`
W$@@M!!! .!~~ !!     .:XUW$W!~ `"~:    :
#"~~`.:x%`!!  !H:   !WM$$$$Ti.: .!WUn+!`
:::~:!!`:X~ .: ?H.!u "$$$B$$$!W:U!T$$M~
.~~   :X@!.-~   ?@WTWo("*$$$W$TH$! `
Wi.~!X$?!-~    : ?$$$B$Wu("**$RM!
$R@i.~~ !     :   ~$$$$$B$$en:``
?MXT@Wx.~    :     ~"##*$$$$M~

    ___        _______ ____   ___  __  __ _____ 
   / \ \      / / ____/ ___| / _ \|  \/  | ____|
  / _ \ \ /\ / /|  _| \___ \| | | | |\/| |  _|  
 / ___ \ V  V / | |___ ___) | |_| | |  | | |___ 
/_/   \_\_/\_/  |_____|____/ \___/|_|  |_|_____|
                                                
]])
logger:info('Starting awesome %s', awesome.version)

-- Load hooks
require('hooks')

logger:debug('Loading user config')
-- Load keybindings
require('user.maps')
logger:info('Loaded keymaps')

require('user.rules')
logger:info('Loaded rules')
