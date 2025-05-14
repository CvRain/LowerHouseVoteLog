//
// Created by cvrain on 25-5-12.
//

#ifndef PALETTE_HPP
#define PALETTE_HPP

#include <QQmlEngine>
#include <QColor>

class Palette : public QObject {
    Q_OBJECT
    QML_ELEMENT

public:
    explicit Palette(QObject *parent = nullptr): QObject(parent) {
    }

    ~Palette() override = default;

    QColor rosewater{};
    QColor flamingo{};
    QColor pink{};
    QColor mauve{};
    QColor red{};
    QColor maroon{};
    QColor peach{};
    QColor yellow{};
    QColor green{};
    QColor teal{};
    QColor sky{};
    QColor sapphire{};
    QColor blue{};
    QColor lavender{};
    QColor text{};
    QColor subtext1{};
    QColor subtext0{};
    QColor overlay2{};
    QColor overlay1{};
    QColor overlay0{};
    QColor surface2{};
    QColor surface1{};
    QColor surface0{};
    QColor base{};
    QColor mantle{};
    QColor crust{};
};

class FrappePalette : public Palette {
    Q_OBJECT
    QML_ELEMENT

public:
    explicit FrappePalette(QObject *parent = nullptr): Palette(parent) {
        rosewater = 0xf2d5cf;
        flamingo = 0xeebebe;
        pink = 0xf4b8e4;
        mauve = 0xca9ee6;
        red = 0xe78284;
        maroon = 0xea999c;
        peach = 0xef9f76;
        yellow = 0xe5c890;
        green = 0xa6d189;
        teal = 0x81c8be;
        sky = 0x99d1db;
        sapphire = 0x85c1dc;
        blue = 0x8caaee;
        lavender = 0xbabbf1;
        text = 0xc6d0f5;
        subtext1 = 0xb5bfe2;
        subtext0 = 0xa5adce;
        overlay2 = 0x949cbb;
        overlay1 = 0x838ba7;
        overlay0 = 0x737994;
        surface2 = 0x626880;
        surface1 = 0x51576d;
        surface0 = 0x414559;
        base = 0x303446;
        mantle = 0x292c3c;
        crust = 0x232634;
    }
};

class LattePalette : public Palette {
    Q_OBJECT
    QML_ELEMENT

public:
    explicit LattePalette(QObject *parent = nullptr): Palette(parent) {
        rosewater = 0xdc8a78;
        flamingo = 0xdd7878;
        pink = 0xea76cb;
        mauve = 0x8839ef;
        red = 0xd20f39;
        maroon = 0xe64553;
        peach = 0xfe640b;
        yellow = 0xdf8e1d;
        green = 0x40a02b;
        teal = 0x179299;
        sky = 0x04a5e5;
        sapphire = 0x209fb5;
        blue = 0x1e66f5;
        lavender = 0x7287fd;
        text = 0x4c4f69;
        subtext1 = 0x5c5f77;
        subtext0 = 0x6c6f85;
        overlay2 = 0x7c7f93;
        overlay1 = 0x8c8fa1;
        overlay0 = 0x9ca0b0;
        surface2 = 0xacb0be;
        surface1 = 0xbcc0cc;
        surface0 = 0xccd0da;
        base = 0xeff1f5;
        mantle = 0xe6e9ef;
        crust = 0xdce0e8;
    }
};

class MacchiatoPalette : public Palette {
    Q_OBJECT
    QML_ELEMENT

public:
    explicit MacchiatoPalette(QObject *parent = nullptr): Palette(parent) {
        rosewater = 0xf4dbd6;
        flamingo = 0xf0c6c6;
        pink = 0xf5bde6;
        mauve = 0xc6a0f6;
        red = 0xed8796;
        maroon = 0xee99a0;
        peach = 0xf5a97f;
        yellow = 0xeed49f;
        green = 0xa6da95;
        teal = 0x8bd5ca;
        sky = 0x91d7e3;
        sapphire = 0x7dc4e4;
        blue = 0x8aadf4;
        lavender = 0xb7bdf8;
        text = 0xcad3f5;
        subtext1 = 0xb8c0e0;
        subtext0 = 0xa5adcb;
        overlay2 = 0x939ab7;
        overlay1 = 0x8087a2;
        overlay0 = 0x6e738d;
        surface2 = 0x5b6078;
        surface1 = 0x494d64;
        surface0 = 0x363a4f;
        base = 0x24273a;
        mantle = 0x1e2030;
        crust = 0x181926;
    }
};

class MochaPalette : public Palette {
    Q_OBJECT
    QML_ELEMENT

public:
    explicit MochaPalette(QObject *parent = nullptr): Palette(parent) {
        rosewater = 0xf5e0dc;
        flamingo = 0xf2cdcd;
        pink = 0xf5c2e7;
        mauve = 0xcba6f7;
        red = 0xf38ba8;
        maroon = 0xeba0ac;
        peach = 0xfab387;
        yellow = 0xf9e2af;
        green = 0xa6e3a1;
        teal = 0x94e2d5;
        sky = 0x89dceb;
        sapphire = 0x74c7ec;
        blue = 0x89b4fa;
        lavender = 0xb4befe;
        text = 0xcdd6f4;
        subtext1 = 0xbac2de;
        subtext0 = 0xa6adc8;
        overlay2 = 0x9399b2;
        overlay1 = 0x7f849c;
        overlay0 = 0x6c7086;
        surface2 = 0x585b70;
        surface1 = 0x45475a;
        surface0 = 0x313244;
        base = 0x1e1e2e;
        mantle = 0x181825;
        crust = 0x11111b;
    }
};
#endif //PALETTE_HPP
