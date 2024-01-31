function Key() {
  const resource = GetInvokingResource();
  if (resource != GetCurrentResourceName()) {
    emitNet("ed-kamera:cheatDetect");
    return false;
  }
  return Date.now();
}
exports("Key", Key);