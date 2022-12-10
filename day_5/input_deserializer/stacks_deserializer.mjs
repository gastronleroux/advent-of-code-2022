export default (input) => {
  const lines = input.split('\n')
  const indicesLine = lines.at(-1)
  const indices = indicesLine.trim().split(/\s+/)
  const valueLines = lines.slice(0, -1)

  const stacks = indices.reduce(
    (array, index) => {
      array[parseInt(index)] = valueLines
        .map((chars) => chars[indicesLine.indexOf(index)])
        .filter((value) => value !== ' ')
        .reverse()

      return array
    },
    []
  )

  return stacks
}
