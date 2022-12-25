const changePositionByDirection = (position, direction) => {
  switch (direction) {
    case 'R':
      position.x += 1
      break
    case 'L':
      position.x -= 1
      break
    case 'U':
      position.y -= 1
      break
    case 'D':
      position.y += 1
      break
  }
}

const changePositionByBounds = (position, otherPosition) => {
  const xDistance = Math.abs(position.x - otherPosition.x)
  const yDistance = Math.abs(position.y - otherPosition.y)

  if (xDistance > yDistance) {
    position.y = otherPosition.y
    position.x = otherPosition.x + (position.x > otherPosition.x ? 1 : -1)
    return
  }

  if (xDistance < yDistance) {
    position.x = otherPosition.x
    position.y = otherPosition.y + (position.y > otherPosition.y ? 1 : -1)
    return
  }

  position.x = otherPosition.x + (position.x > otherPosition.x ? 1 : -1)
  position.y = otherPosition.y + (position.y > otherPosition.y ? 1 : -1)
}

const isPositionWithinBounds = (position, otherPosition) =>
  position.x >= otherPosition.x - 1 &&
  position.x <= otherPosition.x + 1 &&
  position.y >= otherPosition.y - 1 &&
  position.y <= otherPosition.y + 1

export default (instructions, knotsCount) => {
  const knotPositions = Array.from({length: knotsCount}, () => ({x: 0, y: 0}))
  const lastKnotPosition = knotPositions[knotsCount - 1]
  const visitedPositions = new Set(['0,0'])

  instructions.forEach(({ direction, distance }) => {
    for (let distanceIndex = 0; distanceIndex < distance; distanceIndex++) {
      changePositionByDirection(knotPositions[0], direction)

      for (let knotIndex = 1; knotIndex < knotsCount; knotIndex++) {
        if (isPositionWithinBounds(knotPositions[knotIndex], knotPositions[knotIndex - 1])) break
        changePositionByBounds(knotPositions[knotIndex], knotPositions[knotIndex - 1])
      }

      visitedPositions.add(`${lastKnotPosition.x},${lastKnotPosition.y}`)
    }
  })

  return visitedPositions.size
}
