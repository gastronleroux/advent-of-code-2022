import CaveSystem from './cave_system.mjs'

export default (input) => {
  const caveSystem = new CaveSystem()
  input.split('\n').forEach((line) =>
    fillCaveSystemWithRocksForCoordinatesStrings(caveSystem, line.split(' -> '))
  )

  return caveSystem
}

const fillCaveSystemWithRocksForCoordinatesStrings = (caveSystem, coordinatesStrings) => {
  for (let index = 1; index < coordinatesStrings.length; index++) {
    const currentCoordinatesString = coordinatesStrings[index]
    const previousCoordinatesString = coordinatesStrings[index - 1]
    const currentCoordinates = CaveSystem.convertIndexToCoordinates(currentCoordinatesString)
    const previousCoordinates = CaveSystem.convertIndexToCoordinates(previousCoordinatesString)

    fillCaveSystemWithRocksBetweenCoordinates(
      caveSystem, currentCoordinates, previousCoordinates
    )
  }
}

const fillCaveSystemWithRocksBetweenCoordinates =
  (caveSystem, currentCoordinates, previousCoordinates) => {
    const axis = currentCoordinates.x === previousCoordinates.x ? 'y' : 'x'
    const [minIndex, maxIndex] = [currentCoordinates[axis], previousCoordinates[axis]].sort()
    const indicesCount = maxIndex - minIndex + 1
    const indices = Array.from({ length: indicesCount }, (_, index) => index + minIndex)

    indices.forEach((index) => {
      const coordinate = { ...currentCoordinates, [axis]: index }

      caveSystem.addRock(coordinate)
    })
  }
