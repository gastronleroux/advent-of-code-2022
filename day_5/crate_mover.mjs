export default class CrateMover {
  #VERSIONS = [9000, 9001]
  #DEFAULT_VERSION = 9000

  constructor ({ stacks, instructions }, version = this.#DEFAULT_VERSION) {
    if (!this.#VERSIONS.includes(version)) {
      throw new Error(`Invalid ${version} crate mover version (available ones: ${this.#VERSIONS.join(', ')})`)
    }
  
    this.stacks = stacks
    this.instructions = instructions
    this.version = version
  }  

  move() {
    return this.instructions.reduce(this.#MOVING_STRATEGY_BY_VERSION[this.version], this.stacks)
  }

  #moveOneByOneStrategy(stacks, { move, from, to }) {
    const movedValues = [...Array(move).keys()].map((_) => stacks[from].pop())
    stacks[to].push(...movedValues)
  
    return stacks
  }
  
  #moveAllAtOnceStrategy(stacks, { move, from, to }) {
    stacks[to].push(...stacks[from].splice(-move, move))
  
    return stacks
  }

  #MOVING_STRATEGY_BY_VERSION = {
    9000: this.#moveOneByOneStrategy,
    9001: this.#moveAllAtOnceStrategy
  }
}
