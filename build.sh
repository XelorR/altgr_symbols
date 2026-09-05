#/usr/bin/bash

rm -rf dist
kalamine build us.toml
kalamine build ru.toml --out dist/ru-sym.xkb_keymap
kalamine build ru.toml --out dist/ru-sym.xkb_symbols
kalamine build ru.toml --qwerty-shortcuts --out dist/ru-sym.klc
