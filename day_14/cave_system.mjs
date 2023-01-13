import { AIR_SYMBOL, ROCK_SYMBOL, SAND_SYMBOL, SAND_DROP_COORDINATES } from './constants.mjs'

export default class CaveSystem {
  constructor() {
    this.map = {}
    this.floorCoordinates = null
  }

  static convertIndexToCoordinates(index) {
    const [x, y] = index.split(',').map(Number)

    return { x, y }
  }

  withFloor() {
    const maxRockCoordinates = this.maxRockCoordinates()
    this.floorCoordinates = { x: 0, y: maxRockCoordinates.y + 1 }

    return this
  }

  getOrSetSymbol(coordinate) {
    const index = `${coordinate.x},${coordinate.y}`
    if (this.map[index] === undefined) this.map[index] = AIR_SYMBOL

    return this.map[index]
  }

  addRock(coordinate) {
    this.addUnit({ coordinate, symbol: ROCK_SYMBOL })
  }

  addSand(coordinate) {
    this.addUnit({ coordinate, symbol: SAND_SYMBOL })
  }

  addUnit({ coordinate, symbol }) {
    this.map[`${coordinate.x},${coordinate.y}`] = symbol
  }

  dropSandUnits() {
    if (this.hasFloor) {
      this.dropSandUnitsWithFloor()
    } else {
      while (this.dropSandUnitWithoutFloor()) {}
    }
  }

  dropSandUnitsWithFloor() {
    this.addSand(SAND_DROP_COORDINATES)

    let xMin = SAND_DROP_COORDINATES.x - 1
    let xMax = SAND_DROP_COORDINATES.x + 1
    const currentCoordinates = { x: xMin, y: SAND_DROP_COORDINATES.y }

    for (; currentCoordinates.y <= this.floorCoordinates.y; currentCoordinates.y += 1, currentCoordinates.x = xMin -= 1, xMax += 1) {
      for (; currentCoordinates.x <= xMax; currentCoordinates.x += 1) {
        const currentSymbol = this.getOrSetSymbol(currentCoordinates)
        const leftUpperSymbol = this.getOrSetSymbol({ x: currentCoordinates.x - 1, y: currentCoordinates.y - 1 })
        const upperMiddleSymbol = this.getOrSetSymbol({ x: currentCoordinates.x, y: currentCoordinates.y - 1 })
        const rightUpperSymbol = this.getOrSetSymbol({ x: currentCoordinates.x + 1, y: currentCoordinates.y - 1 })

        const anySandUpperSymbol = [leftUpperSymbol, upperMiddleSymbol, rightUpperSymbol].includes(SAND_SYMBOL)
        if (anySandUpperSymbol && currentSymbol === AIR_SYMBOL) this.addSand(currentCoordinates)
      }
    }
  }

  dropSandUnitWithoutFloor() {
    const currentCoordinates = { x: SAND_DROP_COORDINATES.x, y: SAND_DROP_COORDINATES.y - 1 }
    const maxRockCoordinates = this.maxRockCoordinates()

    for (; currentCoordinates.y <= maxRockCoordinates.y; currentCoordinates.y += 1) {
      const currentSymbol = this.getOrSetSymbol(currentCoordinates)
      if (currentSymbol === AIR_SYMBOL) continue

      const leftSymbol = this.getOrSetSymbol({ x: currentCoordinates.x - 1, y: currentCoordinates.y })
      const rightSymbol = this.getOrSetSymbol({ x: currentCoordinates.x + 1, y: currentCoordinates.y })
      if (leftSymbol !== AIR_SYMBOL && rightSymbol !== AIR_SYMBOL) {
        this.map[`${currentCoordinates.x},${currentCoordinates.y - 1}`] = SAND_SYMBOL
        return true
      }

      if (leftSymbol === AIR_SYMBOL) currentCoordinates.x -= 1
      else if (rightSymbol === AIR_SYMBOL) currentCoordinates.x += 1
    }

    return false
  }

  maxRockCoordinates() {
    return Object.keys(this.map)
      .filter((index) => this.map[index] === ROCK_SYMBOL)
      .map((index) => CaveSystem.convertIndexToCoordinates(index))
      .sort((a, b) => b.y - a.y)[0]
  }

  countSandUnits() {
    return Object.values(this.map).filter((symbol) => symbol === SAND_SYMBOL).length
  }

  get hasFloor() {
    return this.floorCoordinates !== null
  }
}
