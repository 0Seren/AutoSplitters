state("ASAMU-Win32-Shipping")
{
    int loading : 0x27216EC;
    int scene_counter : 0x25CB14C;
    int level_code : 0x267B578;
    int story_state : 0x026E72C0, 0x40;
}

start
{
    return (current.story_state != old.story_state) && (current.story_state == 1277) && (current.level_code == 184);
}

split
{
    return (old.scene_counter != current.scene_counter) && (current.level_code != 184);
}

isLoading
{
    return (current.loading != 0);
}

reset
{
    return (current.level_code == 181);
}
