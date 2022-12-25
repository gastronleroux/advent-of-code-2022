import GraphEdge from './graph_edge.mjs'

export default class GraphVertex {
  constructor({ id, height, graph }) {
    this.id = id
    this.height = height
    this.graph = graph
    this.edges = []
  }

  addEdge({ targetId, weight }) {
    this.edges.push(new GraphEdge({
      graph: this.graph,
      sourceId: this.id,
      targetId,
      weight,
    }))
  }

  forEachEdge(callback) {
    this.edges.forEach((edge) => callback(edge))
  }
}
