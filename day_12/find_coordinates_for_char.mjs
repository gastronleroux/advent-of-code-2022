
export default (input, char) => {
  const width = input.split('\n')[0].length
  const rawPosition = input.indexOf(char)
  const offset = Math.floor(rawPosition / (width + 1))
  const position = rawPosition - offset
  const x = position % width
  const y = Math.floor(position / width)

  return [x, y]
}
