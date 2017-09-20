#ifndef TOUCHBARSLIDER_H
#define TOUCHBARSLIDER_H
#include <QQuickItem>
#ifdef __OBJC__
#import <AppKit/NSSlider.h>
#endif

class TouchBarSlider : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QString label READ label WRITE setLabel NOTIFY labelChanged)
    Q_PROPERTY(double from READ from WRITE setFrom NOTIFY fromChanged)
    Q_PROPERTY(double to READ to WRITE setTo NOTIFY toChanged)
    Q_PROPERTY(double value READ value WRITE setValue NOTIFY valueChanged)

public:
    TouchBarSlider();
    ~TouchBarSlider();
#ifdef __OBJC__
    NSSlider *getNSSlider();
    id onMovedBlock();
#endif

    double from() const;
    double to() const;
    double value() const;
    QString label() const;

signals:
    void fromChanged(double from);
    void toChanged(double to);
    void valueChanged(double value);
    void labelChanged(QString label);

public slots:
    void setFrom(double from);
    void setTo(double to);
    void setValue(double value);
    void setLabel(QString label);

private:
    QString m_label;
#ifdef __OBJC__
    id m_onMovedBlock;
    NSSlider *m_slider;
#endif
};

#endif // TOUCHBARBUTTON_H
