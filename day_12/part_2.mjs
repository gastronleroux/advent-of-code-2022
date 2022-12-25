import findCoordinatesForChar from './find_coordinates_for_char.mjs'
import deserializeGraph from './deserialize_graph.mjs'
import findShortestPath from './find_shortest_path.mjs'

export const part2 = (input) => {
  const [xStart, yStart] = findCoordinatesForChar(input, 'E')
  const shouldVerticesHaveEdge =
    (sourceVertexHeight, targetVertexHeight) => targetVertexHeight + 1 >= sourceVertexHeight
  const graph = deserializeGraph(input, shouldVerticesHaveEdge)
  const startVertex = graph.findVertex(`${xStart},${yStart}`)
  const isEndVertex = (vertex) => vertex.height === 0
  
  return findShortestPath({ graph, startVertex, isEndVertex })
}
