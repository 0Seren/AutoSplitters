state("ReCore") {
    bool loading: "UnityPlayer.dll", 0x12D0C08;
}
isLoading {
    return current.loading;
}