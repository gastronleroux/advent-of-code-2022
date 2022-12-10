import inputDeserializer from './input_deserializer.mjs'
import CrateMover from './crate_mover.mjs'

export const part1 = (input) => {
  const { stacks, instructions } = inputDeserializer(input)
  const crateMover = new CrateMover({ stacks, instructions })
  crateMover.move()
  const topStackValues = stacks.map((stack) => stack.at(-1)).join('')

  return topStackValues
}
