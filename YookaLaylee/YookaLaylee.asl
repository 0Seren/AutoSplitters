state("YookaLaylee64"){
    bool loading : "mono.dll", 0x00268758, 0x90, 0xDA0, 0x66;
}

isLoading{
    return current.loading;
}
