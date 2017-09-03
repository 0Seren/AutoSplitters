state("YookaLaylee64"){
    bool not_menu_fade_out : "mono.dll", 0x295BC8, 0x20, 0x240, 0x0, 0x64;
    bool loading : "mono.dll", 0x295BC8, 0x20, 0x240, 0x0, 0x66;
}

isLoading{
    return current.loading && current.not_menu_fade_out;
}

start {
    bool ret = false;
    if(current.not_menu_fade_out && current.not_menu_fade_out != old.not_menu_fade_out){
        vars.able_to_start = true;
    }

    if(vars.able_to_start && current.loading != old.loading && !current.loading){
        ret = true;
        vars.able_to_start = false;
    }

    return ret;
}

init{
    vars.able_to_start = false;
}
