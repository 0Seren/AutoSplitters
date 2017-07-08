state("YookaLaylee64"){
    bool loading : "mono.dll", 0x00295BC8, 0x20, 0x220, 0x0, 0x66;
    bool not_menu_fade_out : "mono.dll", 0x00295BC8, 0x20, 0x220, 0x0, 0x64;
    int fake_not_menu_fade_out : "mono.dll", 0x00295BC8, 0x20, 0x220, 0x0;
}

isLoading{
    return current.loading && current.not_menu_fade_out;
}

start {
    return !current.not_menu_fade_out && old.not_menu_fade_out;
}

init{
    vars.complete = false;
}

update{
    //if loading and not_menu_fade_out are both 0, then not_menu_fade_out should be 1. This error can only be present at the start.

    if(!vars.complete){
        if(current.loading || current.not_menu_fade_out){
            vars.complete = true;
        }
    }

    if(!vars.complete && !current.loading && !current.not_menu_fade_out){
        try {
            game.WriteBytes((IntPtr)current.fake_not_menu_fade_out + 0x64, new byte[] {0x01});
        } catch {
            print("Unable to write bytes!");
        }
    }
}
