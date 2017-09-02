state("ReCore") {
    bool loading: "ReCore.dll", 0x246E318, 0xF8;
}
isLoading {
    return current.loading;
}
