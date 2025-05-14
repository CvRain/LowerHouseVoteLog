//
// Created by CvRai on 25-5-14.
//

#ifndef PALETTE_HPP
#define PALETTE_HPP

#include <QQmlEngine>
#include <QColor>

class Palette : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    explicit Palette(QObject* parent = nullptr);
    Palette(const Palette& palette);

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

Palette generateFrappePalette();
Palette generateLattePalette();
Palette generateMacchiatoPalette();
Palette generateMochaPalette();

#endif //PALETTE_HPP
