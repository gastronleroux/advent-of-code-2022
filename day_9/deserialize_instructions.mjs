export default (input) => 
  input.trim().split('\n').map((line) => {
    const [direction, distance] = line.split(' ')
  
    return { direction, distance: Number(distance) }
  })
