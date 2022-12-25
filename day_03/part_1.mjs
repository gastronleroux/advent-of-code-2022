import { duplicatedCharacters } from './utils.mjs'
import { PRIOTITY_BY_CHARACTER } from './constants.mjs'

const prioritySum = (line) => {
  const middleCharacterIndex = Math.round(line.length / 2)
  const firstHalf = line.slice(0, middleCharacterIndex)
  const secondHalf = line.slice(middleCharacterIndex)
  const sameCharacters = duplicatedCharacters(firstHalf, secondHalf)
  
  return sameCharacters.reduce(
    (sum, character) => sum + PRIOTITY_BY_CHARACTER[character], 0
  )
}

export const part1 = (input) => {
  const lines = input.split('\n')

  return lines.reduce((sum, line) => sum + prioritySum(line), 0)
}
