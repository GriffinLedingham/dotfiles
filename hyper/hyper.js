// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  config: {
    // Choose either "stable" for receiving highly polished,
    // or "canary" for less polished but more frequent updates
    updateChannel: 'stable',

    // default font size in pixels for all tabs
    fontSize: 14,

    // font family with optional fallbacks
    fontFamily: 'Monaco, Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: 'rgba(188,200,186)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BLOCK',

    // set to true for blinking cursor
    cursorBlink: false,

    // color of the text
    foregroundColor: 'rgb(188,200,186)',

    // terminal background color
    backgroundColor: 'rgba(45,45,45,1)',

    // border color (window, tabs)
    borderColor: '#333',

    // custom css to embed in the main window
    css: '/*.header_header {display:none;}*/ .term_term {margin-top:0px;}.tabs_borderShim{border:0;} .tabs_title,.tab_textActive{    box-sizing: border-box;color: rgb(91, 212, 237);border-bottom-width: 0px;border-top: 2px solid rgb(91, 212, 237) !important;}.tab_textActive .tab_textInner{top:-2px !important;}.tab_tab{background:rgba(48, 51, 53,0);opacity:0.5;}.tabs_nav{background: rgba(0,0,0,0);}.tab_active,.tabs_title{background:rgba(39, 40, 34,0);opacity:1;}',

    // custom css to embed in the terminal window
    termCSS: '',

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '12px 14px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    colors: {
      black: '#000000',
      red: 'rgb(248,37,103)',
      green: 'rgb(156,222,41)',
      yellow: 'rgb(230,219,116)',
      blue: 'rgb(91,212,237)',
      magenta: 'rgb(163,118,255)',
      cyan: 'rgb(91,212,237)',
      white: 'rgba(188,200,186)',
      lightBlack: '#808080',
      lightRed: 'rgb(248,37,103)',
      lightGreen: 'rgb(156,222,41)',
      lightYellow: 'rgb(230,219,116)',
      lightBlue: 'rgb(91,212,237)',
      lightMagenta: 'rgb(163,118,255)',
      lightCyan: 'rgb(91,212,237)',
      lightWhite: 'rgba(188,200,186)'
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // Powershell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: 'SOUND',

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: ["hyper-tab-icons"],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {
    // Example
    // 'window:devtools': 'cmd+alt+o',
  }
};
