import findCoordinatesForChar from './find_coordinates_for_char.mjs'
import deserializeGraph from './deserialize_graph.mjs'
import findShortestPath from './find_shortest_path.mjs'

export const part1 = (input) => {
  const [xStart, yStart] = findCoordinatesForChar(input, 'S')
  const [xEnd, yEnd] = findCoordinatesForChar(input, 'E')
  const shouldVerticesHaveEdge =
    (sourceVertexHeight, targetVertexHeight) => sourceVertexHeight + 1 >= targetVertexHeight
  const graph = deserializeGraph(input, shouldVerticesHaveEdge)
  const startVertex = graph.findVertex(`${xStart},${yStart}`)
  const isEndVertex = (vertex) => vertex.id === `${xEnd},${yEnd}`
  
  return findShortestPath({ graph, startVertex, isEndVertex })
}
