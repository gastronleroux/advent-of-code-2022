import deserializeInstructions from './deserialize_instructions.mjs'
import runInstructions from './run_instructions.mjs'

export const part1 = (input) => {
  const instructions = deserializeInstructions(input)

  return runInstructions(instructions, 2)
}
