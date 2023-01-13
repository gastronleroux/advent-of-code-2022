import deserializeCaveSystem from './deserialize_cave_system.mjs'

export const part2 = (input) => {
  const caveSystem = deserializeCaveSystem(input).withFloor()
  caveSystem.dropSandUnits()

  return caveSystem.countSandUnits()
}
