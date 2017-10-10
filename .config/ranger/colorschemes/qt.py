# Copyright (C) 2009-2013  Roman Zimbelmann <hut@lavabit.com>
# This software is distributed under the terms of the GNU GPL version 3.

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import *

class Default(ColorScheme):
    progress_bar_color = yellow

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                bg = red
                attr = bold
                fg = blue
            else:
                attr = normal
                if context.empty or context.error:
                    bg = red
                if context.border:
                    fg = defaut
                if context.media:
                    if context.image:
                        fg = white
                        attr |= bold
                    else:
                        attr |= bold
                        fg = red
                if context.container:
                    fg = yellow
                if context.directory:
                    fg = red
                elif context.executable and not \
                        any((context.media, context.container,
                            context.fifo, context.socket)):
                    attr |= bold
                    fg = red
                if context.socket:
                    fg = magenta
                    attr |= bold
                if context.fifo or context.device:
                    fg = red
                    if context.device:
                        attr |= bold
                if context.link:
                    fg = context.good and magenta or magenta
                if context.tag_marker and not context.selected:
                    attr |= bold
                    if fg in (red, magenta):
                        fg = white
                    else:
                        fg = red
                if not context.selected and (context.cut or context.copied):
                    fg = black
                    attr |= bold
                if context.main_column:
                    if context.selected:
                        attr |= bold
                    if context.marked:
                        attr |= bold
                        fg = yellow
                if context.badinfo:
                    if attr & reverse:
                        bg = magenta
                    else:
                        fg = magenta

        elif context.in_titlebar:
            attr |= bold
            if context.hostname:
                fg = blue
                bg = red
            else:
                fg = white
                bg = red

        elif context.in_statusbar:
            if context.permissions:
                bg = red
                fg = blue
                attr |= bold
            elif context.marked:
                bg = red
                fg = blue
                attr |= bold
            elif context.marked:
                attr |= bold | reverse
            elif context.message:
                if context.bad:
                    attr |= bold
                    fg = red
            elif context.loaded:
                bg = self.progress_bar_color
            elif context.vcsinfo:
                fg = blue
                attr &= ~bold
            elif context.vcscommit:
                fg = yellow
                attr &= ~bold
            else:
                fg = white
                bg = red
                attr |= bold


        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = blue

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color


        if context.vcsfile and not context.selected:
            attr &= ~bold
            if context.vcsconflict:
                fg = magenta
            elif context.vcschanged:
                fg = red
            elif context.vcsunknown:
                fg = red
            elif context.vcsstaged:
                fg = green
            elif context.vcssync:
                fg = green
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            attr &= ~bold
            if context.vcssync:
                fg = green
            elif context.vcsbehind:
                fg = red
            elif context.vcsahead:
                fg = blue
            elif context.vcsdiverged:
                fg = magenta
            elif context.vcsunknown:
                fg = red

        return fg, bg, attr
