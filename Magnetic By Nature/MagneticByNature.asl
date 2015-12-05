state("MagneticByNature")
{
  string50 level_name : "MagneticByNature.exe", 0x00A29EA4, 0x1300, 0x3C8, 0x0;
  int is_loading : "MagneticByNature.exe", 0x000BABE8, 0x0;
}

start
{
  return (old.level_name != current.level_name) && (current.level_name.Contains(vars.first_level)) && (old.level_name.Contains(vars.hub3));
}

split
{
  bool in_hub = false;
  string level = current.level_name;
  if(level.Contains(vars.hub1) || level.Contains(vars.hub2) || level.Contains(vars.hub3) || level.Contains(vars.hub4) || level.Contains(vars.hub5) || level.Contains(vars.hub6) || level.Contains(vars.hub7))
  {
    in_hub = true;
  }

  bool ret = false;
  if((old.level_name != current.level_name) && !in_hub){
    if(!old.level_name.Contains(vars.W4_last_level)){
      ret = true;
    }
    vars.inLoad = false;
  }

  if(((current.level_name.Contains(vars.W4_last_level) && !vars.split_on_W4_already) || current.level_name.Contains(vars.W5_last_level)) && vars.inLoad){
    ret = true;
    vars.split_on_W4_already = true;
  }

  return ret;
}

reset
{
  bool in_hub = false;
  string level = current.level_name;
  if(level.Contains(vars.hub1) || level.Contains(vars.hub2) || level.Contains(vars.hub3) || level.Contains(vars.hub4) || level.Contains(vars.hub5) || level.Contains(vars.hub6) || level.Contains(vars.hub7))
  {
    in_hub = true;
    vars.split_on_W4_already = false;
    vars.inLoad = false;
  }


  return in_hub;
}

init
{
  vars.hub1 = "Rhapsody in Blues";
  vars.hub2 = "Fane of Dataloss";
  vars.hub3 = "Shrine of the Speedrunner";
  vars.hub4 = "red, red romance";
  vars.hub5 = "Modern Times";
  vars.hub6 = "Lost Generation";
  vars.hub7 = "Stone Soldiers";
  vars.first_level = "Commencement";
  vars.W4_last_level = "Like A Feather";
  vars.W5_last_level = "???";
  vars.split_on_W4_already = false;
  vars.inLoad = false;
}

isLoading
{
  if(current.is_loading == 0){
    vars.inLoad = true;
  }
  return vars.inLoad;
}
