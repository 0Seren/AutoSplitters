state("ASAMU-Win32-Shipping")
{
    int loading : 0x27216EC;
    int scene_counter : 0x25CB14C;
    int area_code : 0x267B578;
    int story_state : 0x026E72C0, 0x40;




    /*Known Area Codes:
     *      181  -> Menu
     *      184  -> House
     *
     *Known Story States:
     *      1277 -> gain control in Workshop
     *      1030 -> Epilogue Start Cutscene
     *      1032 -> Last Cutscene in Epilogue Begins
     */
}

start
{
    return (current.story_state != old.story_state) && (current.story_state == 1277) && (current.area_code == 184); //Starts upon gaining control
}

split
{
    return ((old.scene_counter != current.scene_counter) && (current.area_code != 184))                            //Splits after Workshop, Sanctuary, Village, Chasms, and Star Haven
    || ((current.story_state != old.story_state) && (current.story_state == 1030) && (current.area_code == 184))   //Splits After Credits
    || ((current.story_state != old.story_state) && (current.story_state == 1032) && (current.area_code == 184));  //Final Split
}

isLoading
{
    return (current.loading != 0);
}

reset
{
    return (current.area_code == 181); //181 is the menu
}
