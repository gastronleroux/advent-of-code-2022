const PRIOTITY_BY_CHARACTER = Object.fromEntries(
  'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    .split('')
    .map((character, index) => [character, index + 1])
)

export {
  PRIOTITY_BY_CHARACTER
}
