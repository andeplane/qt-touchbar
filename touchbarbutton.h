#ifndef TOUCHBARBUTTON_H
#define TOUCHBARBUTTON_H
#include <QQuickItem>
#ifdef __OBJC__
#import <AppKit/NSButton.h>
#endif

class TouchBarButton : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QString title READ title WRITE setTitle NOTIFY titleChanged)
    QString m_title;

public:
    TouchBarButton();
    ~TouchBarButton();
#ifdef __OBJC__
    NSButton *getNSButton();
    id onPressedBlock();
#endif

    QString title() const;
signals:
    void titleChanged(QString title);
    void pressed();
public slots:
    void setTitle(QString title);
private:
#ifdef __OBJC__
    id m_onPressedBlock;
    NSButton *m_button;
#endif
};

#endif // TOUCHBARBUTTON_H
