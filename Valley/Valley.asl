state("Valley") {
    bool loading: "mono.dll", 0x261110, 0x538, 0x70;
    int levelID: "mono.dll", 0x261A68, 0xC0, 0xE70;
    bool notEnded: "Valley.exe", 0x11916C0;

    int controlHelper: "Valley.exe", 0x129D3F0, 0x458, 0x100, 0xB0, 0x48C;
    //int controlHelper2: "Valley.exe", 0x128C5F8, 0x5B8, 0xAE0, 0x9E8, 0x100, 0xB0, 0x48C;
    //int controlHelper3: "Valley.exe", 0x12350B8, 0x798, 0xAE0, 0x9E8, 0x100, 0xB0, 0x48C;
}

reset{
    return  (vars.ableToStart && current.levelID == 4 && old.controlHelper == 0 && current.controlHelper > 0 && !current.loading)
            || (current.levelID == 4 && old.levelID < current.levelID);
}

start{
    bool ret = vars.ableToStart && current.levelID == 4 && old.controlHelper == 0 && current.controlHelper > 32000 && current.controlHelper < 33000 && !current.loading;

    if(ret){
        MessageBox.Show(current.controlHelper.ToString());
        vars.ableToStart = false;
    }
    return ret;
}

split{
    return (old.levelID < current.levelID && current.levelID > 4) ||
    (current.levelID == 12 && !current.loading && !current.notEnded && old.notEnded != current.notEnded );
}

isLoading {
    return current.loading;
}

update{
    if(current.levelID == 4 && old.loading != current.loading && !current.loading){
        vars.ableToStart = true;
    }
}

init{
    vars.ableToStart = false;
}
