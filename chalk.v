module chalk

import strconv

const (
    prefix = '\e['
    suffix = 'm'
    foreground_colors = {
        'black': 30
        'red': 31
        'green': 32
        'yellow': 33
        'blue': 34
        'magenta': 35
        'cyan': 36
        'default': 39
        'light_gray': 37
        'dark_gray': 90
        'light_red': 91
        'light_green': 92
        'light_yellow': 93
        'light_blue': 94
        'light_magenta': 95
        'light_cyan': 96
        'white': 97
    }
    background_colors = {
        'black': 40
        'red': 41
        'green': 42
        'yellow': 44
        'blue': 44
        'magenta': 45
        'cyan': 46
        'default': 49
        'light_gray': 47
        'dark_gray': 100
        'light_red': 101
        'light_green': 102
        'light_yellow': 103
        'light_blue': 104
        'light_magenta': 105
        'light_cyan': 106
        'white': 107
    }
    style = {
        'bold': 1
        'dim': 2
        'underline': 4
        'blink': 5
        'reverse': 7
        'hidden': 8
    }
	fg_rgb = 38
	bg_rgb = 48
    reset = '${prefix}0${suffix}'
)


pub fn fg(text string, color string) string {
    return '$prefix${foreground_colors[color]}$suffix$text$reset'
}

pub fn fg_rgb(text string, r int, g int, b int) string {
	return '$prefix$fg_rgb;2;$r;$g;${b}$suffix$text$reset'
}

pub fn fg_hex(text string, hex string) string {
	r := strconv.common_parse_int(hex[1..3], 16, 16, true, false) or { 0 }
    g := strconv.common_parse_int(hex[3..5], 16, 16, true, false) or { 0 }
    b := strconv.common_parse_int(hex[5..7], 16, 16, true, false) or { 0 }
    return fg_rgb(text, int(r), int(g), int(b))
}

pub fn bg(text string, color string) string {
    return '$prefix${background_colors[color]}$suffix$text$reset'
}

pub fn bg_rgb(text string, r int, g int, b int) string {
	return '$prefix$bg_rgb;2;$r;$g;${b}$suffix$text$reset'
}

pub fn bg_hex(text string, hex string) string {
	r := strconv.common_parse_int(hex[1..3], 16, 16, true, false) or { 0 }
    g := strconv.common_parse_int(hex[3..5], 16, 16, true, false) or { 0 }
    b := strconv.common_parse_int(hex[5..7], 16, 16, true, false) or { 0 }
    return bg_rgb(text, int(r), int(g), int(b))
}

pub fn style(text string, color string) string {
    return '$prefix${style[color]}$suffix$text$reset'
}
