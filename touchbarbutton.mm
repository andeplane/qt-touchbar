#include "touchbarbutton.h"
// #import <AppKit/AppKit.h>

TouchBarButton::TouchBarButton()
{
    m_button = nil;
    m_onPressedBlock = [^{ emit pressed(); } copy];
}

TouchBarButton::~TouchBarButton() {
    [(id)m_onPressedBlock release];
    if(m_button)
        [m_button release];
}

id TouchBarButton::onPressedBlock()
{
     return m_onPressedBlock;
}

NSButton *TouchBarButton::getNSButton()
{
    m_button = [[NSButton buttonWithTitle:title().toNSString() target:(id)m_onPressedBlock
      action:@selector(invoke)] autorelease]; // TODO: memory issues since we haven't increased retain count
    return m_button;
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
    if(m_button) {
        [m_button setTitle:m_title.toNSString()];
    }

    emit titleChanged(m_title);
}
