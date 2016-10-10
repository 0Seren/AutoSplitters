state("Valley") {
    bool loading: "mono.dll", 0x261110, 0x538, 0x70;
}
isLoading {
    return current.loading;
}
