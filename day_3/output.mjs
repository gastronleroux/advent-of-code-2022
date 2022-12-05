import fs from 'fs'
import { part1, part2 } from './parts.mjs'

const STRATEGY_BY_NAME = {
  part_1: part1,
  part_2: part2
}
const STRATEGY_NAMES = Object.keys(STRATEGY_BY_NAME)

const strategyName = process.argv[2]

if (strategyName === undefined || !STRATEGY_NAMES.includes(strategyName)) {
  throw new Error(`Please provide a valid strategy name (available ones: ${STRATEGY_NAMES.join(', ')})`)
}

fs.readFile('day_3/input', 'utf8', (err, input) => {
  if (err) {
    console.error(err)
    return
  }

  const strategyFunction = STRATEGY_BY_NAME[strategyName]
  const trimmedInput = input.trim()

  console.log(strategyFunction(trimmedInput))
})
