import deserializeCaveSystem from './deserialize_cave_system.mjs'

export const part1 = (input) => {
  const caveSystem = deserializeCaveSystem(input)
  caveSystem.dropSandUnits()

  return caveSystem.countSandUnits()
}
