state("UndeadRiderAsylum_win"){
    int level_id: 0xC66180;
    int counter: 0xCD66F8;
}

start{
    return (current.level_id == 1 && current.level_id != old.level_id) || (current.level_id == 1 && current.counter < old.counter && current.counter < 200);
}

reset{
    return (current.level_id == 1 && old.level_id == 0) || (current.level_id == 1 && current.counter < old.counter && current.counter < 200);
}

split{
    return (current.level_id != 1 && current.level_id == old.level_id + 1);
}
