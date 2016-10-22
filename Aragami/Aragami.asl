state("Aragami") {
    int level_code : 0x13901A0;
    int loading : 0x129FC0C;
}

init {
    //Simple Address:
    vars.menu = 17;
    vars.chapter_1 = 117;
    vars.chapter_2 = 191;
    vars.chapter_3 = 85;
    vars.chapter_4 = 191;
    vars.chapter_5 = 203;
    vars.chapter_6 = 227;
    vars.chapter_7 = 153;
    vars.chapter_8 = 141;
    vars.chapter_9 = 55;
    vars.chapter_10 = 113;
    vars.chapter_11 = 161;
    vars.chapter_12 = 111;
    vars.chapter_13 = 207;

    //control helping
    vars.prev_level_code = 17;
}

update {
    if(old.level_code != 1) {
        vars.prev_level_code = old.level_code;
    }
}

start {
    return old.level_code != current.level_code && current.level_code == vars.chapter_1;
}

reset {
    return old.level_code != current.level_code && current.level_code == vars.chapter_1;
}

split {
    return (old.level_code == 1 && current.level_code != 1 && current.level_code != vars.menu && current.level_code != vars.prev_level_code);
}

isLoading {
    return current.level_code == vars.menu || current.loading != 0;
}
