//
// Created by CvRai on 25-5-14.
//

#include "palette.hpp"

Palette::Palette(QObject* parent) : QObject(parent)
{
}

Palette::Palette(const Palette& palette)
{
    this->rosewater = palette.rosewater;
    this->flamingo = palette.flamingo;
    this->pink = palette.pink;
    this->mauve = palette.mauve;
    this->red = palette.red;
    this->maroon = palette.maroon;
    this->peach = palette.peach;
    this->yellow = palette.yellow;
    this->green = palette.green;
    this->teal = palette.teal;
    this->sky = palette.sky;
    this->sapphire = palette.sapphire;
    this->blue = palette.blue;
    this->lavender = palette.lavender;
    this->text = palette.text;
    this->subtext1 = palette.subtext1;
    this->subtext0 = palette.subtext0;
    this->overlay2 = palette.overlay2;
    this->overlay1 = palette.overlay1;
    this->overlay0 = palette.overlay0;
    this->surface2 = palette.surface2;
    this->surface1 = palette.surface1;
    this->surface0 = palette.surface0;
    this->base = palette.base;
    this->mantle = palette.mantle;
    this->crust = palette.crust;
}

Palette generateFrappePalette()
{
    Palette palette;
    palette.rosewater = 0xf2d5cf;
    palette.flamingo = 0xeebebe;
    palette.pink = 0xf4b8e4;
    palette.mauve = 0xca9ee6;
    palette.red = 0xe78284;
    palette.maroon = 0xea999c;
    palette.peach = 0xef9f76;
    palette.yellow = 0xe5c890;
    palette.green = 0xa6d189;
    palette.teal = 0x81c8be;
    palette.sky = 0x99d1db;
    palette.sapphire = 0x85c1dc;
    palette.blue = 0x8caaee;
    palette.lavender = 0xbabbf1;
    palette.text = 0xc6d0f5;
    palette.subtext1 = 0xb5bfe2;
    palette.subtext0 = 0xa5adce;
    palette.overlay2 = 0x949cbb;
    palette.overlay1 = 0x838ba7;
    palette.overlay0 = 0x737994;
    palette.surface2 = 0x626880;
    palette.surface1 = 0x51576d;
    palette.surface0 = 0x414559;
    palette.base = 0x303446;
    palette.mantle = 0x292c3c;
    palette.crust = 0x232634;
    return std::move(palette);
}

Palette generateLattePalette()
{
    Palette palette;
    palette.rosewater = 0xdc8a78;
    palette.flamingo = 0xdd7878;
    palette.pink = 0xea76cb;
    palette.mauve = 0x8839ef;
    palette.red = 0xd20f39;
    palette.maroon = 0xe64553;
    palette.peach = 0xfe640b;
    palette.yellow = 0xdf8e1d;
    palette.green = 0x40a02b;
    palette.teal = 0x179299;
    palette.sky = 0x04a5e5;
    palette.sapphire = 0x209fb5;
    palette.blue = 0x1e66f5;
    palette.lavender = 0x7287fd;
    palette.text = 0x4c4f69;
    palette.subtext1 = 0x5c5f77;
    palette.subtext0 = 0x6c6f85;
    palette.overlay2 = 0x7c7f93;
    palette.overlay1 = 0x8c8fa1;
    palette.overlay0 = 0x9ca0b0;
    palette.surface2 = 0xacb0be;
    palette.surface1 = 0xbcc0cc;
    palette.surface0 = 0xccd0da;
    palette.base = 0xeff1f5;
    palette.mantle = 0xe6e9ef;
    palette.crust = 0xdce0e8;
    return std::move(palette);
}

Palette generateMacchiatoPalette()
{
    Palette palette;
    palette.rosewater = 0xf4dbd6;
    palette.flamingo = 0xf0c6c6;
    palette.pink = 0xf5bde6;
    palette.mauve = 0xc6a0f6;
    palette.red = 0xed8796;
    palette.maroon = 0xee99a0;
    palette.peach = 0xf5a97f;
    palette.yellow = 0xeed49f;
    palette.green = 0xa6da95;
    palette.teal = 0x8bd5ca;
    palette.sky = 0x91d7e3;
    palette.sapphire = 0x7dc4e4;
    palette.blue = 0x8aadf4;
    palette.lavender = 0xb7bdf8;
    palette.text = 0xcad3f5;
    palette.subtext1 = 0xb8c0e0;
    palette.subtext0 = 0xa5adcb;
    palette.overlay2 = 0x939ab7;
    palette.overlay1 = 0x8087a2;
    palette.overlay0 = 0x6e738d;
    palette.surface2 = 0x5b6078;
    palette.surface1 = 0x494d64;
    palette.surface0 = 0x363a4f;
    palette.base = 0x24273a;
    palette.mantle = 0x1e2030;
    palette.crust = 0x181926;
    return std::move(palette);
}

Palette generateMochaPalette()
{
    Palette palette;
    palette.rosewater = 0xf5e0dc;
    palette.flamingo = 0xf2cdcd;
    palette.pink = 0xf5c2e7;
    palette.mauve = 0xcba6f7;
    palette.red = 0xf38ba8;
    palette.maroon = 0xeba0ac;
    palette.peach = 0xfab387;
    palette.yellow = 0xf9e2af;
    palette.green = 0xa6e3a1;
    palette.teal = 0x94e2d5;
    palette.sky = 0x89dceb;
    palette.sapphire = 0x74c7ec;
    palette.blue = 0x89b4fa;
    palette.lavender = 0xb4befe;
    palette.text = 0xcdd6f4;
    palette.subtext1 = 0xbac2de;
    palette.subtext0 = 0xa6adc8;
    palette.overlay2 = 0x9399b2;
    palette.overlay1 = 0x7f849c;
    palette.overlay0 = 0x6c7086;
    palette.surface2 = 0x585b70;
    palette.surface1 = 0x45475a;
    palette.surface0 = 0x313244;
    palette.base = 0x1e1e2e;
    palette.mantle = 0x181825;
    palette.crust = 0x11111b;
    return std::move(palette);
}
