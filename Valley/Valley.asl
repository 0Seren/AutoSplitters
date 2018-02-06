state("Valley") {
    bool loading: "mono.dll", 0x261110, 0x538, 0x70;
    int levelID: "mono.dll", 0x261A68, 0xC0, 0xE70;
    bool notEnded: "Valley.exe", 0x11916C0;

    int controlHelper: "Valley.exe", 0x129D3F0, 0x458, 0x100, 0xB0, 0x490;
}

reset{
    bool ret = (old.levelID < current.levelID && current.levelID == 4 && old.levelID != 0);

    if(settings["dbg"] && ret){
        print("[Valley AutoSplitter] -----------------------------");
        print("[Valley AutoSplitter] Reset Block Positive Hit:");
        print("[Valley AutoSplitter] Old LevelID: " + old.levelID.ToString());
        print("[Valley AutoSplitter] Current LevelID: " + current.levelID.ToString());
    }

    return ret;
}

start{
    bool ret = current.levelID == 4 && !current.loading && old.controlHelper == 0 && current.controlHelper == 1;

    if(settings["dbg"] && ret){
        print("[Valley AutoSplitter] -----------------------------");
        print("[Valley AutoSplitter] Start Block Positive Hit:");
        print("[Valley AutoSplitter] Current LevelID: " + current.levelID.ToString());
        print("[Valley AutoSplitter] Current Loading: " + current.loading.ToString());
        print("[Valley AutoSplitter] Old controlHelper: " + old.controlHelper.ToString());
        print("[Valley AutoSplitter] Current controlHelper: " + current.controlHelper.ToString());
    }
    return ret;
}

split{
    bool ret = (old.levelID < current.levelID && current.levelID > 4 && old.levelID != 0) || //Split Between Levels
    (current.levelID == 12 && !current.loading && !current.notEnded && old.notEnded != current.notEnded ); //Split on Last Level

    if(settings["dbg"] && ret){
        print("[Valley AutoSplitter] -----------------------------");
        print("[Valley AutoSplitter] Split Block Positive Hit:");
        print("[Valley AutoSplitter] Old LevelID: " + old.levelID.ToString());
        print("[Valley AutoSplitter] New LevelID: " + current.levelID.ToString());
        print("[Valley AutoSplitter] Loading: " + current.loading.ToString());
        print("[Valley AutoSplitter] New Not Ended: " + current.notEnded.ToString());
        print("[Valley AutoSplitter] Old Not Ended: " + old.notEnded.ToString());
    }

    return ret;
}

isLoading{

    if(settings["dbg"] && old.loading != current.loading){
        print("[Valley AutoSplitter] -----------------------------");
        print("[Valley AutoSplitter] Loading: " + current.loading.ToString());
    }
    return current.loading;
}

startup{
    settings.Add("dbg", false, "Enable Debug Mode");
    settings.SetToolTip("dbg", "When enabled, debug messages will be printed which can be viewed using DbgView filtering by \"[Valley AutoSplitter]\".");
}
