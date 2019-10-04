# Chalk

A terminal string colorizer for the [V language](https://vlang.io).


## Installation

With vpm:
```
v install etienne-napoleone.chalk
```

## Usage

```js
import chalk

// basic usage
println('I am really ' + chalk.draw('happy').fg('green').str())

// you can also chain them
println('I am really ' + chalk.draw('ANGRY').style('bold').fg('red').str())
```

Available colors:
- black
- red
- green
- yellow
- blue
- magenta
- cyan
- default
- light_gray
- dark_gray
- light_red
- light_green
- light_yellow
- light_blue
- light_magenta
- light_cyan
- white

Available styles:
- bold
- dim
- underline
- blink
- reverse
- hidden
