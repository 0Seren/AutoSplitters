state("UndeadRiderAsylum_win"){
    int level_id: 0xC66180;
    int counter: 0xCD66F8;
    bool on_end_screen: 0x00CD6DD8, 0x90, 0xf8, 0x8, 0x1d8;
}

start{
    return (current.level_id == 1 && current.level_id != old.level_id) || (current.level_id == 1 && current.counter < old.counter && current.counter < 200);
}

reset{
    return (current.level_id == 1 && old.level_id == 0) || (current.level_id == 1 && current.counter < old.counter && current.counter < 200);
}

split{
    return (current.level_id != 1 && current.level_id == old.level_id + 1) || (current.on_end_screen && current.level_id == 5);
}

isLoading{
    return current.on_end_screen || current.level_id == 0;
}
