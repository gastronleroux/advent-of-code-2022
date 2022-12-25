export default (array, chunkSize) =>
  array.reduce(
    (groups, element, index) => {
      const groupIndex = Math.floor(index / chunkSize)
      groups[groupIndex] = groups[groupIndex] || []
      groups[groupIndex].push(element)

      return groups
    },
    []
  )
