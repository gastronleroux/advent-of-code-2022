import Graph from './models/graph.mjs'

const MIN_HEIGHT = 'a'.charCodeAt()
const MAX_HEIGHT = 'z'.charCodeAt()

export default (input, shouldVerticesHaveEdge) => {
  const graph = new Graph()

  const lines = input.trim().split('\n').map((line) => [...line].map((char) => {
    if (char === 'S') return MIN_HEIGHT
    if (char === 'E') return MAX_HEIGHT

    return char.charCodeAt()
  }))

  const height = lines.length
  const width = lines[0].length

  for (let y = 0; y < height; y++) {
    for (let x = 0; x < width; x++) {
      const id = `${x},${y}`
      const height = lines[y][x] - MIN_HEIGHT
      const vertex = graph.addVertex({ id, height })
      
      neighbors(lines, x, y, shouldVerticesHaveEdge).forEach(([x, y]) =>
        vertex.addEdge({ targetId: `${x},${y}`, weight: 1 })
      )
    }
  }

  return graph
}

const neighbors = (lines, x, y, shouldVerticesHaveEdge) => {
  const vertexHeight = lines.at(y).at(x)
  const potentialNeighbors = [
    [x, y - 1],
    [x, y + 1],
    [x - 1, y],
    [x + 1, y],
  ]

  const filteredNeighbors = potentialNeighbors.filter(([xNeighbor, yNeighbor]) => {
    if (xNeighbor < 0 || yNeighbor < 0) return false

    const neighborHeight = lines.at(yNeighbor)?.at(xNeighbor)
    return neighborHeight !== undefined && shouldVerticesHaveEdge(vertexHeight, neighborHeight)
  })

  return filteredNeighbors
}
