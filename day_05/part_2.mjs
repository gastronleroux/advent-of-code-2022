import deserializeInput from './deserialize_input.mjs'
import CrateMover from './crate_mover.mjs'

export const part2 = (input) => {
  const { stacks, instructions } = deserializeInput(input)
  const crateMover = new CrateMover({ stacks, instructions }, 9001)
  crateMover.move()
  const topStackValues = stacks.map((stack) => stack.at(-1)).join('')

  return topStackValues
}
