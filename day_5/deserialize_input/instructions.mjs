import Instruction from '../models/instruction.mjs'

export default (input) => {
  const matches = input.matchAll(/move (?<move>\d+) from (?<from>\d+) to (?<to>\d+)/g)
  const instructions = [...matches].map(({ groups }) =>
    new Instruction(
      {
        move: parseInt(groups.move),
        from: parseInt(groups.from),
        to: parseInt(groups.to)
      }
    )
  )

  return instructions
}
