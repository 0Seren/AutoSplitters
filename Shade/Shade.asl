state("shade") {
    bool in_game : "engine.dll", 0x1BCBFC, 0x6B4, 0xEE;
}

isLoading {
    return !current.in_game;
}
