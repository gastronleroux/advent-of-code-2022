import deserializeStacks from './deserialize_input/stacks.mjs'
import deserializeInstructions from './deserialize_input/instructions.mjs'

export default (input) => {
  const stackInputEndIndex = input.indexOf('\n\n')
  const stacksInput = input.slice(0, stackInputEndIndex)
  const instructionsInput = input.slice(stackInputEndIndex).trim()

  const stacks = deserializeStacks(stacksInput)
  const instructions = deserializeInstructions(instructionsInput)

  return { stacks, instructions }
}
