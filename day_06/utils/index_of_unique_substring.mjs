/**
 * @example
 * const string = "abac"
 * const substringLength = 3
 * 
 * const index = indexOfUniqueSubstring(string, substringLength) 
 * // index is set to 1. First substring with unique chars of length 3
 * // is "bac" which starts at index 1
 * 
 * @param {string} string
 * @param {number} substringLength
 * 
 * @returns {number} index of first substring within {string} of
 *                   {substringLength} length with unique characters.
 */
export default (string, substringLength) => {
  // Index used to loop trough chars in string
  let index = 0

  // Indicates the number of chars left to skip to have a chance to find a unique substring.
  let offset = 0

  // Index used to compare previous chars with the current one in main loop.
  let previousIndex

  // previousIndex loops trough chars downwards from index to maxIndexForUniqueSubstring.
  let maxIndexForUniqueSubstring

  // Flag determining if substring is neither too short nor with repetitions.
  let isSubstringValid

  // In each loop we mainly check if char under given index has no earlier repetitions.
  for (; index < string.length; index++) {
    if (offset > 0) offset--

    isSubstringValid = offset === 0
    previousIndex = index - 1

    // We don't want to overwrite offset with a smaller value than is set already.
    // To omit this situation, we loop previousIndex only for chars which offset
    // would be greater than current one.
    maxIndexForUniqueSubstring = index - substringLength + offset

    for (; previousIndex > maxIndexForUniqueSubstring; previousIndex--) {
      // If character is undefined, substring is too short, no need to check
      // chars for smaller index as those will also be undefined, break the loop.
      if (string[previousIndex] === undefined) {
        isSubstringValid = false
        break
      }

      // If chars are same, set new offset to a number of chars needed to skip
      // to no longer include char under previousIndex in potential substring.
      // Any following char would have a smaller offset, break the loop.
      if (string[index] === string[previousIndex]) {
        isSubstringValid = false
        offset = substringLength - index + previousIndex
        break
      }
    }

    if (isSubstringValid) return index - substringLength
  }

  // Index not found.
  return -1
}
