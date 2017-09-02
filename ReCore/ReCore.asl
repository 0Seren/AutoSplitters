state("ReCore") {
    bool loading: "ReCore.dll", 0x246E318;
}
isLoading {
    return current.loading;
}
