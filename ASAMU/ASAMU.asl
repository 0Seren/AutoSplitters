state("ASAMU-Win32-Shipping")
{
    int loading : 0x27216EC;
    int scene_counter : 0x25CB14C;
    int level_code : 0x267B578;
}

start
{
    return (old.level_code != current.level_code) && (current.level_code == 184);
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
