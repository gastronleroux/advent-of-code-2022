import PriorityQueueItem from './priority_queue_item.mjs'

export default class PriorityQueue {
  constructor() {
    this.items = []
  }

  enqueue({ item, priority }) {
    this.items.push(new PriorityQueueItem({ item, priority }))
    this.sort()
  }

  dequeue() {
    return this.items.shift().item
  }

  isEmpty() {
    return this.items.length === 0
  }

  sort() {
    this.items.sort((a, b) => a.priority - b.priority)
  }
}
