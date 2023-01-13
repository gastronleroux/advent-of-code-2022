# [advent-of-code-2022](https://adventofcode.com/2022)
Depending on the language, tasks can be run differently. Each day has 2 parts.

### Ruby
Ruby version: 3.1.2
```
ruby day_x/part_y.rb
```

### JavaScript
Node version: 16.18.0
```
node day_x/output.mjs part_y
```

### Accomplished tasks:

- [x] Day 1: Calorie Counting <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 2: Rock Paper Scissors <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 3: Rucksack Reorganization <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1280px-Unofficial_JavaScript_logo_2.svg.png" />
- [x] Day 4: Camp Cleanup <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 5: Supply Stacks <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1280px-Unofficial_JavaScript_logo_2.svg.png" />
- [x] Day 6: Tuning Trouble <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1280px-Unofficial_JavaScript_logo_2.svg.png" />
- [x] Day 7: No Space Left On Device <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 8: Treetop Tree House <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 9: Rope Bridge <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1280px-Unofficial_JavaScript_logo_2.svg.png" />
- [x] Day 10: Cathode-Ray Tube <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 11: Monkey in the Middle <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 12: Hill Climbing Algorithm <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1280px-Unofficial_JavaScript_logo_2.svg.png" />
- [x] Day 13: Distress Signal <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 14: Regolith Reservoir <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1280px-Unofficial_JavaScript_logo_2.svg.png" />

### Benchmarking

Some of the tasks were solved with optimization aspect as the main challenge:

#### Day 6: Tuning Trouble

How it was measured:
```js
console.time('measure')

for (let substringLength = 1; substringLength < input.length / 10; substringLength++) {
  strategyFunction(input, substringLength)
}

console.timeEnd('measure')
```

Results:
- [tranzystorek](https://tranzystorek-io.github.io/paste/#XQAAAQDoAgAAAAAAAAA9iImGVD/UQZfk+oJTfwg2/VsJ0DpNkr2zGUvTQlsh3wS86ErCiIs+8hruVNIFt25kOOZrzOGZxbRwHmJ5wrAVdOuA2kk0mNS0CwkIEqOmO95EhbRoIUTonrtGzVALDhyFMRO24/2oA0Lt4k+Q2E/wp4YaHUgbXZtC5amaE5MmewTUwYV3d2c08XNXkJSlcNdZoC0u7tg9N2VgcIFHggYSp7TN10PME5iIet4qPjdHG5HA66NDrnEgnqTFOIzUjh05giNUXJou2/3envFI4NRaNH/L6U8Rv0ryUie3e8pJ2fum2zkLo0K3AZp7WQOWfQCzQ2pfIEt/H3Qnc3kXNbs7JvvWEZvDDTF09ZDAQ6isrilrYEuGTUrHZPEbiqKtwXydfINN0nbGuAeTf66blK1tmiubYP1Gy3idFqF41PvEZ5t1ss6E1lEEATrHTikES8Ru8szcG/bcq9JHIQQ8BlR11gHqrNsLYBpKHdcEjlOctSlvAptTPXRsYVqe808NpND6smneb6j5+9N+mL4PpRHppV5SVZnc9sZhp+oNOTUDYswoAPjY/6N6HQ0=) sets approach - 6.791s
- [shmemcat](https://github.com/shmemcat/advent-of-code-2022/blob/main/06/index.js) regex approach - 0.333s
- my custom algorithm approach - 0.051s


#### Day 9: Rope Bridge

How it was measured:
```js
console.time('measure')

for (let knotsCount = 2; knotsCount < 100; knotsCount++) {
  strategyFunction(input, knotsCount)
}

console.timeEnd('measure')
```

Results:
- [zsoltime](https://github.com/zsoltime/advent-of-code/blob/main/day-09/index.js) solution - 267.068ms
- [shahata](https://github.com/shahata/adventofcode-solver/blob/master/src/2022/day09.js) solution - 222.089ms
- [NadiaMit](https://github.com/NadiaMit/AdventOfCode2022/blob/master/days/day9.js) solution - 169.763ms
- My solution - 162.18ms
