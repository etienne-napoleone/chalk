module chalk

const (
    Prefix = '\e['
    Suffix = 'm'
    Reset = '0'
)

struct Draw {
mut:
    prefix string
    suffix string
    text string
}

fn escape(code string) string {
    return '$Prefix$code$Suffix'
}

pub fn draw(text string) Draw {
    return Draw {
        prefix: ""
        suffix: ""
        text: text
    }
}

pub fn (d Draw) fg(color string) Draw {
    return Draw {
        prefix: d.prefix + escape(Foreground_colors[color])
        suffix: escape(Reset)
        text: d.text
    }
}

pub fn (d Draw) bg(color string) Draw {
    return Draw {
        prefix: d.prefix + escape(Background_colors[color])
        suffix: escape(Reset)
        text: d.text
    }
}

pub fn (d Draw) style(style string) Draw {
    return Draw {
        prefix: d.prefix + escape(Styles[style])
        suffix: escape(Reset)
        text: d.text
    }
}

pub fn (d Draw) str() string {
    return '$d.prefix$d.text$d.suffix'
}
