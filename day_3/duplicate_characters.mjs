export default (...strings) => {
  if (strings.length === 0) return []

  const arraysOfUniqueCharacters = strings.map((string) => [...new Set(string)])
  return arraysOfUniqueCharacters.slice(1).reduce(
    (characters, array) => characters.filter((character) => array.includes(character)),
    arraysOfUniqueCharacters[0]
  )
}
