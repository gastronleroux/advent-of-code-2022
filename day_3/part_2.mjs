import chunk from './chunk.mjs';
import duplicateCharacters from './duplicate_characters.mjs'
import { PRIOTITY_BY_CHARACTER } from "./constants.mjs"

export const part2 = (input) => {
  const lines = input.split('\n')
  const groupsOfThree = chunk(lines, 3)

  return groupsOfThree.reduce(
    (sum, [firstLine, secondLine, thirdLine]) => {
      const sameCharacters = duplicateCharacters(firstLine, secondLine, thirdLine)

      return sum + sameCharacters.reduce(
        (sum, character) => sum + PRIOTITY_BY_CHARACTER[character], 0
      )
    },
    0
  )
}
