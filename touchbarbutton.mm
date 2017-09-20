#include "touchbarbutton.h"
#import <AppKit/AppKit.h>

TouchBarButton::TouchBarButton()
{
    m_onPressedBlock = [^{ emit pressed(); } copy];
}

TouchBarButton::~TouchBarButton() {
    [(id)m_onPressedBlock release];
}

QString TouchBarButton::title() const
{
    return m_title;
}

void TouchBarButton::setTitle(QString title)
{
    if (m_title == title)
        return;

    m_title = title;
    emit titleChanged(m_title);
}
