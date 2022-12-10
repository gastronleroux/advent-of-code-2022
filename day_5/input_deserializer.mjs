import stacksDeserializer from './input_deserializer/stacks_deserializer.mjs'
import instructionsDeserializer from './input_deserializer/instructions_deserializer.mjs'

export default (input) => {
  const stackInputEndIndex = input.indexOf('\n\n')
  const stacksInput = input.slice(0, stackInputEndIndex)
  const instructionsInput = input.slice(stackInputEndIndex).trim()

  const stacks = stacksDeserializer(stacksInput)
  const instructions = instructionsDeserializer(instructionsInput)

  return { stacks, instructions }
}
