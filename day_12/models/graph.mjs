import GraphVertex from './graph_vertex.mjs'

export default class Graph {
  constructor() {
    this.vertices = {}
  }

  addVertex({ id, height }) {
    return this.vertices[id] = new GraphVertex({ id, height, graph: this })
  }

  findVertex(id) {
    return this.vertices[id]
  }

  forEachVertex(callback) {
    Object.values(this.vertices).forEach(callback)
  }
}
