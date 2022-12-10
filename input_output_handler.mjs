import fs from 'fs'

const STRATEGY_NAMES = ['part_1', 'part_2']

const strategyName = process.argv[2]

if (strategyName === undefined || !STRATEGY_NAMES.includes(strategyName)) {
  throw new Error(`Please provide a valid strategy name (available ones: ${STRATEGY_NAMES.join(', ')})`)
}

export default ({ filePath, part1, part2 }) => {
  const strategyByName = {
    part_1: part1,
    part_2: part2
  }

  fs.readFile(filePath, 'utf8', (err, input) => {
    if (err) {
      console.error(err)
      return
    }

    const strategyFunction = strategyByName[strategyName]

    console.log(strategyFunction(input))
  })
}
