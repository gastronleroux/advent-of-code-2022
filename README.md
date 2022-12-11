# advent-of-code-2022
Depending on the language, tasks can be run differently. Each day has 2 parts.

### Ruby
Ruby version: 3.1.2
```
ruby day-x/part-y.rb
```

### JavaScript
Node version: 16.18.0
```
node day-x/output.mjs part-y
```

### Accomplished tasks:

- [x] Day 1: Calorie Counting <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 2: Rock Paper Scissors <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 3: Rucksack Reorganization <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1280px-Unofficial_JavaScript_logo_2.svg.png" />
- [x] Day 4: Camp Cleanup <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/1280px-Ruby_logo.svg.png" />
- [x] Day 5: Supply Stacks <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1280px-Unofficial_JavaScript_logo_2.svg.png" />
- [x] Day 6: Tuning Trouble <img width="12" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/1280px-Unofficial_JavaScript_logo_2.svg.png" />

### Benchmarking

Some of the tasks were solved with optimization aspect as the main challenge:

#### Day 6: Tuning Trouble

How it was measured:
```js
console.time('measure')

for(let i = 1; i < input.length / 10; i++) {
  strategyFunction(input, i)
}

console.timeEnd('measure')
```

Results:
- [tranzystorek](https://tranzystorek-io.github.io/paste/#XQAAAQDoAgAAAAAAAAA9iImGVD/UQZfk+oJTfwg2/VsJ0DpNkr2zGUvTQlsh3wS86ErCiIs+8hruVNIFt25kOOZrzOGZxbRwHmJ5wrAVdOuA2kk0mNS0CwkIEqOmO95EhbRoIUTonrtGzVALDhyFMRO24/2oA0Lt4k+Q2E/wp4YaHUgbXZtC5amaE5MmewTUwYV3d2c08XNXkJSlcNdZoC0u7tg9N2VgcIFHggYSp7TN10PME5iIet4qPjdHG5HA66NDrnEgnqTFOIzUjh05giNUXJou2/3envFI4NRaNH/L6U8Rv0ryUie3e8pJ2fum2zkLo0K3AZp7WQOWfQCzQ2pfIEt/H3Qnc3kXNbs7JvvWEZvDDTF09ZDAQ6isrilrYEuGTUrHZPEbiqKtwXydfINN0nbGuAeTf66blK1tmiubYP1Gy3idFqF41PvEZ5t1ss6E1lEEATrHTikES8Ru8szcG/bcq9JHIQQ8BlR11gHqrNsLYBpKHdcEjlOctSlvAptTPXRsYVqe808NpND6smneb6j5+9N+mL4PpRHppV5SVZnc9sZhp+oNOTUDYswoAPjY/6N6HQ0=) sets approach - 6.791s
- [shmemcat](https://github.com/shmemcat/advent-of-code-2022/blob/main/06/index.js) regex approach - 0.333s
- my custom algorithm approach - 0.051s
