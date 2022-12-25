import PriorityQueue from './models/priority_queue.mjs'

// Dijsktra's algorithm for shortest path length in a graph
// @returns {number} the shortest path length
export default ({ graph, startVertex, isEndVertex }) => {
  const distances = {}
  const queue = new PriorityQueue()

  graph.forEachVertex((item) => queue.enqueue({ item, priority: distances[item.id] = Infinity }))
  distances[startVertex.id] = 0

  while (!queue.isEmpty()) {
    const vertex = queue.dequeue()
    if (isEndVertex(vertex) && distances[vertex.id] !== Infinity) return distances[vertex.id]

    vertex.forEachEdge((edge) => {
      const distance = distances[vertex.id] + edge.weight
      if (distance >= distances[edge.targetId]) return

      distances[edge.targetId] = distance
      queue.enqueue({ item: edge.target, priority: distance })
    })
  }

  return Infinity
}
