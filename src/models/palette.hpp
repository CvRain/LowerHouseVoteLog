//
// Created by cvrain on 25-5-12.
//

#ifndef PALETTE_HPP
#define PALETTE_HPP

#include <QObject>
#include <QColor>

using Palette = struct {
    QColor rosewater;
    QColor flamingo;
    QColor pink;
    QColor mauve;
    QColor red;
    QColor maroon;
    QColor peach;
    QColor yellow;
    QColor green;
    QColor teal;
    QColor sky;
    QColor sapphire;
    QColor blue;
    QColor lavender;
    QColor text;
    QColor subtext1;
    QColor subtext0;
    QColor overlay2;
    QColor overlay1;
    QColor overlay0;
    QColor surface2;
    QColor surface1;
    QColor surface0;
    QColor base;
    QColor mantle;
    QColor crust;
};

const Palette FrappePalette = Palette{
    .rosewater = "#f2d5cf",
    .flamingo = "#eebebe",
    .pink = "#f4b8e4",
    .mauve = "#ca9ee6",
    .red = "#e78284",
    .maroon = "#ea999c",
    .peach = "#ef9f76",
    .yellow = "#e5c890",
    .green = "#a6d189",
    .teal = "#81c8be",
    .sky = "#99d1db",
    .sapphire = "#85c1dc",
    .blue = "#8caaee",
    .lavender = "#babbf1",
    .text = "#c6d0f5",
    .subtext1 = "#b5bfe2",
    .subtext0 = "#a5adce",
    .overlay2 = "#949cbb",
    .overlay1 = "#838ba7",
    .overlay0 = "#737994",
    .surface2 = "#626880",
    .surface1 = "#51576d",
    .surface0 = "#414559",
    .base = "#303446",
    .mantle = "#292c3c",
    .crust = "#232634",
};
#endif //PALETTE_HPP
