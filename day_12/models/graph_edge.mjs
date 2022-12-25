export default class GraphEdge {
  constructor({ sourceId, targetId, weight, graph }) {
    this.sourceId = sourceId
    this.targetId = targetId
    this.weight = weight
    this.graph = graph
  }

  get source() {
    return this.graph.findVertex(this.sourceId)
  }

  get target() {
    return this.graph.findVertex(this.targetId)
  }
}
