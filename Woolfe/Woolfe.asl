state("WoolfeGame")
{
  bool start_load : "WoolfeGame.exe", 0x188ABE8;
  bool end_load : "WoolfeGame.exe", 0x01739510, 0x170, 0x100, 0x2F0, 0x5B0, 0x398;
  int igt : "WoolfeGame.exe", 0x0189ADB8, 0x18, 0x2B0;
  int values : "WoolfeGame.exe", 0x0177F870, 0x40, 0xB8;
}

init
{
  vars.in_load = true;
  vars.first_cutscene_value = 34960;
  vars.in_menu_value = 35010;
}

start
{
  /*bool ret = false;
  if(current.values != old.values && current.values == vars.first_cutscene_value){
    vars.in_load = true;
    ret = true;
  }
  return ret;*/
}

reset
{
  /*return (current.values != old.values && current.values == vars.in_menu_value);*/
}

split
{
  /*return (old.igt == 0 && current.igt != old.igt);*/
}

isLoading
{
  if(old.start_load != current.start_load && current.start_load){
    vars.in_load = true;
  }
  if(old.end_load != current.end_load && current.end_load){
    vars.in_load = false;
  }
  return vars.in_load;
}

update
{
}
